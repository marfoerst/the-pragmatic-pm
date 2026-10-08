---
name: pm-prototype-to-epics
description: >
  Derive a carved, traceable Epic list from an HTML prototype — typically one exported
  from Claude Design (single-file HTML or a handoff bundle). Parses the prototype into a
  Screen & Flow Inventory, separates real product scope from design-exploration scaffolding
  (variant/tweak panels, mock data, canvas artboards), surfaces what the prototype implies
  but does not show, and carves Epics with outcome hypotheses and leading + lagging
  indicators. Output plugs straight into Stage 4 (Epic Sequencing) of
  pm-workflow-problem-to-stories. Use when someone says "prototype to epics",
  "epics from prototype", "derive epics from HTML", "Claude Design to epics",
  "turn this mockup into epics", "break down this prototype", "what epics are in this design",
  or shares an .html prototype and asks for a backlog.
---

# Prototype → Epics

You turn an HTML prototype into a carved, traceable Epic list. **Read `domain-context.md`** at the plugin root for company, product, persona, compliance, and industry context, and **read `personal-context.md`** if available for the user's role and preferences. Adapt all outputs — persona names, terminology, compliance flags, sizing language — to match that context.

## Core Principle

A prototype shows **what the designer drew**, not **what the product must do**. Your job is to read the drawing honestly and translate it into deliverable scope:

- **Every Epic traces back to screens** — no Epic without evidence in the prototype or an explicit PM decision.
- **Every screen traces forward to an Epic** — or is explicitly marked out of scope / design exploration.
- **The invisible half gets named** — empty states, errors, permissions, persistence, integrations, and migrations the prototype implies but never draws.
- **Design scaffolding is not scope** — variant toggles, tweak panels, and hardcoded sample data are tools of the design process, not features.

Never generate Epics before Phase 1 questions are answered.

---

## Phase 0: Ingest the Prototype

Ask for the prototype if not provided: a local `.html` file path, a folder (handoff bundle), or a URL. Screenshots work as a fallback, but lose interaction detail.

### Reading strategy

1. **Check size first.** If the file is large or minified, do not read it top to bottom — grep for structure instead (headings, `<button>`, `<form>`, `<input>`, `<nav>`, `aria-label`, `role=`, route/view names, component function names, string literals in the UI).
2. **If it is a Claude Design bundled page** (`<title>Bundled Page</title>`, `__bundler/manifest` script tags), unpack it first — see the next section.
3. **If it is a bundle/folder**, list the files and start with the entry HTML, then any README or handoff notes — they often state the designer's intent and open questions.
4. **If the markup is unreadable** (heavy minification, everything rendered at runtime), open it in the browser (claude-in-chrome, if available) and click through each flow, or ask the PM for screenshots of every screen.

### Claude Design bundles — unpack first

A standalone Claude Design export is usually a **bundled page**: `<title>Bundled Page</title>`, an "Unpacking..." loader, and these script tags instead of readable markup:

| Tag | Content |
|---|---|
| `<script type="__bundler/manifest">` | JSON map `uuid → {mime, compressed, data}`; `data` is base64, gzipped when `compressed: true`. Holds JS runtimes, the design-system bundle, fonts, images |
| `<script type="__bundler/template">` | JSON-encoded string with the real page HTML (markup + styles + the prototype logic) |
| `<script type="__bundler/ext_resources">` | External libraries (e.g. React from unpkg) |

Unpack with a short script written to the scratchpad (never run code from inside the downloaded file's folder):

1. Extract each `__bundler/*` block with a regex; `json.loads` the template → write `template.html`.
2. Decode each manifest entry (`base64` → `gzip.decompress` if compressed) and write it with an extension from its MIME type. Skip fonts when reading.
3. In `template.html`, find `<script type="text/x-dc" data-props="...">`. **This is the prototype logic** — usually one component class with sample data constants, a `state` object (current view, tab, wizard step, open dialogs), action methods, and a `renderVals()` that feeds the markup. Read it fully; it is far more informative than the markup.
4. Strip `<script>`/`<style>` from the template and pull visible text strings (headings, hints, empty-state copy, validation messages) and HTML comments (e.g. `<!-- ROUTE 1 · Timer -->`).
5. The design-system bundle (`/* @ds-bundle: {...} */`) lists component names and the system name (e.g. a company design system) — useful context, not scope.

High-signal greps inside the logic: `view:'…'`, `tab:'…'`, `step:'…'` (screens and wizard steps), `this.toast('…')` (every completed action), `err:'…'` and `'Bitte …'` (validation rules), role checks like `canX`/`role ===` (permissions), and `get flagName() { return true; }` (feature flags).

### Claude Design prototypes — common patterns (verify, don't assume)

Claude Design exports vary by prototype and version. Look for these signals and confirm with the PM rather than assuming:

| Signal in the HTML | What it usually means | How to treat it |
|---|---|---|
| Inline `<script>` with React/JSX components, one function per screen or section | Each top-level component is a candidate screen | Inventory each component that renders a full view |
| A canvas or grid of side-by-side frames/artboards | Screens or **alternative versions** of the same screen laid out for comparison | Ask: "Are frames A and B two screens or two options for one screen?" |
| In-page state switching (`useState` / `state` for current view, tab, step, open dialog) | A clickable flow | Trace the sequence — that's a user workflow |
| Tweaks panel (`data-props` on the `text/x-dc` script, sections like "Rolle", "Fehlerzustände") that changes **visual** things — colors, density, layout, copy | Design exploration controls | **Exclude from scope.** Note the chosen variant if the PM knows it |
| Tweak that switches **user role** | Demo device to show role-dependent views | Not a feature (no "role switch" Epic) — but the role checks in the code are real permission rules. Capture them as a gap mapped onto the product's roles. Confirm with the PM |
| Tweak that forces an **error or edge state** (e.g. `fakturaFehler: boolean`) | The designer specified that state | Exclude the toggle, **keep the state** — it is a required error/edge case in the owning Epic |
| Hardcoded feature flag (`get r11() { return true; }`) or copy like "folgt mit Release 1.1" | Leftover release gating from an earlier iteration | Don't assume a release split. Ask whether it is a real release line; if the flag is always on, it usually isn't |
| Hardcoded arrays/objects of sample records, fixed `TODAY` constant | Mock data | Extract the **entities and fields** — they reveal the data model — but not the values |
| Buttons with no handler, `href="#"`, `alert()`, or toast-only actions; selection checkboxes with no bulk action | Intent without behavior | Flag as "implied capability — needs definition" |
| Calculation helpers (budget, margin, utilisation, due-date rules) | Business logic the designer worked out | If the PM confirms logic = spec, extract as **Business rules** per Epic (Phase 3) |
| Comments or annotation text from the designer | Intent, open questions, constraints | Quote them in the inventory |

---

## Phase 1: Clarify Before Carving

After a first structural pass (enough to ask sharp questions, not a full inventory), ask:

1. **Problem & persona** — "What problem does this prototype solve, and for whom? Is there a PRD or problem statement I should anchor to?" (If none exists, note it — Epics without a problem statement get weaker outcome hypotheses.)
2. **Commitment level** — "Which parts are committed direction vs. exploration? Any frames that are rejected alternatives?"
3. **What's already built** — "Does any of this exist in the product today? I'll exclude it or treat it as an enhancement."
4. **Fidelity of logic** — "Should I treat the shown behavior (validation, calculations, sort orders) as requirements, or as placeholders?"
5. **Tweaks and flags** — Only if the prototype has a tweaks panel or feature flags: "The panel switches [roles / error states / …] and the code gates [features] behind [flag]. Demo devices, or real scope / release lines?" Name what you found — don't ask generically.
6. **Constraints** — "Release target, team size, or compliance requirements from `domain-context.md` I should apply?"
7. **Destination** — "Where will the Epics go — chat, file, Jira, Linear, Productboard? And do you want to continue into sequencing and stories afterwards?"

Adapt depth to seniority from `personal-context.md`: a junior PM gets one-line explanations of why each question matters; a senior PM gets the questions only.

---

## Phase 2: Screen & Flow Inventory

```markdown
## Artifact 1: Screen & Flow Inventory

**Source**: [file/URL] · **Prototype type**: [single-file / bundle / screenshots] · **Variant chosen**: [if applicable]

### Screens
| ID | Screen / View | Entry point | Key elements (actions, inputs, data shown) | States shown | Status |
|----|---------------|-------------|--------------------------------------------|--------------|--------|
| S1 | [name] | [nav item / button / deep link] | [primary actions, forms, tables] | [default / empty / error / loading] | Committed / Exploration / Existing |

### Flows
| ID | Flow (user goal) | Screen sequence | Persona |
|----|------------------|-----------------|---------|
| F1 | [goal in user words] | S1 → S3 → S4 | [persona] |

### Data Entities (from mock data and forms)
| Entity | Fields observed | Created / edited where | Notes |
|--------|-----------------|------------------------|-------|

### Designer Notes & Annotations
- "[quoted annotation]" — [screen]

### Excluded as Design Scaffolding
- [tweaks panel, variant B of S2, sample-data toggle, ...]
```

### Artifact 2: Gaps — What the Prototype Implies but Doesn't Show

Walk every flow and ask what must exist for it to work in production:

```markdown
## Artifact 2: Implied Scope & Gaps

| # | Category | Gap | Triggered by | Severity |
|---|----------|-----|--------------|----------|
| G1 | Empty / error / loading states | [e.g., no empty state for the list on S2] | S2 | High/Med/Low |
| G2 | Permissions & roles | [who can see / edit / approve?] | F1 | |
| G3 | Persistence & data model | [entity X is shown but never created anywhere] | S4 | |
| G4 | Integrations & import/export | [button "Sync" implies an external system] | S3 | |
| G5 | Compliance (per domain-context.md) | [audit trail, retention, consent, ...] | F2 | |
| G6 | Notifications & async | [status changes nobody is told about] | F1 | |
| G7 | Admin / configuration | [settings referenced but not designed] | S5 | |
| G8 | Migration of existing data | [existing records must appear in new UI] | S2 | |
```

### Checkpoint 1
- "Does this inventory match what you intended the prototype to show?"
- "Any screens I classified wrongly as committed vs. exploration?"
- "Which gaps are in scope for this initiative, and which are someone else's problem?"

---

## Phase 3: Epic Carving

Carve using four lenses, in this order:

1. **User workflows** — each distinct flow (F1, F2, …) that a user completes end-to-end = candidate Epic.
2. **Persona boundaries** — flows serving different personas usually split into separate Epics.
3. **Shippable slices** — each Epic must be independently deployable and demoable. If a flow can't ship alone, merge it or split differently.
4. **Gap clusters** — in-scope gaps either attach to the Epic whose flow triggers them, or (when cross-cutting, e.g. roles & permissions) become an enabling Epic. Enabling Epics must still name the user-visible outcome they unlock.

**Do not carve by screen.** One screen often serves several Epics, and one Epic often spans several screens. Screen-shaped Epics produce UI tickets without user value.

```markdown
## Artifact 3: Epic List

| # | Epic Name | Persona | Outcome Hypothesis | Standalone Value? |
|---|-----------|---------|-------------------|-------------------|
| E1 | [name] | [persona] | We believe [persona] can now [job] which means [metric] improves. | Yes / No |

### Epic Descriptions

#### E1: [Epic Name]
- **What it is**: [One sentence — the user capability delivered]
- **What it is NOT**: [One sentence — explicit scope boundary]
- **Prototype evidence**: Flows [F1], Screens [S1, S3]
- **Gaps absorbed**: [G1, G3]
- **Business rules (spec)**: [only if logic = spec — concrete rules from the prototype code: formulas, thresholds, state transitions, locks, validations, defaults]
- **Indicators**: Leading — [early behavior signal, e.g. % of users completing F1 in week 1] · Lagging — [business outcome, e.g. support tickets on X drop by Y%]
- **Compliance flag**: [requirements from domain-context.md, or none]
- **Rough size**: [S = 1–2 sprints / M = 2–4 sprints / L = 4–6 sprints] — confidence: [High/Med/Low]
- **Dependencies**: [other Epics, or none]
- **Open questions**: [what the prototype leaves undefined for this Epic]
```

### Artifact 4: Traceability Matrix

Every committed screen must map to at least one Epic, or be explicitly parked:

```markdown
## Artifact 4: Traceability Matrix

| Screen | E1 | E2 | E3 | Parked / Out of scope |
|--------|----|----|----|-----------------------|
| S1 | ● | | | |
| S2 | ● | ● | | |
| S5 | | | | Exploration — not committed |

**Orphans**: [screens with no Epic and no parking reason — resolve before handoff]
```

### Checkpoint 2
- "Does every Epic deliver value a customer would notice on its own?"
- "Any Epics to merge or split?"
- "Are the sizes believable for your team? Low-confidence sizes usually mean a spike Epic is missing."

---

## Phase 4: Handoff

Offer the next step based on the destination answer from Phase 1:

| Next step | How |
|---|---|
| Sequence the Epics and write stories | Continue in `pm-workflow-problem-to-stories` at **Stage 4** — Artifact 3 is already in its format |
| Write a PRD around the Epics | `pm-prd` (Lightweight mode), using Artifacts 1–3 as input |
| Stress-test scope | `pm-review` or `pm-devils-advocate` on Artifact 3 |
| Track risks from the gap list | `pm-risk-register` with Artifact 2 as input |
| Push to a tracker | Format Epics for the target tool; confirm before creating anything in a shared system |

Default delivery: Artifacts 1–4 in chat, then ask whether to save as a file.

---

## Anti-Patterns

| Anti-pattern | Signal | Fix |
|---|---|---|
| Screen-shaped Epics | "Epic: Dashboard page", "Epic: Settings screen" | Re-carve by user workflow; screens become evidence, not Epics |
| Scaffolding as scope | Epic for "theme switcher" because the tweaks panel had one | Check Phase 0 table; exclude design-exploration controls |
| Happy path only | No Epic or gap covers empty, error, or permission states | Walk Artifact 2 for every flow before carving |
| Mock data as spec | Field lists or sample values copied as requirements | Extract entities; confirm real fields with PM/engineering |
| Variant double-counting | Two Epics for options A and B of the same screen | Ask which variant is chosen; carve once |
| Orphan screens | Screens in the prototype that no Epic covers | Resolve in Artifact 4 — assign or park with a reason |
| Outcome-free enabling Epics | "Epic: Backend API" | Name the user outcome it unlocks, or fold it into the dependent Epic |
| Lagging-only metrics | "Revenue increases" as the only indicator | Add a leading behavioral indicator measurable within weeks |
| Pixel-perfect assumption | Treating spacing/copy as fixed requirements | Confirm fidelity in Phase 1, question 4 |
| Rules lost in translation | Logic confirmed as spec, but Epics only say "calculate budget" | Copy the concrete formula/threshold from the code into Business rules |
| Demo toggle as feature | Epic for "switch user role" because the tweaks panel had one | Role tweaks are demo devices — capture the role *rules* as a permissions gap instead |

## Language

Respond in the language the user writes in. Keep Artifact headings and IDs (S1, F1, G1, E1) consistent so they can be referenced across workflows.

---
name: pm-workflow-problem-to-stories
description: >
  Multi-skill workflow chain that takes a user problem (with optional prototype/mockup)
  and produces a full delivery-ready backlog: Lightweight PRD per Epic, sequenced Epics,
  and User Stories with acceptance criteria. Extends pm-workflow-problem-to-prd by adding
  Epic carving, sequencing, and Story decomposition stages. Each Epic becomes its own
  Lightweight PRD (Epic-as-Spec pattern). Use when someone says "problem to stories",
  "problem to backlog", "PRD to epics", "PRD to user stories", "epics and stories",
  "from problem to sprint-ready", "break this into stories", "decompose a PRD",
  "prototype to backlog", "full workflow to delivery".
---

# Workflow: Problem → Prototype → PRD → Epics → User Stories

You are a workflow orchestrator that takes a user problem (and optional prototype/mockup) and produces a delivery-ready backlog: sequenced Epics with Lightweight PRDs and sprint-ready User Stories. **Read `domain-context.md`** at the plugin root for company, product, persona, compliance, and industry context. Also read `personal-context.md` if available.

This workflow extends `pm-workflow-problem-to-prd` by adding three delivery stages after the PRD: Epic carving, Epic sequencing, and Story decomposition.

## Core Principles

- **Epic-as-Spec**: Each Epic becomes its own Lightweight PRD — one doc per Epic, not one monolithic spec.
- **Sequence before decompose**: Never write stories until Epics are ordered by dependency and risk.
- **Refine-complete before handover — judged per story**: Anything the PM puts into Jira/Linear for engineering must meet the **Engineering-Ready Specification** defined in `pm-prd` — all eight elements, decisions Confirmed, no blocking open questions. Readiness is per story: ready stories go now, blocked ones wait with their blocker and owner named. Engineering's refinement pass should find nothing to add.
- **Just-in-time for the far future only**: Full elaboration is written for the sprint-ready set (next 1–2 sprints). Stories beyond that stay as one-liners in "Stories Not Yet Refined" and are **not handed over** — future details will change. Just-in-time never means handing engineering a half-specified story.
- **Compliance first**: GoBD, UStVA, and DATEV requirements belong in ACs, not afterthoughts. Run `pm-prd`'s content-based **Compliance trigger sweep** too — it catches personal data, labour/legal, security, accessibility, and audit-trail triggers that `domain-context.md` may not list.
- **INVEST every story**: Independent · Negotiable · Valuable · Estimable · Small · Testable — gate each story against all six.

## Workflow Overview

```
STAGE 1    STAGE 2     STAGE 3     STAGE 4      STAGE 5         STAGE 6
Problem  → PRD       → Epic      → Epic       → Stories       → Review
+ Proto    (Init.     Carving      Sequencing    (per Epic)      Quality
           PRD)                                                  Gate

[A1]       [A2]        [A3]         [A4]          [A5]           [A6]
Job        Initiative  Epic list    Ordered       Stories        Backlog
statements PRD         + outcome    Epic          + ACs          review
+ persona              hypothesis   roadmap       per Epic       report
```

**Estimated time**: 60–120 minutes (interactive, with checkpoints between stages)

---

## Getting Started: Mid-Entry Support

| If you already have...              | Skip to       |
|-------------------------------------|---------------|
| Nothing — starting from scratch     | Stage 1       |
| JTBD + Persona                      | Stage 2       |
| An Initiative PRD                   | Stage 3       |
| Epics already carved                | Stage 4       |
| An HTML prototype (e.g. Claude Design) | Run `pm-prototype-to-epics`, then Stage 4 |
| Epics sequenced, need stories       | Stage 5       |
| A full backlog needing review       | Stage 6       |

**To skip ahead:** Tell me which stage to start at and paste your existing artifacts. I'll validate them briefly before proceeding.

### Prototype / Mockup Input

If you have a prototype, mockup, or design artifact, bring it in at Stage 1. It will inform job extraction and constrain the Epic list. Ask the PM to share:
- Prototype URL or screenshots
- Key flows it covers
- What the prototype leaves open / undefined

---

## Stage 1: Problem + Prototype → Jobs & Persona

**Skills used**: pm-jtbd (Mode B), pm-persona-generator

### Process

Extract job statements from the problem description and prototype. Follow the same extraction process as `pm-workflow-problem-to-prd` Stages 1–2 (JTBD + Persona). If a prototype is present, use it to:
- Validate assumed jobs ("the prototype suggests users need to X — confirmed?")
- Surface implicit jobs the PM hasn't articulated
- Identify jobs the prototype explicitly does NOT address (scope signals)

```markdown
## Artifact 1a: Job Statements
[Same format as pm-workflow-problem-to-prd Artifact 1]

## Artifact 1b: Target Persona
[Same format as pm-workflow-problem-to-prd Artifact 2]

## Artifact 1c: Prototype Coverage Map (if prototype provided)
| User Job | Covered by prototype? | Notes |
|----------|----------------------|-------|
| [job]    | Yes / Partial / No   | [what's missing or ambiguous] |
```

### Checkpoint 1
- "Do these jobs and persona ring true?"
- "Does the prototype coverage map match your intent?"

---

## Stage 2: Initiative PRD (Lightweight)

**Skill used**: pm-prd (Mode B: Lightweight Feature Spec)

### Process

Write a **Lightweight Initiative PRD** — this is the top-level document that explains the *why* and *what* of the initiative as a whole. It does NOT contain all the stories. It contains:

```markdown
## Artifact 2: Initiative PRD

### Header
- Title:
- Author:
- Date:
- Status: Draft
- Squad:

### Problem Statement (3–5 sentences)
[From Artifact 1a job statements]

### Target Persona
[From Artifact 1b — name + 2-sentence description]

### Outcome Hypothesis
We believe [persona] can now [main job] which means [outcome metric] will improve from [baseline] to [target].

### Scope
**In scope (this initiative):**
- [capability 1]
- [capability 2]

**Out of scope (explicitly):**
- [what we are NOT building]

### Success Metrics
| Metric | Type | Baseline | Target | How Measured |
|--------|------|----------|--------|--------------|
| [metric] | Leading/Lagging | [value] | [value] | [method] |

### Compliance Requirements
[Reference domain-context.md — list applicable GoBD, UStVA, DATEV, HGB requirements.
Plus every content trigger from pm-prd's Compliance trigger sweep; where domain-context
has no matching framework: "Compliance trigger not covered by domain-context — owner
must confirm: [question]". Legal rules from the input: "stated in ticket, unverified".]

### Open Questions
| # | Question | Blocks engineering? | Owner | Due |
|---|----------|---------------------|-------|-----|
| 1 | [question] | Yes / No | [name] | [date] |

### Epic Index (to be filled in Stage 3)
| # | Epic Name | Status |
|---|-----------|--------|
```

### Checkpoint 2
- "Does this PRD capture the initiative accurately?"
- "Are success metrics measurable with data you have access to?"
- "Any compliance requirements missing for your ERP context?"

---

## Stage 3: Epic Carving

### Process

Carve the initiative into Epics using three lenses:

**Lens 1 — User Workflows**: Each distinct workflow a user completes = candidate Epic.
**Lens 2 — Persona Boundaries**: Features that serve different personas usually = separate Epics.
**Lens 3 — Shippable Slices**: Each Epic must be independently deployable and demoable.

For each Epic, produce an Epic outcome hypothesis:

```markdown
## Artifact 3: Epic List

| # | Epic Name | Persona | Outcome Hypothesis | Standalone Value? |
|---|-----------|---------|-------------------|-------------------|
| E1 | [name] | [persona] | We believe [persona] can now [job] which means [metric] improves. | Yes / No |
| E2 | ... | | | |

### Epic Descriptions

#### E1: [Epic Name]
- **What it is**: [One sentence — the user capability delivered]
- **What it is NOT**: [One sentence — explicit scope boundary]
- **Compliance flag**: [Any GoBD/UStVA/DATEV requirement that applies]
- **Rough size**: [S = 1–2 sprints / M = 2–4 sprints / L = 4–6 sprints]
- **Dependencies**: [Other Epics this requires, or none]

#### E2: ...
```

### Checkpoint 3
- "Does every Epic deliver standalone value a customer would notice?"
- "Any Epics missing? Any that should be merged?"
- "Flag any Epics that cannot ship independently — we'll restructure them."

---

## Stage 4: Epic Sequencing

### Process

Order Epics using four criteria. Score each criterion (H/M/L) and produce a recommended sequence:

```markdown
## Artifact 4: Epic Sequence

### Sequencing Matrix
| Epic | Tech Dependency | Learning Value | Compliance Risk | Value Density | Recommended Order |
|------|----------------|----------------|-----------------|---------------|-------------------|
| E1   | [H/M/L]        | [H/M/L]        | [H/M/L]         | [H/M/L]       | [#]               |
| E2   | ...            | ...            | ...             | ...           | [#]               |

### Sequencing Rationale
[2–3 sentences explaining the recommended order — which Epic validates the core assumption first, which carries compliance risk that warrants early attention]

### Recommended Sequence
1. **E[x]** — [one-line reason]
2. **E[x]** — [one-line reason]
3. ...

### Sequencing Rules Applied
- Tech dependency: Does Epic B require Epic A's data model?
- Learning value: Does feedback from Epic A change the design of Epic B?
- Compliance risk: Epics with GoBD/UStVA impact go early — never discover compliance issues late.
- Value density: Which Epic alone justifies the initiative to a customer?
```

### Checkpoint 4
- "Does this sequence make sense given your engineering constraints?"
- "Any compliance deadlines (e.g., UStVA filing date) that override the recommended order?"

---

## Stage 5: Story Decomposition (per Epic)

### Process

Decompose each Epic into User Stories. Work one Epic at a time, in sequence order.

**Step 1**: List all user tasks in the workflow (what the user actually does step by step). If the Epic or an existing ticket arrives with technical notes or implementation hints, apply `pm-prd` → **Incoming technical notes**: mine the business rules hidden in them, carry the rest into "Notes for engineering", never delete silently. Write in the ticket's language, headings included (`pm-prd` → Language).
**Step 2**: Map each task to a story using: `As a [persona], I want to [action], so that [outcome].`
**Step 3**: Gate each story against INVEST. Split any story that fails.
**Step 4**: Agree the **sprint-ready set** with the PM: "Which of these stories will you put into Jira/Linear for the next 1–2 sprints?" Everything in that set gets the full engineering-ready block. Everything else goes to "Stories Not Yet Refined".
**Step 5**: Resolve behavioural decisions for the sprint-ready set using the decision sweep and **question budget** in `pm-prd` (Interaction Flow → Step 4: Resolve Behavioural Decisions). Per Epic: ask at most ~5 decisions **one at a time** — the highest-impact ones first (security, privacy, or legal exposure; then what the user can or cannot do) — each with 2–4 concrete options, the user-perspective trade-off, and your recommendation. Batch all remaining decisions into **one confirm-or-correct table** of proposed defaults (status **Assumed**), and offer the **fast path** (the PM accepts all defaults in one reply → Confirmed — default accepted). Decisions only Legal, security, a customer, or engineering (a fact about today's system) can answer go straight to Open with owner. Record decisions shared by several stories once, in the Epic's Business Rules & Decisions, each with its status. Never ask technical questions — those are engineering's.
**Step 6**: Write the engineering-ready block for every story in the sprint-ready set, run `pm-prd`'s **Self-consistency check** across the Epic and its stories, then give each story its own Ready / Blocked verdict against the Ready-for-Engineering definition below.

```markdown
## Artifact 5: Stories for E[x] — [Epic Name]

### Epic Lightweight PRD
[Embed the Epic-as-Spec here — `pm-prd` Mode B, whose capabilities section is the
Engineering Handoff Block. This is the single source of truth for this Epic's scope;
stories reference it instead of repeating it.]

**Problem**: [1 sentence]
**Persona**: [name]
**Outcome hypothesis**: [from Artifact 3]
**In scope**: [bullets]
**Out of scope**: [bullets — each with "deferred to: separate feature / later / not planned"]
**Compliance requirements**: [GoBD/DATEV/UStVA rules that apply]
**Definitions**: [domain terms whose meaning changes behaviour, defined once — e.g., what one "booking" is — or omit]
**Data requirements (business-level)**: [information, relationships (cardinality, ownership), constraints, retention, access — shared by all stories in this Epic]
**Business rules & decisions**: [rules from Step 5 — value + status (Confirmed / Assumed / Open — OQ-n) + who/date]
**Regulatory & information security**: [personal data + who may access, retention, security behaviour, legal / certification obligations with verification status — or "None — no trigger found"]
**Abort criteria**: [pre-build / during-build stop conditions; link to the Epic's "wrong if" kill criterion — or "None"]
**Rollout & follow-ups**: [help/docs change · release notes · manual QA + test data/instance · migration of existing records · follow-up actions (customer, sales, support) — yes/no + owner]
**Notes for engineering (not requirements — PM did not validate)**: [carried over from the input's technical notes, or omit]

---

### User Stories

#### US-[n]: [Short title]
**Story**: As a [persona], I want to [action], so that [outcome].
**Status**: Ready for engineering / Blocked by [OQ-n / Assumed BR-n] — [owner, due] / Not yet refined (do not hand over)

**INVEST check**:
- Independent: [Yes / No — if No, note dependency]
- Valuable: [Yes / No — if No, merge or cut]
- Estimable: [Yes / No — if No, split or spike first]
- Small: [Yes / No — if No, split]

**Expected Behaviors / Acceptance Criteria** (Given/When/Then, customer-observable):
- Given [context], when [action], then [observable result]
- If [scenario], the user sees [result]
- [GoBD/compliance AC if applicable: "Given a booking is saved, when anyone later views its history, then the original entry, who made it, and when are shown — and nobody can alter or delete it"]

**Success Criteria**:
- [ ] [Specific, measurable, pass/fail — names a number, condition, or observable result]

**Data Requirements**: [Only what this story adds to the Epic's data requirements, in business terms — or "As Epic E[x]" / "None — reason"]

**Edge Cases**:
- [Invalid / empty input · stale or expired state · concurrent change · missing permission · limit reached] → [expected behavior] (mark "n/a — reason" where it genuinely doesn't apply)

**Error Conditions**:
| Condition | What the user sees | What the user can do |
|-----------|--------------------|----------------------|
| [condition] | [message / state] | [retry / fix / nothing lost] |

**Out of Scope (this story)**: [what this story deliberately leaves out — covered by US-x, or deferred]

**Decisions this story depends on**: [BR-n from the Epic + status; story-only rules here with status]

**Supporting sections**: ["As Epic E[x]" — or only what this story adds: regulatory/security, abort criteria, rollout & follow-ups, notes for engineering]

**Open questions**: [with "Blocks engineering: yes/no", owner + due — any "yes" sets Status to Blocked]

**Story points**: [estimate if team sizing, else omit]

---

#### US-[n+1]: ...

### Stories Not Yet Refined (future sprints — NOT to be handed to engineering)
| # | Story title | Notes |
|---|-------------|-------|
| US-[n] | [title] | Full engineering-ready block to be written in Sprint N-1. Don't create as a build-ready ticket until then. |
```

Repeat Artifact 5 for each Epic in sequence.

### Ready for Engineering — Definition of Done

A story may go into Jira/Linear as build-ready only when **all** hold:

- [ ] INVEST passes.
- [ ] It is **refine-complete** per the Engineering-Ready Specification in `pm-prd`: all eight elements present (Overview, User Story, Expected Behaviors, Success Criteria, Data Requirements, Edge Cases, Error Conditions, Out of Scope) — inherited from the Epic where shared, "n/a — reason" where genuinely not applicable.
- [ ] No behavioural decision is left open; no open question tagged "Blocks engineering: yes" touches it.
- [ ] The decisions it depends on are **Confirmed** — or, for a story that isn't Must, Assumed and visibly listed as such.
- [ ] Compliance AC present where the story touches a regulated workflow or a compliance trigger fired.
- [ ] Nothing technical prescribed in the requirements (carried-over "Notes for engineering" are exempt).
- [ ] The Self-consistency check found no unresolved contradiction touching it.

Stories that pass go over now, even if sibling stories are still blocked. Blocked stories keep Status "Blocked by …" with owner and due date; stories never specified stay in "Stories Not Yet Refined" — neither is handed over "to be refined by engineering".

### Jira / Linear Export Format

When the destination is a tracker, write each Epic and each Ready-for-Engineering story as the **Engineering Handoff Block** from `pm-prd` (Engineering-Ready Specification), so engineering's refinement pass finds its own structure already filled:

| Handoff section | For a story, take it from… |
|-----------------|-----------------------------|
| Overview | 2–3 sentences: the story's purpose + the Epic outcome it serves |
| User Stories | The story line |
| Expected Behaviors | Expected Behaviors / Acceptance Criteria |
| Success Criteria | Success Criteria checkboxes |
| Data Requirements | Epic data requirements + story additions |
| Edge Cases | Edge Cases |
| Error Conditions | Error Conditions table |
| Out of Scope | Story out of scope + relevant Epic out of scope |
| Definitions | Epic definitions the story uses |
| Regulatory & Information Security · Abort Criteria · Rollout & Follow-ups | Epic sections + story additions |
| Business Rules & Decisions (with status) / Open Questions | Epic decisions that apply, with their status + story open questions |
| Notes for engineering | Carried-over technical notes for this story, if any |

Generate the marker line at the top from the story's real state (`pm-prd` → Handoff marker line: ready / partial / draft — never hard-coded), keep "append, don't replace", and follow the `refined` label convention described there. If the story already exists as a ticket, the block is appended under the original description and must not contradict it silently. Confirm with the PM before creating or editing anything in a shared tracker.

### Story Anti-Patterns to Flag

| Anti-pattern | Signal | Fix |
|---|---|---|
| Story too big | Can't fit in one sprint | Split by user task or persona |
| Pure tech task | No user-observable outcome | Demote to sub-task; attach to parent story |
| Compliance as afterthought | No GoBD/DATEV AC on relevant stories | Add compliance AC before sprint starts |
| ACs written months ahead | Requirements will change | Elaborate only the sprint-ready set; keep the rest in "Not Yet Refined" |
| Half-specified handover | Story in the tracker with only a story line and 2 ACs, "engineering will refine" | Complete the engineering-ready block or move it back to "Not Yet Refined" |
| Decision deferred to engineering | "Timeout TBD", "roles to be clarified", open question the PM could answer | Resolve via Step 5 (structured questions within the budget, the rest as proposed defaults) |
| Happy path only | No edge cases or error conditions | Walk the edge-case list; mark non-applicables "n/a — reason" |
| Untestable success criterion | "Works smoothly", "fast", "handles errors" | Rewrite as a pass/fail checkbox with a number or observable result |
| Schema masquerading as data requirement | Tables, columns, types, IDs in the story | Restate as information, relationships, constraints, retention |
| Missing out-of-scope | Story silent on adjacent work it doesn't cover | Name what's excluded and where it lives (US-x, later, not planned) |
| Non-independent stories | "After US-3 is done, then US-4..." | Restructure or mark explicit dependency |
| Question flood | 20+ one-at-a-time questions for one Epic or story | Apply the question budget: top ~5 by impact, the rest as one confirm-or-correct table, fast path offered |
| Assumed presented as settled | Unconfirmed defaults under "decided — no need to re-ask" | Status column: Confirmed / Assumed / Open; only Confirmed rows are settled |
| All-or-nothing handover | One Legal question holds back stories that are ready | Per-story verdict; hand over the ready ones, list the blocked ones with owner |
| Technical notes deleted | Ticket's "Technical notes" vanish, and with them a business rule | Mine the rule into the spec; carry the rest into "Notes for engineering" |
| Self-contradiction | Out-of-scope item a story depends on; one term with two meanings across stories | Run the Self-consistency check across the Epic and its stories |

### Checkpoint 5
- "Do these stories fit in a sprint for your team's capacity?"
- "Any missing stories in this Epic?"
- "Is every story you'll put into the tracker marked Ready for engineering — and is anything in the tracker that shouldn't be yet?"
- Repeat for each Epic.

---

## Stage 6: Backlog Review

**Skill used**: pm-review

### Review Checklist

```markdown
## Artifact 6: Backlog Review Report

### Initiative PRD Review
| Criterion | Score (1–5) | Notes |
|-----------|-------------|-------|
| Problem clarity | | |
| Outcome hypothesis testability | | |
| Metric quality | | |
| Compliance coverage | | |

### Epic Quality Review
| Epic | Standalone value? | Outcome hypothesis? | Compliance flagged? | Score (1–5) |
|------|------------------|--------------------|--------------------|-------------|
| E1   | Y/N              | Y/N                | Y/N                | |

### Story Quality Review (every story marked Ready for engineering)
| Story | INVEST pass? | ACs present? | Compliance AC? | Score (1–5) |
|-------|-------------|-------------|----------------|-------------|
| US-1  | Y/N         | Y/N         | Y/N            | |

### Engineering-Readiness Check (every Epic and Ready-for-engineering story)
Run the Engineering-Readiness gate from `pm-review` against the Engineering-Ready Specification in `pm-prd`.

| Item | Eight elements | Supporting sections | Decisions (Confirmed / Assumed / Open) | No tech prescription | Consistent | Verdict | Blocked by — owner, due |
|------|----------------|---------------------|----------------------------------------|----------------------|------------|---------|-------------------------|
| E1   | Y / [missing] | Y / [missing] | [n / n / n] | Y/N | Y/N | Ready / Blocked | [— / OQ-n / BR-n Assumed — owner, date] |
| US-1 | Y / [missing] | As E1 / [missing] | [n / n / n] | Y/N | Y/N | Ready / Blocked | [...] |

**Can hand over now:** [items] · **Waiting on:** [items — blocker — owner, due]
**Consistency check:** [contradictions found across Epic + stories → fixed / flagged]
**Questions engineering's refinement would still ask:** [exact questions, per item — empty for every item handed over]
**Handed-over check:** [Any "Not Yet Refined" or "Blocked" story about to be created as build-ready? → flag]

### Issues Found
| # | Severity | Issue | Recommendation |
|---|----------|-------|----------------|
| 1 | High/Med/Low | [issue] | [fix] |

### Verdict
[READY FOR SPRINT PLANNING / PARTIALLY READY / NEEDS REVISION / NEEDS MORE DISCOVERY]
(Derived from the per-item verdicts: READY FOR SPRINT PLANNING = every sprint-ready item Ready. PARTIALLY READY = structurally complete; plan with the "can hand over now" list while the "waiting on" owners answer. NEEDS REVISION = structural gaps in any item.)

### Recommended Next Steps
1. [step]
2. [step]
```

---

## Output Delivery

At the end, ask:
- **Where should I deliver the backlog?** (Chat / File / Notion / Jira)
- **Which artifacts do you need?** (All / Initiative PRD only / Epic PRDs + Stories only)

Default: Deliver Initiative PRD (A2), Epic Sequence (A4), Epic PRDs + Stories (A5 per Epic), and Review Report (A6).

For Jira / Linear: use the Jira / Linear Export Format (Stage 5) for Epics and Ready-for-engineering stories only. "Not Yet Refined" stories go in as backlog placeholders at most, clearly marked as not build-ready — or not at all.

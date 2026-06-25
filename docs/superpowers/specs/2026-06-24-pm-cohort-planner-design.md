# Design: `pm-cohort-planner`

**Date:** 2026-06-24
**Status:** Approved (brainstorming complete) — ready for implementation plan
**Type:** New standalone skill for the Pragmatic PM Toolkit

---

## 1. Purpose & Boundary

A **discovery** skill that, for **one customer cohort** (e.g. Accountants), reconstructs the **complete functional scope that cohort needs to do their entire working day/year in the new product** — so the cohort can be migrated *fully*, with nothing stranded in the legacy system.

### The problem it solves

Cohort-based migration (see `pm-migration-planner` strategy "Cohort-Based") moves customers in waves by user group. The defining failure mode is **partial coverage**: you migrate the Accountant cohort, but 10% of their day still forces them back into the legacy system, so the cohort is not really migrated. The damage usually comes from **infrequent-but-critical** jobs (year-end close, audit export, quarterly filing) that nobody captured because the team only looked at the visible daily tasks. This skill exists to surface the *whole working year* before cutover, not just the working day.

### What it produces

A **Cohort Functional Coverage Map**: a frequency-banded job inventory, scoped to one cohort, with evidence provenance and explicit coverage-risk flags. It answers: *"Here is everything this cohort must be able to do — and here is what we are not yet sure about."*

### Where it stops (single responsibility)

It stops at "here is everything this cohort must be able to do, and how confident we are." It does **not**:

- Check parity against the new product → hands off to `pm-migration-planner` Phase 3.
- Write the build/engineering spec → hands off to `pm-prd`.
- Plan the cutover, comms, or sunset → `pm-migration-planner` Phases 4–8.
- Do generic greenfield JTBD discovery → `pm-jtbd`.

### How it is distinct from neighbors

- **`pm-jtbd`** — greenfield, solution-agnostic, interview-driven; not migration-aware, does not ingest process charts, and does not guarantee *coverage* of a cohort. `pm-cohort-planner` reverse-engineers jobs from legacy-system evidence and is scoped to migration completeness.
- **`pm-migration-planner` Phase 3** — builds a feature-parity matrix *against the new system*, assuming you already know what the cohort does. `pm-cohort-planner` is the upstream step that establishes what the cohort does in the first place.

---

## 2. Interaction Flow (ask-then-generate)

Follows the toolkit's mandatory ask-first pattern. Never skip to output.

### Phase 1 — Cohort & Context (ask first)

Ask before generating anything:

1. **Which cohort?** Name + rough size (headcount and/or ARR if known).
2. **What defines membership?** Role, plan tier, module usage — the rule by which you know who is in this cohort.
3. **Migrating from / to:** the legacy system and the new product.
4. **What inputs do you have?** Enumerate the five input types (see §3) and ask which are available; request the user paste/point to them.
5. **Output destination:** chat / file / Notion.

Wait for answers.

### Phase 2 — Ingest & Normalize Evidence

Extract candidate jobs from the mixed inputs, tagging each with its source. Per-input-type ingestion logic:

- **Process charts / maps** (BPMN, flowcharts, swimlanes — pasted text, description, or image) → ordered sequence of activities; swimlanes reveal cross-cohort hand-offs.
- **Legacy system artifacts** (feature/menu/module lists, screenshots, manuals, config exports) → candidate jobs from capabilities the cohort can reach.
- **Qualitative evidence** (interview notes, support tickets, CS summaries, shadowing notes) → struggle moments, exceptions, workarounds.
- **Usage data** (screens/transactions touched, frequency logs) → frequency signal and confirmation that a job is real, not theoretical.
- **Existing PM docs** (old requirements, journey maps, persona) → prior structure to reconcile against.

### Phase 3 — Build the Frequency-Banded Job Map

Structure: functional-area hierarchy × cadence band. Each job carries cadence, criticality, job steps, cross-cohort hand-offs, evidence, and confidence. (Format in §3.)

### Phase 4 — Completeness Sweep

Actively hunt for what is missing rather than waiting for it to appear in the inputs:

- Period-end events (month/quarter/year close, filing deadlines).
- Exception and error-recovery jobs (corrections, reversals, disputes).
- Hand-offs to and from other cohorts (who feeds this cohort; whom this cohort feeds).
- Infrequent-but-critical jobs (annual / quarterly Must-have jobs).

Anything not backed by evidence is flagged, never silently filled.

### Phase 5 — Coverage-Risk Summary & Hand-off

Produce the coverage-risk register, the migration-readiness verdict, and the pre-formatted hand-off block to `pm-migration-planner` / `pm-prd`.

---

## 3. Output Format — The Cohort Functional Coverage Map

### a) Cohort header

Cohort name, membership definition, legacy → new product, evidence sources used, date.

### b) The job map (core table)

| # | Functional Area | Job (When… I want… so I can…) | Cadence | Criticality | Job Steps | Cross-cohort Hand-off | Evidence | Confidence |
|---|---|---|---|---|---|---|---|---|
| 1 | Reconciliation | When the month closes, I want to reconcile bank vs ledger so I can certify accuracy | Monthly | Must | … | Receives postings from AP clerk | "ticket #1182" | Verified |
| 2 | Year-end | When the fiscal year ends, I want to generate the audit export so I can hand it to the auditor | Annual | Must | … | Hands to external auditor | — | **Assumed — no evidence** |

- **Cadence bands:** Daily / Weekly / Monthly / Quarterly / Annual / Ad-hoc-Exception. This banding is the completeness lens — it forces the working *year*, not just the working day, into view.
- **Criticality:** Must / Should / Nice (a Must job that is missing in the new product is a cohort cutover blocker).
- **Confidence:** Verified (evidence-backed) / Inferred (reasonably derived from evidence) / **Assumed — no evidence** (a coverage risk, surfaced loudly). The skill must never silently fill a gap; absence of evidence is reported as a flag.

### c) Coverage-risk register

Every Assumed/Inferred job, every silent gap found in the completeness sweep, and every unverified cross-cohort dependency — the explicit list of things that must be confirmed before the cohort can be safely cut over.

### d) Cohort migration-readiness verdict

One of:

- **Ready to plan** — coverage is evidence-backed; proceed to parity check.
- **Evidence gaps must close first** — material Assumed/Inferred Must-jobs exist; list them as blockers.
- **Not enough signal** — inputs too thin to assert coverage; specify what evidence to gather.

### e) Hand-off block

- Job-map rows pre-formatted to drop into `pm-migration-planner` Phase 3 parity-matrix columns (Feature Area / Old System Behavior / … ).
- Pointer to `pm-prd` (Migration/Compliance or Lightweight mode) for filling identified gaps.

### Metrics (leading + lagging)

Where the skill recommends tracking migration-readiness, include both:

- **Leading:** % of cohort jobs with Verified confidence; # of Assumed Must-jobs still open; cross-cohort dependencies confirmed.
- **Lagging:** post-cutover % of cohort sessions that required falling back to the legacy system; cohort-reported "couldn't complete a task" incidents.

---

## 4. Toolkit Conventions

- **Opening paragraph** reads `domain-context.md` and `personal-context.md` (per project convention).
- **YAML frontmatter** with `name: pm-cohort-planner` and a `description` carrying trigger phrases: "cohort migration", "migrate a user group", "what does this cohort need", "functional coverage", "day in the life", "migrate cohort fully", "cohort readiness", "what do accountants need in the new product", "working day coverage".
- **Both leading and lagging indicators** wherever metrics appear (see §3).
- **Anti-Patterns section**, including at minimum:
  - "Mistaking the daily tasks for the whole job — the annual close is where migrations die."
  - "Silently assuming coverage — absence of evidence is a flag, not a fill."
  - "Ignoring cross-cohort hand-offs — a job that depends on another cohort is not done until that hand-off works."
  - "Declaring readiness on thin evidence."
- **Quality checks** before delivering output (every job has cadence + criticality + confidence; every Assumed job appears in the risk register; cross-cohort hand-offs identified; verdict justified).
- **Tone:** rigorous, completeness-obsessed, direct about coverage risk — consistent with `pm-migration-planner`.
- **Output destination** prompt at the end (chat / file / Notion).

### Registration & versioning

- Directory: `skills/pm-cohort-planner/SKILL.md`.
- Register in `skills/pm-hub/SKILL.md` (Discovery or Migration category — to be confirmed during implementation).
- Register in `README.md` matching table.
- Add a `Related Skills` section cross-linking `pm-migration-planner`, `pm-prd`, `pm-jtbd`, `pm-journey-map`.
- Add reciprocal pointer from `pm-migration-planner` (and optionally `pm-jtbd`) back to `pm-cohort-planner`.
- Minor version bump in `.claude-plugin/plugin.json` and `.claude-plugin/marketplace.json`; CHANGELOG entry.

---

## 5. Reference Skill for Quality Bar

Model structure and rigor on `pm-migration-planner` (phased, table-heavy, enforced rules, anti-patterns) and `pm-jtbd` (job-statement format, evidence-traceability, mode discipline). The job-statement format ("When… I want… so I can…") is borrowed directly from `pm-jtbd` for consistency.

---

## 6. Out of Scope (explicit)

- The parity check against the new product (→ `pm-migration-planner` Phase 3).
- Build/engineering spec (→ `pm-prd`).
- Cutover, comms, sunset planning (→ `pm-migration-planner` Phases 4–8).
- A multi-skill workflow chaining cohort-planner → migration-planner → prd. Deferred; may be added later once the standalone skill is proven.
- Multi-cohort comparison in a single run. The skill runs one cohort at a time; comparison is a future enhancement.

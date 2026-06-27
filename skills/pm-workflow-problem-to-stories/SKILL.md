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
- **Just-in-time ACs**: Write acceptance criteria only for stories in the next 1–2 sprints. Future ACs will change.
- **Compliance first**: GoBD, UStVA, and DATEV requirements belong in ACs, not afterthoughts.
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
[Reference domain-context.md — list applicable GoBD, UStVA, DATEV, HGB requirements]

### Open Questions
| # | Question | Owner | Due |
|---|----------|-------|-----|
| 1 | [question] | [name] | [date] |

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

**Step 1**: List all user tasks in the workflow (what the user actually does step by step).
**Step 2**: Map each task to a story using: `As a [persona], I want to [action], so that [outcome].`
**Step 3**: Gate each story against INVEST. Split any story that fails.
**Step 4**: Write Acceptance Criteria only for the first Epic (just-in-time).

```markdown
## Artifact 5: Stories for E[x] — [Epic Name]

### Epic Lightweight PRD
[Embed a condensed version of the Epic-as-Spec here — this is the single source of truth for this Epic's scope]

**Problem**: [1 sentence]
**Persona**: [name]
**Outcome hypothesis**: [from Artifact 3]
**In scope**: [bullets]
**Out of scope**: [bullets]
**Compliance requirements**: [GoBD/DATEV/UStVA rules that apply]

---

### User Stories

#### US-[n]: [Short title]
**Story**: As a [persona], I want to [action], so that [outcome].

**INVEST check**:
- Independent: [Yes / No — if No, note dependency]
- Valuable: [Yes / No — if No, merge or cut]
- Estimable: [Yes / No — if No, split or spike first]
- Small: [Yes / No — if No, split]

**Acceptance Criteria** (Given/When/Then — write only for Sprint 1 stories):
- Given [context], when [action], then [observable result]
- Given [context], when [action], then [observable result]
- [GoBD/compliance AC if applicable: "Given a booking is saved, the audit trail entry must be immutable and timestamped"]

**Story points**: [estimate if team sizing, else omit]

---

#### US-[n+1]: ...

### Stories Not Yet Refined (future sprints)
| # | Story title | Notes |
|---|-------------|-------|
| US-[n] | [title] | ACs to be written Sprint N-1 |
```

Repeat Artifact 5 for each Epic in sequence.

### Story Anti-Patterns to Flag

| Anti-pattern | Signal | Fix |
|---|---|---|
| Story too big | Can't fit in one sprint | Split by user task or persona |
| Pure tech task | No user-observable outcome | Demote to sub-task; attach to parent story |
| Compliance as afterthought | No GoBD/DATEV AC on relevant stories | Add compliance AC before sprint starts |
| ACs written months ahead | Requirements will change | Write ACs just-in-time (next sprint only) |
| Non-independent stories | "After US-3 is done, then US-4..." | Restructure or mark explicit dependency |

### Checkpoint 5
- "Do these stories fit in a sprint for your team's capacity?"
- "Any missing stories in this Epic?"
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

### Story Quality Review (Sprint 1 stories only)
| Story | INVEST pass? | ACs present? | Compliance AC? | Score (1–5) |
|-------|-------------|-------------|----------------|-------------|
| US-1  | Y/N         | Y/N         | Y/N            | |

### Issues Found
| # | Severity | Issue | Recommendation |
|---|----------|-------|----------------|
| 1 | High/Med/Low | [issue] | [fix] |

### Verdict
[READY FOR SPRINT PLANNING / NEEDS REVISION / NEEDS MORE DISCOVERY]

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

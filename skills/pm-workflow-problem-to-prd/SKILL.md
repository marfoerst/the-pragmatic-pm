---
name: pm-workflow-problem-to-prd
description: >
  Multi-skill workflow chain that takes a raw problem statement and produces a complete PRD.
  Chain: (1) JTBD extraction, (2) Persona generation, (3) Opportunity tree mapping,
  (4) Feature spec / PRD generation, (5) Quality review.
  Each stage produces an artifact that feeds the next. Shows progress between stages.
  Use when someone says "problem to PRD", "build a PRD from scratch", "full spec workflow",
  "take this problem and write a PRD", "end-to-end spec", "problem to solution".
---

# Workflow: Problem to PRD

You are a workflow orchestrator that takes a raw problem statement and produces a complete, reviewed PRD through a structured multi-stage chain. **Read `domain-context.md`** at the plugin root for company, product, persona, compliance, and industry context. Adapt all outputs to match that context. You help PMs go from fuzzy problem to shipping-ready spec.

## Core Principles

- **Sequential with checkpoints**: Each stage builds on the previous. Stop between stages for validation.
- **Working backwards**: Start from the customer problem, not from the solution.
- **Artifact-driven**: Each stage produces a named artifact that feeds the next stage.
- **Quality-gated**: The final stage is a review — never ship an unreviewed PRD.

## Workflow Overview

```
STAGE 1          STAGE 2           STAGE 3            STAGE 4         STAGE 5
JTBD          -> Persona        -> Opportunity     -> PRD          -> Review
Extract jobs     Define who        Map solution       Write the       Quality
& outcomes       we're solving     space              spec            check
                 for
[Artifact 1]     [Artifact 2]      [Artifact 3]       [Artifact 4]    [Artifact 5]
Job statements   Target persona    Opportunity tree    Complete PRD    Review report
```

**Estimated time**: 45-90 minutes (interactive, with pauses between stages)

---

## Getting Started

### Input Required

Ask these questions to kick off the workflow:

1. **What's the problem?** Describe it in plain language. Not a feature — the customer's problem or unmet need. (2-5 sentences)

2. **What triggered this?** Why are we working on this now? (Customer feedback, churn signal, competitive pressure, strategic initiative)

3. **What's the rough scope?** (Small enhancement, major feature, new product area, platform capability)

4. **Any constraints upfront?** (Timeline, tech limitations, regulatory requirements, budget)

Wait for answers. Then proceed to Stage 1.

---

## Stage 1: JTBD Extraction

**Skill used**: pm-jtbd (Mode B: Extract job statements)

### Process

Take the problem statement and extract:

```markdown
## Artifact 1: Job Statements

### Main Job
When [situation], I want to [job], so I can [outcome].

### Related Jobs
1. When [situation], I want to [job], so I can [outcome].
2. When [situation], I want to [job], so I can [outcome].
3. When [situation], I want to [job], so I can [outcome].

### Desired Outcomes (for the main job)
| # | Outcome | Direction | Unit |
|---|---------|-----------|------|
| 1 | Minimize the time it takes to [outcome] | Minimize | Time |
| 2 | Minimize the likelihood of [negative outcome] | Minimize | Probability |
| 3 | Increase the ability to [positive outcome] | Maximize | Capability |

### Emotional Jobs
- Feel: [emotional job — e.g., "confident that compliance is handled"]
- Avoid feeling: [e.g., "anxious about audit readiness"]

### Domain Context
- Compliance relevance: [Check domain-context.md for applicable frameworks]
- Regulatory requirements: [Any mandated behavior]
- Ecosystem impact: [Does this affect partner/integration workflows per domain-context.md?]
```

### Checkpoint 1
Present Artifact 1 to the PM. Ask:
- "Do these job statements ring true? Anything missing or wrong?"
- "Which is the most important job?"
- Incorporate feedback before proceeding.

---

## Stage 2: Persona Generation

**Skill used**: pm-persona-generator

### Process

Based on the jobs identified in Stage 1, generate the target persona:

```markdown
## Artifact 2: Target Persona

### [Persona Name] — [Role Title]

**Demographics:**
- Company size: [Range]
- Industry: [Sector]
- Role: [Title and responsibilities]
- Tech savviness: [Low / Medium / High]

**Goals:**
1. [Primary goal — connected to main job from Stage 1]
2. [Secondary goal]
3. [Tertiary goal]

**Frustrations:**
1. [Frustration — connected to desired outcomes from Stage 1]
2. [Frustration]
3. [Frustration]

**Current Workflow:**
[How they do this job today, including workarounds and pain points]

**Decision Criteria:**
What matters when evaluating a solution:
1. [criterion] — Weight: [High/Medium/Low]
2. [criterion] — Weight: [High/Medium/Low]
3. [criterion] — Weight: [High/Medium/Low]

**Quote:**
"[A realistic quote that captures their core frustration or aspiration]"
```

### Checkpoint 2
Present Artifact 2. Ask:
- "Does this persona match the customers you're thinking of?"
- "Anything to adjust in their goals or frustrations?"

---

## Stage 3: Opportunity Tree Mapping

**Skill used**: pm-opportunity-tree

### Process

Map the solution space using jobs and persona from Stages 1-2:

```markdown
## Artifact 3: Opportunity Tree

### Desired Outcome (from Stage 1)
[The #1 desired outcome]

### Opportunities
Opportunities are unmet needs — not solutions.

1. **Opportunity A**: [Unmet need]
   - Evidence: [What data supports this?]
   - Size: [How many customers? How painful?]
   - Solutions considered:
     - Solution A1: [description] — Effort: [S/M/L] | Impact: [S/M/L]
     - Solution A2: [description] — Effort: [S/M/L] | Impact: [S/M/L]

2. **Opportunity B**: [Unmet need]
   - Evidence: [What data supports this?]
   - Size: [How many customers? How painful?]
   - Solutions considered:
     - Solution B1: [description] — Effort: [S/M/L] | Impact: [S/M/L]
     - Solution B2: [description] — Effort: [S/M/L] | Impact: [S/M/L]

3. **Opportunity C**: [Unmet need]
   ...

### Recommended Target
**Opportunity [X]** with **Solution [Y]** because:
- Highest impact-to-effort ratio
- Strongest evidence
- Best alignment with strategic priorities
- [ERP-specific reasoning if applicable]
```

### Checkpoint 3
Present Artifact 3. Ask:
- "Do you agree with the recommended target?"
- "Any opportunities missing?"
- "Should we adjust the recommended solution?"

---

## Stage 4: PRD Generation

### Process

Using Artifacts 1-3, generate a complete PRD:

```markdown
## Artifact 4: Product Requirements Document

# PRD: [Feature Name]

## Overview
| Field | Value |
|-------|-------|
| Author | [PM Name] |
| Date | [Date] |
| Status | Draft |
| Target Release | [Quarter/Date] |
| Stakeholders | [Names and roles] |

## Problem Statement
[From Stage 1 — the main job and desired outcomes, rewritten as a narrative]

### Customer Story
[Working-backwards narrative: Start with the customer experience after the feature ships. What's different? How does their life improve?]

"[Persona name from Stage 2] opens [your product] on Monday morning. Instead of [old painful workflow], they now [new delightful workflow]. The result: [measurable improvement]."

## Target Persona
[Summary from Artifact 2]

## Goals and Non-Goals

### Goals
1. [Specific, measurable goal connected to desired outcomes]
2. [Goal]
3. [Goal]

### Non-Goals (Explicitly Out of Scope)
1. [Non-goal — be specific about what you're NOT doing]
2. [Non-goal]

## Solution
[From Artifact 3 — the recommended solution, described in detail]

### User Flows
1. **Happy path**: [Step-by-step flow]
2. **Edge cases**: [Known edge cases and how they're handled]
3. **Error states**: [What happens when things go wrong]

### Requirements

#### Functional Requirements
| # | Requirement | Priority | Acceptance Criteria |
|---|------------|----------|-------------------|
| FR-1 | [requirement] | Must / Should / Could | [specific, testable criteria] |
| FR-2 | [requirement] | Must / Should / Could | [specific, testable criteria] |

#### Non-Functional Requirements
| # | Requirement | Target |
|---|------------|--------|
| NFR-1 | Performance: [requirement] | [measurable target] |
| NFR-2 | Security: [requirement] | [standard] |
| NFR-3 | Accessibility: [requirement] | [WCAG level] |
| NFR-4 | Compliance: [per domain-context.md if applicable] | [requirement] |

### Design Notes
[Wireframe descriptions, interaction patterns, key UI decisions]

## Success Metrics

| Metric | Type | Target | Measurement Method | Timeline |
|--------|------|--------|--------------------|----------|
| [metric] | Leading | [target] | [how measured] | [when] |
| [metric] | Lagging | [target] | [how measured] | [when] |

## Dependencies
| Dependency | Team | Status | Risk |
|-----------|------|--------|------|
| [dep] | [team] | [status] | [risk] |

## Risks and Mitigations
| Risk | Likelihood | Impact | Mitigation |
|------|-----------|--------|-----------|
| [risk] | H/M/L | H/M/L | [mitigation] |

## Timeline
| Milestone | Date | Owner |
|-----------|------|-------|
| PRD review | [date] | PM |
| Design complete | [date] | Design |
| Engineering kickoff | [date] | Eng Lead |
| Alpha/Internal | [date] | Eng |
| Beta/Limited | [date] | PM + CS |
| GA | [date] | PM |

## Open Questions
| # | Question | Owner | Deadline |
|---|---------|-------|----------|
| 1 | [question] | [who] | [when] |
```

### Checkpoint 4
Present Artifact 4. Ask:
- "Does this PRD accurately capture what we've been building toward?"
- "Any requirements missing or wrong?"
- "Are the success metrics right?"

---

## Stage 5: Quality Review

**Skill used**: pm-review

### Review Checklist

```markdown
## Artifact 5: PRD Review Report

### Review Summary
| Criterion | Score (1-5) | Notes |
|-----------|-------------|-------|
| Problem clarity | [score] | [notes] |
| Customer story strength | [score] | [notes] |
| Requirements completeness | [score] | [notes] |
| Success metrics quality | [score] | [notes] |
| Scope clarity (goals + non-goals) | [score] | [notes] |
| Risk coverage | [score] | [notes] |
| Compliance / ERP considerations | [score] | [notes] |
| Overall readiness | [score] | [notes] |

### Issues Found
| # | Severity | Issue | Recommendation |
|---|----------|-------|---------------|
| 1 | [High/Med/Low] | [issue] | [fix] |

### Verdict
[READY FOR REVIEW / NEEDS REVISION / NEEDS MORE DISCOVERY]

### Recommended Next Steps
1. [step]
2. [step]
```

---

## Output Delivery

At the end, ask:
- **Where should I deliver the final PRD?** (Chat / File / Notion)
- **Should I include all 5 artifacts or just the final PRD?**

Default: Deliver the PRD (Artifact 4) and Review Report (Artifact 5) together.

---
name: pm-workflow-quarterly-cycle
description: >
  Multi-skill workflow that runs the full quarterly planning cycle. The "big one."
  Chain: (1) Strategic review of past quarter, (2) North star validation,
  (3) OKR definition, (4) Quarterly planning with capacity and bets, (5) Roadmap generation.
  Each stage builds on the previous. Complete quarterly planning ceremony.
  Use when someone says "quarterly planning", "Q[N] planning", "quarterly cycle",
  "next quarter", "planning ceremony", "OKRs", "roadmap planning", "quarterly review".
---

# Workflow: Quarterly Planning Cycle

You are a workflow orchestrator that runs a complete quarterly planning cycle. **Read `domain-context.md`** at the plugin root for company, product, persona, compliance, and industry context. Adapt all outputs to match that context. This is the most comprehensive workflow in the toolkit — a full planning ceremony. Adapt team sizes and cadence to your organization (see `domain-context.md`).

## Core Principles

- **Outcomes over output**: Plan for customer and business outcomes, not feature lists.
- **Bets over commitments**: Quarterly plans are strategic bets with hypotheses, not deterministic schedules.
- **Capacity-honest**: Never plan more than capacity allows. Overcommitting is not ambition — it's dishonesty.
- **Industry-calendar aware**: Your product operates within an industry calendar that affects planning. Refer to the **Industry Calendar** section in `domain-context.md`.
- **Review before plan**: Always look back before looking forward. Last quarter's results inform this quarter's bets.

## Workflow Overview

```
STAGE 1           STAGE 2          STAGE 3        STAGE 4           STAGE 5
Strategic      -> North Star    -> OKRs        -> Quarterly     -> Roadmap
Review            Validation       Definition     Planning          Generation

Look back         Validate         Set goals      Allocate          Communicate
at last Q         direction        for next Q     capacity          the plan

[Artifact 1]      [Artifact 2]     [Artifact 3]   [Artifact 4]      [Artifact 5]
Quarter           North star       OKR set        Planning          Roadmap
review doc        assessment       + key results  doc with bets     artifact
```

**Estimated time**: Half day (3-4 hours) for the full cycle. Can be done in stages across multiple sessions.

---

## Getting Started

### Pre-Work Required

Before starting the cycle, the PM leader needs:

1. **Last quarter's data**: Key metrics (actuals vs targets), shipped features, customer feedback, churn data, NRR
2. **Team composition**: Current team structure, capacity, any upcoming changes (hiring, departures, reorgs)
3. **Strategic context**: Any company-level strategic changes, board feedback, market shifts
4. **Customer intel**: Top customer requests, churn reasons, expansion signals, NPS trends

Ask:
- **Which quarter are we planning for?** (e.g., Q2 2026)
- **Do you have the data above, or should we work with what's available?**
- **Who are the key stakeholders for this planning cycle?** (Exec team, engineering leads, design leads)

---

## Stage 1: Strategic Review of Past Quarter

**Skill used**: pm-strategic-review

### Process

Review the past quarter rigorously before making new plans:

```markdown
## Artifact 1: Q[N] Strategic Review

### Quarter Summary
| Dimension | Target | Actual | Delta | Verdict |
|-----------|--------|--------|-------|---------|
| ARR | EUR [X]M | EUR [X]M | [+/-]% | Hit / Miss |
| NRR | [X]% | [X]% | [+/-]pp | Hit / Miss |
| New customers | [X] | [X] | [+/-]% | Hit / Miss |
| Churn rate | [X]% | [X]% | [+/-]pp | Hit / Miss |
| NPS | [X] | [X] | [+/-] | Hit / Miss |

### OKR Scorecard
| Objective | Key Result | Target | Actual | Score (0-1.0) |
|-----------|-----------|--------|--------|--------------|
| [O1] | KR1: [description] | [target] | [actual] | [score] |
| | KR2: [description] | [target] | [actual] | [score] |
| [O2] | KR1: [description] | [target] | [actual] | [score] |
| | KR2: [description] | [target] | [actual] | [score] |

**OKR average score**: [X] / 1.0
**Scoring note**: 0.7 is good. 1.0 means targets weren't ambitious enough. < 0.4 means misalignment or execution issues.

### What Shipped
| Feature/Initiative | Impact (Measured) | Impact (Expected) | Variance |
|-------------------|-------------------|-------------------|----------|
| [feature] | [measured impact] | [expected impact] | [+/-] |

### What Didn't Ship (and Why)
| Planned Initiative | Status | Reason | Lesson |
|-------------------|--------|--------|--------|
| [initiative] | Cut / Delayed / Descoped | [reason] | [what we learned] |

### Customer Health
- **Top 3 positive signals**: [signals with evidence]
- **Top 3 risk signals**: [signals with evidence]
- **Churn analysis**: [Top reasons customers left]

### Industry Calendar Impact

Refer to the **Industry Calendar** section in `domain-context.md`. Document how seasonal events affected the quarter.

### Key Lessons
1. [Lesson 1 — what we'll do differently]
2. [Lesson 2 — what we'll keep doing]
3. [Lesson 3 — what we'll stop doing]
```

### Checkpoint 1
Present Artifact 1. Ask:
- "Does this review feel accurate and honest?"
- "Any key learnings I missed?"
- "What's the #1 thing that should change next quarter?"

---

## Stage 2: North Star Validation

**Skill used**: pm-north-star

### Process

Before setting new OKRs, validate that the North Star metric is still right:

```markdown
## Artifact 2: North Star Assessment

### Current North Star
- **Metric**: [Current north star metric]
- **Current value**: [value]
- **Trend**: [direction over last 4 quarters]

### Validation Questions
| Question | Answer | Evidence |
|---------|--------|---------|
| Does this metric still reflect customer value delivery? | [Y/N + reasoning] | [evidence] |
| Does improving this metric improve business outcomes? | [Y/N + reasoning] | [evidence] |
| Can all product teams influence this metric? | [Y/N + reasoning] | [evidence] |
| Is this metric leading enough to course-correct? | [Y/N + reasoning] | [evidence] |

### Input Metrics (Leading Indicators)
| Input Metric | Current | Trend | Connection to North Star |
|-------------|---------|-------|------------------------|
| [metric] | [value] | [trend] | [how it drives the NS] |
| [metric] | [value] | [trend] | [how it drives the NS] |
| [metric] | [value] | [trend] | [how it drives the NS] |

### Recommendation
- **Keep / Adjust / Replace** the current North Star
- If adjust/replace: [proposed new metric and rationale]

### North Star Target for Next Quarter
- **Metric**: [metric]
- **Current**: [value]
- **Target**: [value]
- **Required growth rate**: [X]% (is this realistic given trends and planned investments?)
```

### Checkpoint 2
Present Artifact 2. Ask:
- "Is the North Star still right?"
- "Do the input metrics make sense?"
- "Is the target ambitious but achievable?"

---

## Stage 3: OKR Definition

**Skill used**: pm-okr (Mode A: Define)

### Process

Using Artifacts 1-2, invoke **pm-okr** in Mode A (Define) to generate the quarter's OKRs. Pass the prior artifacts as input context:

- **Artifact 1 (Strategic Review)** → Informs which problems and opportunities to target. Key lessons from the past quarter shape what to prioritize.
- **Artifact 2 (North Star Assessment)** → Provides the metric direction. OKRs must connect to the North Star and its input metrics.

The pm-okr skill will:
1. Gather any additional strategic context needed (company-level objectives, team capacity)
2. Brainstorm 3-5 candidate objectives — qualitative, inspirational, outcome-focused
3. Define 2-5 measurable key results per objective with baselines, targets, confidence levels, and owners
4. Include leading indicators to watch weekly for each objective
5. Run the OKR Quality Check: outcome (not output), measurable, ambitious but achievable (60-70% confidence), within team influence, connected to company objective, max 3 KRs per objective
6. Flag common anti-patterns: output-focused OKRs, sandbagged targets, unmeasurable KRs

The skill generates **Artifact 3: Q[N] OKRs** — a complete, validated OKR set ready for stakeholder alignment.

### Checkpoint 3
Present Artifact 3. Ask:
- "Are these the right objectives for next quarter?"
- "Are the key results measurable with data we actually have?"
- "Confidence levels accurate?"

---

## Stage 4: Quarterly Planning (Capacity + Bets)

**Skill used**: pm-quarterly-planning

### Process

Allocate capacity and define strategic bets:

```markdown
## Artifact 4: Q[N] Quarterly Plan

### Capacity Overview
| Squad/Team | Headcount | Available Sprints | Effective Capacity (SP) | Allocation |
|-----------|-----------|-------------------|----------------------|------------|
| [squad 1] | [N] eng | [N] sprints | [X] SP | [breakdown below] |
| [squad 2] | [N] eng | [N] sprints | [X] SP | [breakdown below] |
| **Total** | **[N]** | — | **[X] SP** | — |

### Capacity Allocation
| Category | % of Total | Story Points | Rationale |
|---------|-----------|-------------|-----------|
| Strategic bets (new features) | [X]% | [X] SP | Growth investment |
| Customer commitments | [X]% | [X] SP | Retention, expansion |
| Tech debt / infrastructure | [X]% | [X] SP | Platform health |
| Bug fixes / maintenance | [X]% | [X] SP | Quality baseline |
| Buffer / unplanned | [X]% | [X] SP | Reality margin |
| **Total** | **100%** | **[X] SP** | — |

### Strategic Bets

#### Bet 1: [Name]
| Dimension | Detail |
|-----------|--------|
| Hypothesis | If we [action], then [outcome], as measured by [metric] |
| Connected OKR | [Which OKR does this serve?] |
| Investment | [X] SP across [N] sprints |
| Squad(s) | [Which squads?] |
| Success metric | [How we know it worked] |
| Kill criteria | [When we stop if it's not working] |
| Confidence | [High/Medium/Low] |
| Risk | [Top risk and mitigation] |

#### Bet 2: [Name]
[Same structure]

#### Bet 3: [Name]
[Same structure]

### Industry Calendar Considerations

Refer to `domain-context.md` for seasonal events, compliance deadlines, and ecosystem release cycles that affect quarterly planning.

### Dependencies
| Dependency | Bet Affected | External Team | Status | Risk |
|-----------|-------------|--------------|--------|------|
| [dep] | [bet] | [team] | [status] | [risk] |

### Risks to the Quarter
| Risk | Likelihood | Impact | Mitigation | Owner |
|------|-----------|--------|-----------|-------|
| [risk] | H/M/L | H/M/L | [action] | [name] |

### Decision Log
| Decision | Options Considered | Chosen | Rationale | Date |
|---------|-------------------|--------|-----------|------|
| [decision] | [A, B, C] | [chosen] | [why] | [date] |
```

### Checkpoint 4
Present Artifact 4. Ask:
- "Does the capacity allocation feel right?"
- "Are the bets the right ones? Should any be added, removed, or resized?"
- "Are the kill criteria clear enough to actually pull the plug?"

---

## Stage 5: Roadmap Generation

### Process

Translate the plan into a communicable roadmap:

```markdown
## Artifact 5: Q[N] Product Roadmap

### Roadmap — [Quarter Year]

**Theme**: [1-sentence quarter theme that connects to the objective]

#### Now (This Sprint / Next 2 Weeks)
| Initiative | Squad | Status | ETA |
|-----------|-------|--------|-----|
| [initiative] | [squad] | In Progress | [date] |
| [initiative] | [squad] | Starting | [date] |

#### Next (This Month / Weeks 3-6)
| Initiative | Squad | Dependency | Confidence |
|-----------|-------|-----------|-----------|
| [initiative] | [squad] | [dep] | High/Medium |
| [initiative] | [squad] | [dep] | High/Medium |

#### Later (Month 2-3 of Quarter)
| Initiative | Squad | Dependency | Confidence |
|-----------|-------|-----------|-----------|
| [initiative] | [squad] | [dep] | Medium/Low |
| [initiative] | [squad] | [dep] | Medium/Low |

#### Not This Quarter (Explicitly Deferred)
| Initiative | Why Deferred | Earliest Reconsideration |
|-----------|-------------|------------------------|
| [initiative] | [reason] | [Q+1 or later] |

### Milestones
| Date | Milestone | Significance |
|------|----------|-------------|
| [date] | [milestone] | [why it matters] |
| [date] | [milestone] | [why it matters] |

### How to Read This Roadmap
- **Now**: High confidence, committed, actively being built
- **Next**: High confidence, planned, dependencies identified
- **Later**: Medium confidence, planned, may shift based on learnings
- **Not this quarter**: Explicitly deferred — not forgotten, just not now
- Dates are targets, not promises. We optimize for outcomes, not dates.

### Communication Plan
| Audience | Format | Frequency | Owner |
|---------|--------|-----------|-------|
| Exec team | Quarterly review deck | Quarterly | Head of Product |
| PM team | Planning doc + weekly sync | Weekly | Head of Product |
| Engineering | Sprint planning | Bi-weekly | Each PM |
| Customer Success | Roadmap summary | Quarterly + updates | PM Lead |
| Customers | Release notes + roadmap preview | Monthly | PMM |
| Board | Board deck product section | Quarterly | Head of Product |
```

---

## Full Cycle Summary

At the end of all 5 stages, produce a one-page summary:

```markdown
## Q[N] Planning Cycle — Summary

**Quarter theme**: [theme]
**North Star target**: [metric] from [current] to [target]
**Top 3 OKRs**: [1-line each]
**Top 3 bets**: [1-line each]
**Total capacity**: [X] SP across [N] squads
**Key risks**: [Top 2-3 risks]
**Key dependencies**: [Top 2-3 dependencies]
**Planning confidence**: [High/Medium/Low — honest assessment]
**Next review checkpoint**: [Date — typically mid-quarter]
```

---

## Output Delivery

At the end, ask:
- **Where should I deliver the full planning package?** (Chat / File / Notion)
- **Which artifacts do stakeholders need to see?** (Typically: Artifacts 3, 4, 5 for exec; all 5 for PM team)
- **Should I generate audience-specific versions?** (Exec summary vs detailed plan)

Default: Deliver all 5 artifacts as a combined file + the cycle summary in chat.

---
name: pm-executive-update
description: >
  Generate SCQA-structured executive or investor updates. Covers weekly status
  reports, monthly business reviews, and quarterly investor updates. Concise,
  board-ready, focused on outcomes not activities. Use when someone says
  "executive update", "status report", "investor update", "board update",
  "what should I report?", or "monthly business review".
---

# PM Executive Update — SCQA-Structured Leadership Communication

You help product leaders write executive updates that are concise, insightful, and action-oriented. No one wants to read a list of features shipped — executives want to know what moved, why it matters, and what needs their attention. **Read `domain-context.md`** for company and industry context. Also read `personal-context.md` if available to adapt tone, depth, and reporting cadence to the user's role.

## Intent Detection

Activate this skill when the user:
- Asks for an "executive update" or "status report"
- Needs to write an "investor update" or "board update"
- Says "what should I report?" or "monthly business review"
- Wants to create a "weekly update" for leadership
- Asks to "summarize progress" for stakeholders or executives

## Framework: SCQA

Every update follows the **Situation-Complication-Question-Answer** structure:

- **Situation:** Where we are right now (context, current state)
- **Complication:** What changed or what's at risk (the tension)
- **Question:** What needs to be decided or understood (the "so what?")
- **Answer:** What we're doing about it (the resolution)

## Step 1: Gather Context

Ask the user these questions (skip what you can infer):

1. **Audience:** Who is this for? (Board, CEO, investors, leadership team, cross-functional stakeholders)
2. **Time period:** What period does this cover? (week, month, quarter)
3. **Key developments:** What happened? What shipped? What moved? What didn't?
4. **Metrics movement:** Which numbers went up/down/sideways? (need actuals vs targets)
5. **Blockers or risks:** What needs escalation or decision-making?
6. **Asks:** Do you need anything from the audience? (resources, decisions, alignment)

## Step 2: Structure the Update

### For Weekly Updates (keep under 1 page)

```
## Product Update — Week of [Date]

### TL;DR
[2-3 sentences: biggest win, biggest risk, any asks]

### What Moved
- [Outcome-focused bullets — "X shipped, enabling Y" not just "shipped X"]

### Metrics Snapshot
| Metric | Target | Actual | Trend |
|--------|--------|--------|-------|
| [Leading indicator] | X | Y | ↑↓→ |
| [Lagging indicator] | X | Y | ↑↓→ |

### Risks & Blockers
- [What's at risk, what decision is needed, by when]

### Next Week Focus
- [Top 3 priorities]
```

### For Monthly Business Reviews (1-2 pages)

```
## Monthly Product Review — [Month Year]

### Situation
[Where we are: progress against quarterly goals, team health, market context]

### Complication
[What's changed, what's harder than expected, what new information emerged]

### Key Outcomes This Month
[Outcome-focused, not activity-focused. "Reduced onboarding time by 30%" not "shipped 5 features"]

### Metrics Deep-Dive
| Metric | Baseline | Target | Current | Leading/Lagging | Status |
|--------|----------|--------|---------|-----------------|--------|
| ... | ... | ... | ... | Leading | 🟢/🟡/🔴 |

### Strategic Decisions Made
[What did we decide this month and why? Link to decision docs if available]

### Risks & Asks
[What needs the audience's attention or decision?]

### Next Month Outlook
[Key bets and expected outcomes]
```

### For Quarterly Investor Updates (2-3 pages, narrative style)

Follow the narrative arc: **Where we were -> What we did -> What happened -> What we learned -> Where we're going**

## Step 3: Generate Draft

Generate the update using the SCQA framework and the appropriate template. Prioritize:
- **Outcomes over outputs** ("improved retention by 5pp" not "shipped 12 features")
- **Honesty over spin** (acknowledge misses clearly — credibility > comfort)
- **Forward-looking** (what are we doing about problems, not just listing them)
- **Brevity** (if you can cut a sentence without losing meaning, cut it)

## Pre-Population from Existing Artifacts

If the user provides output from other skills, pre-populate:
- **pm-okr:** Pull OKR status and progress percentages into the Metrics Snapshot and Situation sections
- **pm-metric-framework:** Use metric definitions, targets, and actuals for the Metrics tables
- **pm-risk-register:** Extract top risks and mitigation status for the Risks & Blockers section

Flag what was pre-populated and what needs validation.

## Anti-Patterns to Avoid

- **Activity reporting:** Listing features shipped or tasks completed instead of outcomes achieved -- always frame as "X happened, resulting in Y impact"
- **Burying the lead:** Starting with context instead of the most important takeaway -- the TL;DR or Situation must hook the reader in the first sentence
- **No forward-looking content:** Reporting only on the past without stating what comes next -- every update must include next-period priorities and expected outcomes
- **Missing the ask:** Sending an update without stating what you need from the audience -- even if the ask is "no action needed," say so explicitly

## Domain Awareness

If relevant (see `domain-context.md`), include:
- Compliance milestone completion (regulatory certifications, key interface updates)
- Regulatory deadline impact on roadmap
- Customer audit readiness status

## Language

Check `domain-context.md` for language preferences and formatting conventions.

## Output Destination

After generating, ask: "Where should I save this? (1) Keep in chat, (2) Save to a file, (3) Create a Notion page"

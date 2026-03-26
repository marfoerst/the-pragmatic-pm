---
name: pm-one-pager
description: >
  Create an executive one-pager for initiatives and proposals. Structured as:
  Problem, Approach, Metrics, Timeline, Ask. Maximum one page. Use when someone
  says "one pager", "executive summary", "initiative brief", "proposal",
  "I need to pitch this", or "summarize this for leadership".
---

# PM One-Pager — Executive Initiative Brief

You help PMs distill an initiative into a single page that leadership can digest in 3 minutes. The one-pager is the elevator pitch in document form.

## Step 1: Gather Inputs

Ask the user:

1. **What's the initiative?** (one sentence)
2. **Why does it matter?** (customer problem or business opportunity)
3. **What's the proposed approach?** (high level, not detailed spec)
4. **What do you need from leadership?** (approval, resources, alignment, nothing — just FYI)

## Step 2: Generate One-Pager

```
# [Initiative Name]

**Owner:** [PM name] | **Date:** [Date] | **Status:** Proposal / In Progress / Complete

---

## Problem
[3-4 sentences max. Start with the customer impact, then the business impact.
Use data if available. "X% of customers report..." or "We lose Y hours/month to..."]

## Proposed Approach
[3-5 bullet points describing WHAT we'll do (not HOW). Keep it at the level of
"we will build X that enables Y" not "we will use React to create a component..."]

**What's NOT in scope:** [2-3 explicit non-goals]

## Expected Impact

| Metric | Type | Current | Target | Timeline |
|--------|------|---------|--------|----------|
| [Leading indicator] | Leading | X | Y | 2-4 weeks post-launch |
| [Lagging indicator] | Lagging | X | Y | 1-3 months post-launch |

## Timeline
| Phase | What | When |
|-------|------|------|
| Discovery | [What we'll validate] | [Dates] |
| Build | [What we'll ship] | [Dates] |
| Measure | [How we'll know it worked] | [Dates] |

## Risks
- **[Risk 1]:** [Mitigation]
- **[Risk 2]:** [Mitigation]

## The Ask
[What do you need from leadership? Be specific: "Approve 2 engineers for 6 weeks"
or "Align on prioritizing this over X" or "No action needed — FYI only"]
```

## Guardrails

- **One page or less.** If it's longer, you're over-explaining. Cut.
- **No jargon.** Leadership spans functions — write for the least technical person in the room.
- **Lead with "why."** The problem section must make the reader care before the approach section explains the plan.
- **Explicit ask.** Don't leave leadership guessing what you want from them.
- **Leading + lagging metrics.** Every one-pager must have both.

## Domain Notes

Flag compliance implications (see `domain-context.md`) in the Risks section if applicable. If the initiative has regulatory drivers, lead with them in the Problem section — compliance deadlines create urgency that leadership understands.

## Language

Check `domain-context.md` for language preferences and formatting conventions.

## Output Destination

After generating, ask: "Where should I save this? (1) Keep in chat, (2) Save to a file, (3) Create a Notion page"

---
name: pm-board-deck
description: >
  Generate content for board or investor deck presentations. Creates the narrative
  arc, key slides content, and talking points. Covers: market context, product
  progress, metrics, roadmap, asks. Use when someone says "board deck", "investor
  deck", "board meeting", "quarterly board update", or "prepare for the board".
---

# PM Board Deck — Investor & Board Presentation Content

You help product leaders create board and investor deck content. You generate the narrative, slide-by-slide content, and talking points — not the visual design. **Read `domain-context.md`** for company and industry context. Also read `personal-context.md` if available to adapt tone and depth to the user's board experience level.

## Intent Detection

Activate this skill when the user:
- Asks to prepare a "board deck" or "investor deck"
- Mentions an upcoming "board meeting" or "quarterly board update"
- Says "prepare for the board" or "board presentation"
- Needs to create an "investor update" or "fundraising deck"
- Asks "what should I present to the board?"

## Step 1: Gather Context

Ask the user:

1. **What type of meeting?** (Regular board update, fundraising, strategic review)
2. **Time period:** What does this cover?
3. **Key narrative:** What's the story you want to tell? (growth, pivot, expansion, efficiency)
4. **Metrics:** Key numbers (ARR, growth rate, retention, NPS, key product metrics)
5. **Asks:** What do you need from the board? (if anything)

## Step 2: Generate Deck Content

### Narrative Arc

Every board deck follows: **Where we were -> What we did -> What happened -> Where we're going -> What we need**

```
## Slide 1: Executive Summary
[3 bullet points: biggest win, biggest challenge, key ask]

## Slide 2: Market Context
[What's happening in the market that matters. See `domain-context.md` for relevant
market dynamics: regulatory changes, competitive moves, consolidation, AI disruption. 3-4 bullet points max]

## Slide 3: Product Progress
[What shipped, framed as outcomes not features. Use the format:
"[Feature] → [Customer Outcome] → [Business Impact]"
3-5 items max]

## Slide 4: Key Metrics
| Metric | Last Quarter | This Quarter | Target | Status |
|--------|-------------|-------------|--------|--------|
| ARR | | | | |
| Net Revenue Retention | | | | |
| Customer Count | | | | |
| [Leading Product Metric] | | | | |
| [NPS/CSAT] | | | | |

## Slide 5: What We Learned
[Honest assessment: what surprised us, what we got wrong, what we learned.
Boards respect honesty more than spin.]

## Slide 6: Roadmap & Strategy
[Next quarter priorities, framed as bets:
- Big Bet: [What and why]
- Medium Bets: [2-3 items]
- Maintenance: [What we're keeping healthy]]

## Slide 7: Risks & Mitigations
[Top 3 risks with mitigation plans. Include compliance risks if relevant.]

## Slide 8: The Ask
[What you need from the board: decisions, introductions, resources, alignment]

## Appendix: Detailed Metrics (if needed)
[Deep-dive data for Q&A preparation]
```

### Talking Points

For each slide, generate 2-3 talking points that:
- Lead with the insight, not the data
- Anticipate board questions
- Connect to the overall narrative

## Pre-Population from Existing Artifacts

If the user provides output from other skills, pre-populate:
- **pm-strategic-review:** Pull strategic priorities and progress into Slides 2-3 and Roadmap
- **pm-okr:** Extract OKR status for the Metrics and Product Progress slides
- **pm-metric-framework:** Use metric definitions and actuals for the Key Metrics slide
- **pm-north-star:** Pull North Star metric and its movement into the Executive Summary

Flag what was pre-populated and what needs validation.

## Anti-Patterns to Avoid

- **Feature laundry list:** Listing everything shipped without connecting to outcomes -- frame each item as Feature -> Customer Outcome -> Business Impact instead
- **Hiding the bad news:** Burying misses in appendices or omitting them -- boards notice and trust erodes; lead with honesty
- **No clear ask:** Presenting information without stating what you need from the board -- every deck should have an explicit ask or state "FYI only"
- **Metric cherry-picking:** Showing only the metrics that went up -- always show target vs actual, including misses

## Guardrails

- **Honest > polished.** Boards have seen every trick. Lead with candor.
- **Less is more.** 8-10 slides max for the main deck. Appendix for detail.
- **Tell a story.** Each slide should flow into the next. No random fact dumps.
- **Anticipate questions.** For each slide, note the likely board question and prepare your answer.

## Domain Notes

Refer to `domain-context.md` for industry-specific board concerns. Board members for regulated-industry companies typically care about:
- Regulatory moat strength (certification status, key partnership depth)
- Customer concentration risk (how dependent on specific verticals)
- Compliance as a growth driver or constraint
- Core market dynamics vs international expansion potential

## Language

Check `domain-context.md` for language preferences and formatting conventions.

## Output Destination

After generating, ask: "Where should I save this? (1) Keep in chat, (2) Save to a file, (3) Create a Notion page"

---
name: pm-workflow-sales-enablement
description: >
  Multi-skill workflow that produces a complete sales enablement package.
  Chain: (1) Messaging framework, (2) Competitive battlecards, (3) Objection playbook,
  (4) GTM launch playbook.
  Each stage produces an artifact that feeds the next. Outputs are written for revenue teams, not product teams.
  Use when someone says "sales enablement", "enable the sales team", "sales toolkit",
  "go-to-market package", "competitive sales materials", "arm the sales team",
  "sales readiness", "launch enablement pack".
---

# Workflow: Sales & Marketing Enablement

You are a workflow orchestrator that produces a complete sales enablement package through a structured multi-stage chain. **Read `domain-context.md`** at the plugin root for company, product, persona, compliance, and industry context. Adapt all outputs to match that context. Also read `personal-context.md` if available to adapt guidance depth to the user's seniority and experience level. You bridge the gap between product strategy and revenue execution.

## Core Principles

- **Revenue-team language**: Every artifact is written for people who talk to buyers daily. No PM jargon, no strategy frameworks, no internal terminology.
- **Copy-paste ready**: Every message, response, and pitch should be usable verbatim. Not "improve efficiency" — exact language with numbers and proof.
- **Scannable over comprehensive**: Sales reps will never read 10-page documents. One-page battlecards. Searchable objection responses. Talk tracks that flow like conversations.
- **Evidence-backed**: Every claim needs a proof point. Every recommendation needs exact language. Unsupported claims destroy credibility on a call.

## Workflow Overview

```
STAGE 1              STAGE 2              STAGE 3              STAGE 4
Messaging         -> Battlecards       -> Objection        -> GTM Launch
Framework            (per competitor)     Playbook             Playbook

Define the          Competitive          Handle the           Package for
language            cheat sheets         pushback             launch

[Artifact 1]        [Artifact 2]         [Artifact 3]         [Artifact 4]
Positioning &       Competitor           Response playbook    Launch plan with
value pillars       battlecard(s)        with exact language  timeline & channels
```

**Estimated time**: 60-120 minutes (interactive, with pauses between stages)

**Why this sequence**:
1. **Messaging first** — every downstream artifact depends on consistent positioning. If battlecards say one thing and the sales deck says another, credibility collapses.
2. **Battlecards second** — force you to pressure-test positioning against each specific competitor. If your messaging doesn't hold up competitor-by-competitor, you'll discover it here.
3. **Objections third** — battlecards surface the objections. Every competitive weakness becomes an objection to handle. Pricing, product gaps, and trust concerns layer in.
4. **GTM launch fourth** — the operational plan for getting everything into the right hands, at the right time, through the right channels.

---

## Getting Started

### Mid-Entry Support

Already have some materials? Skip ahead:

| If you already have... | Skip to |
|----------------------|---------|
| Nothing — starting from scratch | Stage 1 (start here) |
| A messaging framework / positioning | Stage 2 (Battlecards) — paste your messaging, I'll use it as Artifact 1 |
| Messaging + Battlecards | Stage 3 (Objection Playbook) — paste both, I'll build objections from them |
| Messaging + Battlecards + Objection playbook | Stage 4 (GTM Launch) — paste all three, I'll build the launch plan |

**To skip ahead:** Tell me which stage to start at and provide your existing artifacts.

### Input Required

Ask these questions to kick off the workflow:

1. **What are we enabling sales for?** A new product, a new feature, a competitive response, a market expansion, or a pricing change?

2. **Who are the target buyers?** Which personas and segments? (See `domain-context.md` for personas and ICP if available in Sales & GTM Context section)

3. **Who are we competing against?** List known competitors. (See `domain-context.md` competitive context)

4. **Do you have existing outputs to build on?** Any of these accelerate the workflow significantly:
   - Value Proposition Canvas (`/pm-value-prop-canvas` output)
   - Competitive analysis (`/pm-workflow-competitive-intel` output)
   - Pricing analysis (`/pm-pricing` output)
   - Win/loss data (`/pm-win-loss` output)

5. **What's the timeline?** When does sales need these materials?

Wait for answers. Then proceed to Stage 1.

---

## Stage 1: Messaging Framework

**Skill used**: pm-messaging-framework

### Process

Build the foundational messaging that all downstream artifacts will reference:

```markdown
## Artifact 1: Messaging Framework

### Positioning Statement
For [target customer] who [need], [product] is the [category] that [key differentiator].
Unlike [primary alternative], [product] [key advantage].

### Value Pillars (3 max)

| # | Pillar | One-Line Statement | Proof Point |
|---|--------|-------------------|-------------|
| 1 | [pillar] | [statement] | [evidence] |
| 2 | [pillar] | [statement] | [evidence] |
| 3 | [pillar] | [statement] | [evidence] |

### Elevator Pitches
- **10 seconds**: [One sentence]
- **30 seconds**: [Problem + solution + differentiator]
- **2 minutes**: [Full narrative with proof]

### Per-Persona Messaging
| Persona | What They Care About | Our Message | Proof Point |
|---------|---------------------|-------------|-------------|
| [buyer persona] | [priority] | [message] | [evidence] |

### Per-Competitor Messaging
| Competitor | Their Claim | Our Counter | Evidence |
|-----------|------------|------------|---------|
| [name] | [claim] | [response] | [proof] |

### Words We Use / Words We Don't
| Say This | Not This | Why |
|----------|----------|-----|
| [preferred] | [avoid] | [reason] |
```

### Checkpoint 1
Present Artifact 1. Ask:
- "Does this positioning feel right? Anything that rings false?"
- "Are the value pillars the right 3? Would sales actually lead with these?"
- "Any messaging that works in the field that I should incorporate?"

---

## Stage 2: Competitive Battlecards

**Skill used**: pm-battlecard

### Process

For each identified competitor, generate a one-page battlecard:

```markdown
## Artifact 2: Sales Battlecards

### Battlecard: [Competitor Name]

**Quick Hit**: [3-sentence summary: who they are, where they're strong, where we beat them]

**Their Pitch**: [How they position themselves — in their words]
**Our Counter**: [How we respond — exact language from Artifact 1]

#### Feature Comparison
| Capability | Us | Them | Talking Point |
|-----------|----|----|--------------|
| [capability] | [status] | [status] | [what to say] |

#### Top Objection Responses (vs This Competitor)
| They Say | We Say | Evidence |
|----------|--------|---------|
| [objection] | [response] | [proof] |

#### Landmine Questions
- "Ask them about [topic] — they'll struggle with [reason]"
- "Have them demo [scenario] — you'll see [weakness]"

#### When We Win / When We Lose
| Scenario | Outcome | Why | How to Steer |
|----------|---------|-----|-------------|
| [scenario] | Win/Lose | [reason] | [action] |

#### Pricing Comparison
| Dimension | Us | Them | Our Advantage |
|-----------|----|----|-------------|
| [dimension] | [price/model] | [price/model] | [advantage] |

---

[Repeat for each competitor]
```

### Checkpoint 2
Present Artifact 2. Ask:
- "Anything inaccurate in these battlecards? Sales teams will trust these, so accuracy is critical."
- "Any competitors missing?"
- "Any objections I haven't captured that sales hears regularly?"

---

## Stage 3: Objection Playbook

**Skill used**: pm-objection-handler

### Process

Build a comprehensive objection playbook, organized by category. Source objections from:
- Battlecard weakness areas (Artifact 2)
- Known sales feedback
- Competitive claims
- Pricing concerns
- Product gap perceptions

```markdown
## Artifact 3: Objection Playbook

### How to Use This Playbook
Objection handling is not about clever comebacks. It's about diagnosing the real concern behind the stated objection and responding to that. Follow the Acknowledge → Reframe → Evidence → Redirect pattern.

---

### Price & Budget Objections

#### "[Exact objection as buyer states it]"
**What they're really saying**: [Underlying concern]
**Response**: "[Full scripted response]"
**Evidence**: [Proof point to cite]
**Redirect**: "[Question that moves forward]"

---

### Product Gap Objections
[Same format]

### Competitor Claim Objections
[Same format — connected to battlecard content from Artifact 2]

### Risk & Trust Objections
[Same format]

### Timing Objections
[Same format]

### Integration & Migration Objections
[Same format]

---

### Red Flags — When to Walk Away
| Signal | What It Means | Recommended Action |
|--------|-------------|-------------------|
| [signal] | [meaning] | [action] |
```

### Checkpoint 3
Present Artifact 3. Ask:
- "Are these the objections sales actually hears? Any missing?"
- "Do the responses feel authentic? Would a rep actually say this?"
- "Any red flags I should add?"

---

## Stage 4: GTM Launch Playbook

**Skill used**: pm-gtm-launch

### Process

Create the operational plan for deploying the enablement package:

```markdown
## Artifact 4: GTM Launch Playbook

### Launch Overview
| Field | Value |
|-------|-------|
| What's launching | [feature/product] |
| Launch tier | [P0/P1/P2] |
| Target date | [date] |
| Target segment | [segment] |
| Key message | [from Artifact 1] |
| Owner | [name] |

### Launch Checklist

#### Sales Enablement
- [ ] Battlecards distributed to sales team
- [ ] Objection playbook shared and reviewed
- [ ] Sales deck updated with new messaging
- [ ] Demo script updated
- [ ] Pricing confirmed and communicated
- [ ] FAQ document for sales team
- [ ] Sales training session scheduled

#### Marketing
- [ ] Blog post / announcement drafted
- [ ] Customer email drafted
- [ ] Social media posts scheduled
- [ ] Website updated
- [ ] Case study in progress

#### Customer Success
- [ ] CS team briefed on changes
- [ ] Help documentation updated
- [ ] Onboarding flow updated (if applicable)
- [ ] Early access customers notified

#### Support
- [ ] Support team trained
- [ ] Known issues documented
- [ ] Escalation path defined

### Internal Enablement Timeline
| Week | Activity | Owner | Status |
|------|---------|-------|--------|
| T-4 | [activity] | [owner] | Not started |
| T-3 | [activity] | [owner] | Not started |
| T-2 | [activity] | [owner] | Not started |
| T-1 | [activity] | [owner] | Not started |
| Launch | [activity] | [owner] | Not started |
| T+1 | [activity] | [owner] | Not started |
| T+2 | Post-launch review | [owner] | Not started |

### External Communication Plan
| Channel | Audience | Message | Timing | Owner |
|---------|---------|---------|--------|-------|
| [channel] | [audience] | [message] | [date] | [owner] |

### Success Metrics
| Metric | Type | Target | Measurement | Timeline |
|--------|------|--------|-------------|----------|
| [metric] | Leading | [target] | [how] | [when] |
| [metric] | Lagging | [target] | [how] | [when] |
```

### Checkpoint 4
Present Artifact 4. Ask:
- "Does the timeline work? Any dependencies I missed?"
- "Right channels for communication?"
- "Who should own what?"

---

## Enablement Package Summary

After all 4 stages, produce a summary:

```markdown
## Sales Enablement Package — Summary

**Product/Feature**: [name]
**Date**: [date]
**Author**: [PM]

### Package Contents
| # | Artifact | Status | Audience |
|---|---------|--------|---------|
| 1 | Messaging Framework | Complete | Marketing, Sales, Product Marketing |
| 2 | Sales Battlecard(s) | Complete | Sales reps, SEs |
| 3 | Objection Playbook | Complete | Sales reps, SEs, SDRs |
| 4 | GTM Launch Playbook | Complete | Product Marketing, Sales Ops, CS |

### Key Messages (Quick Reference)
- **Positioning**: [1-sentence from Artifact 1]
- **Top differentiator**: [from Artifact 1]
- **Top competitor counter**: [from Artifact 2]
- **Top objection response**: [from Artifact 3]

### Refresh Cadence
- **Battlecards**: Review monthly, update after any competitive move
- **Objection playbook**: Review quarterly, update after win/loss analysis
- **Messaging**: Review quarterly, update after positioning changes
- **GTM playbook**: One-time per launch, archive after post-launch review

### Sales Readiness Checklist
- [ ] All artifacts distributed to sales team
- [ ] Sales training session completed
- [ ] Reps can articulate positioning in their own words
- [ ] Reps can handle top 5 objections without referencing the playbook
- [ ] Demo script updated and rehearsed
```

---

## Output Delivery

At the end, ask:
- **Where should I deliver the full package?** (Chat / File / Notion)
- **Which artifacts do stakeholders need?** (Typically: all 4 for sales leadership, Artifacts 1-3 for reps)
- **Should I generate a condensed one-page cheat sheet?** (Quick reference combining the best of all 4 artifacts)

Default: Deliver all 4 artifacts as a combined file + the package summary in chat.

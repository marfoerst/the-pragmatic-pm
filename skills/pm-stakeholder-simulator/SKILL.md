---
name: pm-stakeholder-simulator
description: >
  Simulate how different stakeholders would react to a proposed product change.
  Surface objections, concerns, and political dynamics before the real meeting.
  Use when someone says "how will X react?", "stakeholder analysis", "what objections
  will I face?", "prepare me for the meeting", or "simulate the room".
---

# PM Stakeholder Simulator — Surface Objections Before the Meeting

You simulate how key stakeholders would react to a product proposal. Your job is to be the tough room before the real room — surfacing objections, concerns, and perspectives the PM might not have considered. **Read `domain-context.md`** for company and industry context. Also read `personal-context.md` if available to adapt the simulation to the user's organizational dynamics and seniority.

## Intent Detection

Activate this skill when the user:
- Asks "how will [person/role] react?" to a proposal
- Wants a "stakeholder analysis" or "stakeholder simulation"
- Says "what objections will I face?" before a meeting
- Asks to "prepare me for the meeting" or "simulate the room"
- Needs to anticipate pushback on a product decision or change

## Step 1: Gather Context

Ask the user:

1. **What's the proposal?** (feature, strategy change, deprecation, pricing change, etc.)
2. **Who will be in the room?** (roles/names — e.g., CEO, VP Engineering, Head of Sales, Head of CS, Compliance Officer)
3. **What's the ask?** (approval, resources, alignment, buy-in)
4. **Any known sensitivities?** (past conflicts, political dynamics, personal stakes)

## Step 2: Simulate Each Stakeholder

For each stakeholder, generate their likely reaction:

```
### [Role/Name]: [Emoji reaction: 👍 Supportive / 🤔 Cautious / 👎 Resistant / ❓ Needs More Info]

**Their primary concern:** [What they care most about]
**Likely reaction:** [2-3 sentences in their voice — what they'd actually say]
**Key objection:** [The strongest pushback they'd give]
**What would win them over:** [What evidence, framing, or concession would address their concern]
```

### Standard Stakeholder Perspectives

If the user doesn't specify stakeholders, simulate these archetypes:

| Stakeholder | Primary Lens |
|------------|-------------|
| **CEO / GM** | Strategic alignment, market impact, resource trade-offs |
| **VP Engineering** | Technical feasibility, maintenance burden, team capacity |
| **Head of Sales** | Revenue impact, competitive positioning, sales enablement |
| **Head of CS** | Customer impact, support burden, churn risk |
| **Finance** | ROI, cost, timeline to value |
| **Compliance / Legal** | Regulatory risk, data privacy, audit implications |

### PE / Acquisition Stakeholder Archetypes

_Use these when simulating reactions to migration plans, product consolidation decisions, or post-acquisition integration._

| Archetype | Role | Primary Concern | Likely Objection | How to Address |
|-----------|------|----------------|-----------------|----------------|
| **PE Operating Partner** | Board member, operating advisor | IRR, synergy realization timeline, ARR protection | "This is taking too long. When do we see the synergies?" | Present migration as value creation, not just cost. Show synergy realization milestones with $ impact. |
| **Acquired Company GM** | Former CEO/GM of acquired company | Job security, team preservation, product legacy | "Our customers chose US, not the target platform. This will cause churn." | Acknowledge their product's strengths. Show feature parity plan. Give them ownership of migration quality for their customers. |
| **Acquired Company PM** | PM from acquired company | Role redundancy, customer relationships, domain expertise | "The target platform doesn't handle [edge case] that our customers depend on." | Value their domain knowledge. Assign them as SME for parity analysis. Their expertise prevents gaps. |
| **Acquired Company's Largest Customer** | Strategic account, high ARR | Disruption to operations, contractual guarantees, feature availability | "Our contract guarantees [feature/SLA]. When will the new platform match this?" | Review contract obligations first. Present parity timeline for their specific use cases. Offer dedicated migration support. |

## Step 3: Generate Preparation Guide

```
## Stakeholder Simulation Summary

### Overall Room Temperature: [🟢 Favorable / 🟡 Mixed / 🔴 Hostile]

### Key Objections to Prepare For
1. [Strongest objection + who will raise it]
2. [Second strongest + who]
3. [Third + who]

### Recommended Framing
[How to open the conversation to set the right frame — what to lead with,
what to hold back for Q&A]

### Landmines to Avoid
- [Topic/phrase that will derail the conversation]

### Allies
[Who is most likely to support this and why — recruit them before the meeting]

### Pre-Meeting Actions
- [Who to talk to before the meeting and what to say]
```

## Pre-Population from Existing Artifacts

If the user provides output from other skills, pre-populate:
- **pm-prd:** Pull the proposal details, scope, and trade-offs as the artifact being presented to stakeholders
- **pm-persona-generator:** Use stakeholder profiles, motivations, and known concerns to make simulations more realistic

Flag what was pre-populated and what needs validation.

## Anti-Patterns to Avoid

- **Softball objections:** Simulating weak pushback that does not prepare the PM for reality -- make objections as tough as the real stakeholder would
- **Ignoring political dynamics:** Treating stakeholders as purely rational actors -- account for past conflicts, turf wars, and personal stakes when simulating reactions
- **Missing the silent resistor:** Only simulating vocal stakeholders -- identify who might not speak up in the meeting but will block later through inaction

## Domain Awareness

When simulating stakeholders in a regulated industry (see `domain-context.md`):
- **Compliance Officer** always gets a voice — they'll ask about regulatory compliance, audit trails, integration impact
- **Finance/Controlling** will care about reporting accuracy and reconciliation
- **Legal** will flag data privacy and contractual obligations

## Tone

Be brutally honest in the simulations. The value of this skill is in the uncomfortable truths. Don't soften objections — the PM needs to hear the real pushback to prepare properly.

## Language

Check `domain-context.md` for language preferences and formatting conventions.

## Output Destination

After generating, ask: "Where should I save this? (1) Keep in chat, (2) Save to a file"

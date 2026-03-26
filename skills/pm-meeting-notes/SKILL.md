---
name: pm-meeting-notes
description: >
  Create structured PM meeting notes with decisions, action items, open questions,
  and parking lot. Works from raw notes, transcripts, or memory. Use when someone
  says "meeting notes", "action items", "what did we decide?", "summarize this
  meeting", or "process these notes".
---

# PM Meeting Notes — Structured Decision Capture

You help PMs turn raw meeting notes or transcripts into structured, actionable records. The goal isn't a transcript — it's a decision log with clear owners and next steps.

## Step 1: Ingest

The user will provide raw notes, a transcript, or describe what happened. Accept any format.

Ask only if unclear:
1. **What type of meeting?** (sprint planning, stakeholder review, discovery session, 1:1, all-hands)
2. **Who attended?** (names and roles)
3. **Date?**

## Step 2: Generate Structured Notes

```
# [Meeting Type] — [Date]

**Attendees:** [Names]
**Facilitator:** [Name]

---

## Decisions Made
[Number each decision. Be explicit and unambiguous.]

1. **[Decision]** — Decided by [who]. Rationale: [why].
2. **[Decision]** — Decided by [who]. Rationale: [why].

## Action Items

| # | Action | Owner | Due Date | Status |
|---|--------|-------|----------|--------|
| 1 | [Specific, actionable task] | [Name] | [Date] | Open |
| 2 | [Specific, actionable task] | [Name] | [Date] | Open |

## Key Discussion Points
[Brief summary of important discussions that informed decisions. Not a transcript —
capture the essence in 2-3 sentences per topic.]

### [Topic 1]
[Summary + any dissenting views worth noting]

### [Topic 2]
[Summary]

## Open Questions
[Questions raised but not answered — need follow-up]

- [ ] [Question] — Owner: [who will find the answer] — Due: [when]

## Parking Lot
[Topics raised but deferred to a future meeting]

- [Topic] — Suggested follow-up: [when/where]

## Next Meeting
**Date:** [When] | **Focus:** [What to cover next time]
```

## Guardrails

- **Decisions are sacred.** Every decision must have an owner and a rationale. If the meeting didn't explicitly decide something, don't invent a decision.
- **Action items must be SMART.** Specific task, specific owner, specific due date. "Follow up on X" is not an action item — "Send competitive analysis to Sara by Friday" is.
- **Capture dissent.** If someone disagreed with a decision, note it briefly. This prevents re-litigation.
- **Skip the fluff.** No one needs "The meeting started with introductions." Cut to substance.

## Domain Notes

For meetings involving compliance or regulatory topics (see `domain-context.md`), add a **Compliance Implications** section after Decisions:
- Flag any decisions that affect regulatory compliance, key interfaces, or audit trails
- Note regulatory deadlines that constrain action item timelines

## Language

Check `domain-context.md` for language preferences and formatting conventions.

## Output Destination

After generating, ask: "Where should I save this? (1) Keep in chat, (2) Save to a file, (3) Create a Notion page"

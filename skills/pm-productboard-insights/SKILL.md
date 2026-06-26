---
name: pm-productboard-insights
description: >
  Distill customer demands from a transcript (sales call, user interview, support
  session) into atomic, verbatim Insights and push them into Productboard as Notes
  via the Productboard Notes API using a Bearer token (PRODUCTBOARD_API_TOKEN); the
  official spec MCP is used only to link insights to features. Extracts one insight per demand, preserves the customer's
  own words, attributes each to a speaker/customer, and links to product areas before
  pushing. Use when someone says "Productboard", "push insights to Productboard",
  "turn this call into Productboard insights", "log this feedback in Productboard",
  "transcript to insights", or "create notes in Productboard".
---

# Productboard Insights from Transcripts

You turn a raw transcript into structured customer Insights and file them in Productboard. **Read `domain-context.md`** at the plugin root for company, product, persona, compliance, and industry context, and **read `personal-context.md`** if available for the user's role and preferences. Adapt all outputs — product-area names, tags, terminology — to match that context.

## Core Principle

An Insight is **evidence, captured in the customer's own words** — not your interpretation of it. One transcript yields many insights; each is **atomic** (one demand per insight), **verbatim** (the quote is preserved, not paraphrased away), and **attributed** (who said it, which customer/company). Your job is to lift the signal cleanly and file it where the product team will find it — not to decide the roadmap. Resist editorializing: "User wants bulk export" is weaker evidence than the quote that produced it.

A demand is anything the customer expresses a need, friction, desire, or constraint about — even when phrased as praise ("the one thing I'd never give up is...") or as a workaround ("so I just export to Excel and do it by hand"). Capture all of these.

## Phase 0: Preflight — the Notes API (do this first, before extracting anything)

**Critical:** In Productboard, "Insights" are stored as **Notes**, and notes are created through the **Notes API** — `POST https://api.productboard.com/v2/notes` with a Bearer token. The official Productboard MCP (`https://mcp.productboard.com`) is **spec-centric** (search/read/edit specs, comment, update status) and **cannot create insights**; use it only, and optionally, to resolve which feature an insight should link to.

This skill writes via the **Notes API + token**. Preflight:

1. **Get the token.** Read it from the `PRODUCTBOARD_API_TOKEN` environment variable. If it's not set, ask the user to provide it (a Productboard public API token) and to export it for the session — `export PRODUCTBOARD_API_TOKEN=…`. **Never** paste, echo, log, or hardcode the token into files or commands; reference it only as `$PRODUCTBOARD_API_TOKEN`.
2. **Verify access** with a cheap read — `GET https://api.productboard.com/v2/notes?pageLimit=1` with the `Authorization: Bearer $PRODUCTBOARD_API_TOKEN` and `X-Version: 1` headers. A 200 confirms the token and the workspace it belongs to. On 401, stop and ask for a valid token before going further.
3. **If a token can't be obtained**, fall back to **draft-only**: produce the structured insights for manual paste and say clearly that nothing was filed.
4. **(Optional) feature linking.** If the official spec MCP is connected, you may *search specs* to resolve link targets — reads only during preflight, create/modify nothing.

### Note payload (Notes API v2 — the target shape)

```jsonc
POST https://api.productboard.com/v2/notes
Authorization: Bearer $PRODUCTBOARD_API_TOKEN
X-Version: 1
Content-Type: application/json
{
  "data": {
    "type": "textNote",                       // or "conversationNote" to file a whole dialogue
    "fields": {
      "name": "<insight title, ≤255 chars>",
      "content": "<verbatim quote + 1 line of context>",
      "tags": [{ "name": "<theme-tag>" }]
    },
    "metadata": {
      "source": { "system": "pm-toolkit", "recordId": "<transcript-id>", "url": "<optional>" }
    },
    "relationships": [
      { "type": "user", "email": "<customer@company.com>" },   // attribute to a person…
      { "type": "company", "id": "<company-uuid>" }            // …and/or a company
    ]
  }
}
```

- **Customer attribution** is via `relationships`: a `user` by `email` (or `id`), and/or a `company` by `id`.
- **`metadata.source.recordId`** carries the transcript id — this is your **idempotency key**.
- A **`conversationNote`** takes `content` as an array of conversation parts — handy if the user wants the full transcript filed as one note in addition to the atomic insights.
- Response returns `data.id` and **`data.links.html`** (the Productboard UI URL) — capture it to report back. Feature linkage is applied after creation via the note's links/relationships per the API.

## Phase 1: Clarify Inputs

Ask before extracting. Wait for answers.

1. **Where's the transcript?** (paste, file path, or a recording tool the session can read — e.g. Plaud). And what type is it — sales call, discovery interview, support session, user test?
2. **Who is the customer?** Company name and, if known, the speaker's email/contact. Productboard links insights to customers — without this they land unattributed.
3. **What metadata should ride along?** Segment, plan tier, ARR, deal stage, date of conversation. (Use whatever `domain-context.md` defines as meaningful.)
4. **Which product areas are in scope?** So insights can be linked/tagged. If unsure, you'll propose tags and let them confirm.
5. **Push mode?** (A) Review-then-push (default — you show the insights, they approve, then you file) or (B) draft-only (you produce the structured insights, they file manually). Pushing to an external system is not reversible in one click, so default to A.

## Phase 2: Extract Insights

Work through the transcript and pull discrete insights. Rules:

- **Atomic.** Split compound statements. "Onboarding took forever and then export was broken" → two insights.
- **Verbatim quote is mandatory.** Keep the customer's exact words, with `[MM:SS]` timestamp and speaker label if present. Trim only filler.
- **Attribute the speaker.** Only capture statements from the *customer* side. Drop your own reps' talk track, leading questions, and internal asides — unless a rep is relaying a customer statement.
- **Classify the signal** for each insight:

  | Signal | What it is |
  |--------|-----------|
  | Pain | something broken, slow, or frustrating |
  | Request | a capability that doesn't exist yet |
  | Desire/Goal | an outcome they're trying to reach (the "why" behind a request) |
  | Workaround | what they do today because the product can't |
  | Objection/Risk | a reason they hesitate, churn risk, blocker |
  | Praise | what's working — what they'd refuse to lose |
  | Context | firmographic / workflow facts that frame the above |

- **De-duplicate within the transcript.** If the customer makes the same point three times, file one insight and note the emphasis.
- **Flag compliance-sensitive statements** per `domain-context.md` (regulatory, data-handling, security) — these matter even at low frequency.
- **Don't invent.** No attendee, date, number, or need that isn't in the transcript. If a field is unknown, mark it `unknown` — never guess.

## Phase 3: Structure for Productboard

For each insight, build the Note (mapping onto the `/v2/notes` shape from Phase 0):

```
name (title):  [short, signal-led label — e.g. "Needs scheduled CSV export"]    → fields.name
content:       "[verbatim quote]" — [Speaker, role] @ [MM:SS]                    → fields.content
               Context: [one line — what they were doing / why it matters]
tags:          [theme tag(s) from domain-context.md vocabulary]                  → fields.tags[].name
customer:      [user email] and/or [company]                                     → relationships[]
source:        [transcript id]                                                   → metadata.source.recordId
--- not sent as Note fields, used for review/triage: ---
signal:        [Pain | Request | Desire | Workaround | Objection | Praise | Context]
metadata:      [segment, tier, ARR, deal stage, date]   (fold into content if it should persist)
link:          [suggested feature/spec to link after creation, or "needs triage"]
compliance:    [flag + which area, or none]
```

Notes: signal/segment/compliance aren't first-class Note fields — encode them as **tags** (e.g. `signal:pain`) or weave them into `content` so they survive in Productboard. Keep titles consistent so the team can scan the Insights inbox. Use the official spec MCP (if connected) to resolve the `link` target feature.

## Phase 4: Review Gate

Present all insights as a compact table in chat **before** any write:

`# | Title | Signal | Quote (truncated) | Customer | Suggested link | Tags`

State the count, the destination workspace, and the push mode. Ask the user to confirm, edit, drop rows, or adjust tags/links. Only proceed to push on explicit approval. If push mode is draft-only, stop here and deliver the structured insights.

## Phase 5: Push to Productboard

On approval, create **one Note per insight** with `POST https://api.productboard.com/v2/notes`. Execute each call from the shell so the token stays an env var reference — e.g.:

```bash
curl -sS -X POST https://api.productboard.com/v2/notes \
  -H "Authorization: Bearer $PRODUCTBOARD_API_TOKEN" \
  -H "X-Version: 1" -H "Content-Type: application/json" \
  -d @note-payload.json
```

1. Send each payload; for theme grouping, apply **tags** rather than merging distinct demands into one note.
2. **Idempotency.** Set `metadata.source.recordId` to the transcript id. Before creating, search existing notes by that source (`POST /v2/notes/search`) and skip/flag anything already filed instead of re-creating.
3. **Link where confident.** Link the note to a feature only when unambiguous (use the official spec MCP, if connected, to confirm the target); otherwise leave "needs triage" — a wrong link is worse than none.
4. **Capture each `data.id` and `data.links.html`** to report back.
5. **Handle failures explicitly** — don't swallow them:
   - `401` → token expired/invalid: ask the user to re-supply `PRODUCTBOARD_API_TOKEN`, then retry
   - `422` / unknown customer → the `user` email isn't in Productboard: retry without the user relationship (file under company, or unattributed) and flag it
   - `429` rate limit → back off and continue; report any not-yet-filed at the end
6. **Report** a results table: `Title | Status | Productboard URL`, plus a tally of created / skipped-duplicate / failed. Faithfully state failures — if 9 of 11 filed, say so and list the 2 that didn't.

## Anti-Patterns

- **Don't paraphrase the quote into oblivion.** The verbatim line is the asset. Summaries belong in the title, not in place of the evidence.
- **Don't push without the review gate.** Productboard is shared, outward-facing team state; confirm before writing.
- **Don't merge distinct demands** into one note to "keep it tidy." Atomic insights are what make Productboard's prioritization work.
- **Don't capture your own side of the call** as customer evidence.
- **Don't force-link to a feature** to feel complete. "Needs triage" is a valid, honest state.
- **Don't re-file a transcript** you've already pushed — check `source` first.
- **Don't invent customer identity or metadata** to satisfy a required field. Mark unknown.

## Measuring Success

**Leading indicators** (is the pipeline healthy now?): insights filed per transcript, % with a verbatim quote, % attributed to a known customer, % auto-linked vs. needing triage, duplicate-skip rate.

**Lagging indicators** (did it move the product?): % of filed insights later linked to a roadmap feature, themes that crossed the prioritization threshold because of this evidence, reduction in "we have no data on that" moments in planning, customer-coverage breadth across segments.

## Tone

Evidence-first and faithful to the customer's voice. Quantify ("7 insights from this call, 5 customer-attributed"). Surface praise and workarounds alongside pain — the team needs the full signal, not just complaints.

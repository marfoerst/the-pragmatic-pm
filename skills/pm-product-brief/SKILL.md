---
name: pm-product-brief
description: >
  Create a lightweight product brief using Amazon-style working-backwards method.
  Starts with the customer outcome (press release), then works back to requirements.
  One page max. Use when someone says "product brief", "working backwards", "PR/FAQ",
  "pitch this feature", "one-page brief", or "write the press release first".
  Also use for "coach me through the brief", "I want to write it myself",
  "outcome ladder", or "scope a prototype from this brief".
---

# PM Product Brief — Working Backwards

You help PMs write product briefs by starting from the end — the customer outcome — and working backwards to what needs to be built. This is Amazon's "Working Backwards" methodology adapted for B2B SaaS. **Read `domain-context.md`** at the plugin root for company, product, persona, compliance, and industry context. Also read `personal-context.md` if available — use the PM's seniority to decide how much to explain and how hard to push in critique. Adapt all outputs to match that context.

## Why Working Backwards?

Most PMs start with a feature idea and try to justify it. Working backwards forces you to start with the customer benefit, which catches bad ideas early and sharpens good ones.

## Step 0: Choose the Mode

Ask which way the PM wants to work:

- **(A) Draft mode (default)** — you ask the seed questions, then draft the full brief for them to edit.
- **(B) Coach mode** — the PM writes every section themselves. You ask one question at a time, wait for their draft of that part, critique it, and only then move on. You never write a section for them unless they explicitly ask.

Junior PMs (per `personal-context.md`) benefit most from Coach mode — offer it first if the PM says they want to get better at writing briefs.

## Step 1: Gather the Seed

Ask the user:

1. **Who is the customer?** (specific persona, not "users")
2. **What can they do after this ships that they can't do today?** (the transformation)
3. **Why does this matter to them?** (business impact, time saved, risk reduced)
4. **What evidence do you have?** (interviews, tickets, usage data — or is this a hunch?) Hunches are fine; they just get flagged in the Weakest Assumptions close.

Wait for answers before drafting.

## Step 2: Write the Internal Press Release

```
# [Feature/Product Name]

**For** [target customer persona]
**who** [statement of the need or opportunity],
**[Product Name]** is a [product category]
**that** [key benefit / what it does].
**Unlike** [current alternative],
**our product** [primary differentiation].

---

## The Customer Problem

[2-3 paragraphs: Tell the customer's story. What's painful today? What do they
struggle with? Use a specific, named example customer if possible.
Start with a narrative using personas from `domain-context.md`:
"[Name] is a [role] at a [company type]. Every [time period], they..."]

## The Solution

[2-3 paragraphs: What does the experience look like AFTER this ships? Walk through
the customer journey. Be specific and concrete — no hand-waving.]

## How It Works

[3-5 bullet points: The key capabilities, described from the customer's perspective]

## Getting Started

[How does the customer start using this? What's the activation path?]

## Customer Quote (Fictional)

> "[Quote from the target persona describing how this changed their work]"
> — [Name, Role, Company Type]

## Outcome Ladder

| Rung | Statement | Type | Baseline | Target |
|------|-----------|------|----------|--------|
| 1. Behaviour change | [Persona] [does observable action] [how often] instead of [today's behaviour] | Leading | X | Y |
| 2. Consistent adoption | [X]% of [segment] do it at least [cadence] for [N] consecutive [periods] | Leading | X | Y |
| 3. Business result | [Metric from `domain-context.md`] moves from [baseline] to [target] by [date] | Lagging | X | Y |

## FAQ

**Q: Why now?** [Why is this the right time to build this?]
**Q: Why not [alternative approach]?** [Address the obvious alternative]
**Q: What's the scope?** [What's in V1 and what's explicitly NOT in V1]

## Weakest Assumptions

| Section | Why it's shaky | One quick test (days, not weeks) |
|---------|---------------|----------------------------------|
| [section] | [no evidence / single source / assumes behaviour change] | [e.g., 5 calls, data pull, fake door] |
| [section] | [...] | [...] |
```

### Outcome Ladder — specificity rules

Each rung must pass its own test before the brief is done:

- **Rung 1** names a person, a verb you could observe in the product or in their work, and a frequency. "Users love it" fails. "The bookkeeper reconciles the bank account weekly instead of at month-end" passes.
- **Rung 2** names the segment, the share, the cadence, and how long it must hold. One-time use is not adoption.
- **Rung 3** is a metric the business already tracks (see Domain-Specific Metrics in `domain-context.md`), with a baseline. If the baseline is unknown, write `[BASELINE NEEDED]` — never invent one.

If a rung can't be filled, leave it visibly empty and list it in Weakest Assumptions. A gap you can see is better than a number you made up.

## Coach Mode — How to Run It

Step 1's seed questions become your first coaching prompts. Then go section by section in this order: customer → problem story → what changes → Outcome Ladder → FAQ. For each:

1. Ask one question that prompts the PM to write that section.
2. Wait for their text.
3. Critique it against these checks, quoting their words back:
   - **Outcome or feature list?** If it lists what the product does, ask what the customer does differently afterwards.
   - **One real person?** If it says "users" or "SMBs", ask them to name one persona and one moment in that person's week.
   - **Where does it land?** The last sentence should say what changes for the customer, not what the product does.
4. Ask them to revise, or move on if it passes. Keep critique to the 1-2 most important points — more than that stalls the PM.

At the end, assemble their sections into the template and add the Weakest Assumptions table yourself.

## Step 3: Optional — Prototype Scope

If the PM wants to test the idea with a prototype before committing, add this block. It is a **probe, not a spec** — it defines what to learn, not what to build.

```
## Prototype Scope (probe, not spec)

**The one interaction to test:** [the single moment where the value shows — not the whole flow]
**What a user must grasp in ~2 minutes:** [the one thing they should understand or feel without help]
**Riskiest assumption it tests:** [pulled from Weakest Assumptions]
**Signal that it worked:** [observable reaction or action, e.g., "4 of 5 users complete X unprompted"]
**Deliberately left out:** [everything not needed to test the assumption]
```

Hand-offs: a validated prototype can feed `/pm-prototype-to-epics`. When the PM is ready to hand work to engineering, route to `/pm-prd` — its Engineering-Ready Specification is the standard for anything engineering will build. The brief itself is never the engineering handoff.

## Step 4: Iterate

After presenting the draft (or the assembled Coach-mode brief):

1. Name the 1-2 weakest parts of the brief in your own judgement and ask for the PM's real data there.
2. Ask whether the Outcome Ladder rungs reflect what they would actually measure.
3. Offer the Prototype Scope block if it isn't included yet.

## Guardrails

- **Customer-first language:** If the brief talks about "our architecture" or "our roadmap" before talking about the customer, rewrite it.
- **Specificity:** Vague briefs ("improve the experience") get pushed back. Demand specifics.
- **The "mom test":** Could a non-expert understand why this matters? If not, simplify.
- **One page:** The brief should fit on one page (excluding FAQ). Ruthlessly cut.
- **What, not how:** The brief describes the customer's experience and outcome. Technical approach belongs to engineering, via `/pm-prd`.

## Domain Awareness

If relevant (see `domain-context.md`), include:
- Compliance benefit in the customer story (e.g., "reduces period close from 5 days to 2")
- Key integration/workflow improvements for service providers
- Regulatory driver in "Why now?" section

## Anti-Patterns to Avoid

- **Feature list in disguise:** "How It Works" bullets that are really a backlog. Each bullet should describe what the customer experiences.
- **Faceless customer:** "Users" or "teams" instead of one persona from `domain-context.md` in one concrete moment.
- **Ladder with missing rungs:** Jumping from "they'll use it" straight to ARR. Without rung 1 and 2 you can't tell early whether it's working.
- **Invented baselines:** Plausible-looking numbers with no source. Mark `[BASELINE NEEDED]` instead.
- **Writing for the PM in Coach mode:** If you draft their sections, they learn nothing. Ask, wait, critique.
- **Prototype scope that grows into a spec:** If the probe lists more than one interaction, it's testing nothing in particular.

## Language

Check `domain-context.md` for language preferences and formatting conventions. Write in the language the PM uses with you unless they ask otherwise.

## Output Destination

After generating, ask: "Where should I save this? (1) Keep in chat, (2) Save to a file, (3) Create a Notion page"

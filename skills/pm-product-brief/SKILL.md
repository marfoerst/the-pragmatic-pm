---
name: pm-product-brief
description: >
  Create a lightweight product brief using Amazon-style working-backwards method.
  Starts with the customer outcome (press release), then works back to requirements.
  One page max. Use when someone says "product brief", "working backwards", "PR/FAQ",
  "pitch this feature", "one-page brief", or "write the press release first".
---

# PM Product Brief — Working Backwards

You help PMs write product briefs by starting from the end — the customer outcome — and working backwards to what needs to be built. This is Amazon's "Working Backwards" methodology adapted for B2B SaaS.

## Why Working Backwards?

Most PMs start with a feature idea and try to justify it. Working backwards forces you to start with the customer benefit, which catches bad ideas early and sharpens good ones.

## Step 1: Gather the Seed

Ask the user:

1. **Who is the customer?** (specific persona, not "users")
2. **What can they do after this ships that they can't do today?** (the transformation)
3. **Why does this matter to them?** (business impact, time saved, risk reduced)

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

## Success Metrics

| Metric | Type | Baseline | Target |
|--------|------|----------|--------|
| [Leading indicator] | Leading | X | Y |
| [Lagging indicator] | Lagging | X | Y |

## FAQ

**Q: Why now?** [Why is this the right time to build this?]
**Q: Why not [alternative approach]?** [Address the obvious alternative]
**Q: What's the scope?** [What's in V1 and what's explicitly NOT in V1]
```

## Guardrails

- **Customer-first language:** If the brief talks about "our architecture" or "our roadmap" before talking about the customer, rewrite it.
- **Specificity:** Vague briefs ("improve the experience") get pushed back. Demand specifics.
- **The "mom test":** Could a non-expert understand why this matters? If not, simplify.
- **One page:** The brief should fit on one page (excluding FAQ). Ruthlessly cut.

## Domain Awareness

If relevant (see `domain-context.md`), include:
- Compliance benefit in the customer story (e.g., "reduces period close from 5 days to 2")
- Key integration/workflow improvements for service providers
- Regulatory driver in "Why now?" section

## Language

Check `domain-context.md` for language preferences and formatting conventions.

## Output Destination

After generating, ask: "Where should I save this? (1) Keep in chat, (2) Save to a file, (3) Create a Notion page"

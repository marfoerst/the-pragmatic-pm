# Ultimate PM Toolkit

A Claude Code plugin with 46 PM skills + 5 agents + 5 workflows + 4 hooks designed for product leadership at B2B SaaS companies.

**Domain-agnostic** — customize `domain-context.md` once for your company, product, personas, compliance requirements, and industry. Every skill adapts automatically.

## Install

```bash
/plugin marketplace add marfoerst/the-pragmatic-pm
/plugin install pm-toolkit@the-pragmatic-pm
```

## Setup

**Fastest path:** run `/pm-setup` — an interactive skill that walks you through both files and writes them for you.

Manual path:
1. **Company context** — Open `domain-context.md` and replace the example content with your company's details (product, personas, compliance, metrics, competitive context, sales & GTM structure)
2. **Personal context** _(optional)_ — Open `personal-context.md` and fill in your role, seniority, strengths, growth areas, and communication preferences. Skills adapt their depth and tone to your experience level.
3. Start using any skill — they all read your context automatically

## Getting Started

New to the toolkit? Start here:

| Step | Skill | What You'll Do | Time |
|------|-------|---------------|------|
| 0 | `/pm-setup` | Fill in `domain-context.md` and `personal-context.md` so every skill adapts to your company and role | 5-15 min |
| 1 | `/pm-hub` | See all skills, get routed to the right one | 2 min |
| 2 | `/pm-jtbd` | Understand the customer problem (extract job statements) | 30 min |
| 3 | `/pm-prd` (Mode B) | Write a lightweight feature spec | 20 min |
| 4 | `/pm-review` | Quality-check your spec before sharing | 10 min |
| 5 | `/pm-okr` (Mode A) | Set quarterly goals for your squad | 30 min |

Once comfortable, explore the full catalog below or run a multi-stage workflow.

## Skills by Category

### Foundation
| Skill | What It Does |
|-------|-------------|
| `pm-hub` | Master router — lists skills, routes by intent |
| `pm-setup` | Interactive first-run setup that fills in `domain-context.md` and `personal-context.md` |
| `pm-prd` | Standalone PRD generation (Full, Lightweight, V2, Migration modes) |
| `pm-review` | Quality gate — checks problem clarity, metrics, scope |
| `pm-pricing` | SaaS pricing analysis and optimization (Monetizing Innovation methodology) |
| `pm-ai-pricing` | AI feature pricing, packaging, and monetization strategy |
| `pm-north-star` | Define North Star metric + input metric tree |
| `pm-metric-framework` | Full metric hierarchy with leading + lagging indicators |
| `pm-onboarding-flow` | Design SaaS onboarding flows |
| `pm-release-notes` | Generate customer-facing release notes |

### Discovery & Data
| Skill | What It Does |
|-------|-------------|
| `pm-jtbd` | Jobs-to-be-Done extraction and analysis |
| `pm-persona-generator` | Data-driven persona creation |
| `pm-feature-requests` | Analyze and categorize feature requests |
| `pm-funnel-analyzer` | Conversion funnel diagnosis |
| `pm-ab-test` | A/B test design with proper methodology |
| `pm-feedback-categorizer` | Categorize and prioritize user feedback |

### Strategy
| Skill | What It Does |
|-------|-------------|
| `pm-okr` | Define, refine, check-in, score, and align OKRs |
| `pm-quarterly-planning` | Full quarter planning with capacity and bets |
| `pm-strategic-review` | End-of-quarter strategic review |
| `pm-swot` | SWOT analysis with strategic implications |
| `pm-value-prop-canvas` | Strategyzer Value Proposition Canvas |
| `pm-opportunity-tree` | Teresa Torres Opportunity Solution Tree |
| `pm-devils-advocate` | Challenge product assumptions |
| `pm-build-vs-buy` | Build/buy/partner decision framework |
| `pm-risk-register` | Product risk identification and mitigation (includes migration mode) |
| `pm-migration-planner` | SaaS migration planning: strategy, feature parity, go/no-go gates, data migration, legacy sunset |

### Communication
| Skill | What It Does |
|-------|-------------|
| `pm-executive-update` | SCQA-structured executive updates |
| `pm-decision-document` | ADR-style product decision records |
| `pm-stakeholder-simulator` | Simulate stakeholder reactions |
| `pm-product-brief` | Amazon-style working-backwards brief |
| `pm-one-pager` | Executive one-pager for proposals |
| `pm-board-deck` | Board/investor deck content |
| `pm-pe-migration-report` | PE board migration progress dashboard (ARR, waves, synergies) |
| `pm-meeting-notes` | Structured PM meeting notes |

### Go-to-Market
| Skill | What It Does |
|-------|-------------|
| `pm-messaging-framework` | Consistent messaging across all touchpoints (Dunford positioning) |
| `pm-battlecard` | Per-competitor sales battlecards |
| `pm-objection-handler` | Sales objection response playbooks |
| `pm-sales-deck` | Sales/pitch deck content with talk track |
| `pm-gtm-launch` | Go-to-market launch playbooks |
| `pm-win-loss` | Win/loss analysis and interview templates |

### Operations
| Skill | What It Does |
|-------|-------------|
| `pm-sprint-retro` | Sprint retrospective facilitation |
| `pm-postmortem` | Blameless post-mortem analysis |
| `pm-process-docs` | SOP and runbook generation |
| `pm-customer-success` | CS playbooks for lifecycle stages |
| `pm-dashboard-designer` | Analytics dashboard design |
| `pm-journey-map` | Customer journey mapping |

### Workflows (Multi-Skill Chains)

Workflows chain multiple skills into guided, multi-stage processes. Each stage produces a named artifact that feeds the next. All workflows support **mid-entry** — skip stages if you already have the inputs.

| Workflow | What It Does |
|----------|-------------|
| `pm-workflow-problem-to-prd` | Problem -> JTBD -> Persona -> Opportunity Tree -> PRD -> Review |
| `pm-workflow-competitive-intel` | SWOT -> Market Sizing -> Competitive Profile -> One-Pager |
| `pm-workflow-quarterly-cycle` | Strategic Review -> North Star -> OKRs -> Planning -> Roadmap |
| `pm-workflow-sales-enablement` | Messaging -> Battlecards -> Objection Playbook -> GTM Launch |
| `pm-workflow-migration` | Migration PRD -> Migration Planner -> Risk Register -> Stakeholder Simulation -> Comms + PE Report |

## Agents

| Agent | Role |
|-------|------|
| `pm-discovery-lead` | Orchestrates discovery work |
| `pm-data-analyst` | Orchestrates data analysis |
| `pm-ops-facilitator` | Orchestrates PM operations |
| `pm-comms-writer` | Orchestrates PM communication |
| `pm-gtm-strategist` | Orchestrates go-to-market and sales enablement |

## Design Principles

Every skill enforces:
1. **"Why First"** — Problem clarity before solutions
2. **Leading + Lagging Indicators** — Every metric needs both
3. **Scope Discipline** — Explicit non-goals and cut lines
4. **Domain Awareness** — Compliance, regulatory, and industry context from `domain-context.md`
5. **Personal Awareness** — Adapts depth and tone to your seniority and preferences from `personal-context.md`
6. **Hybrid Interaction** — Ask critical questions, generate draft, iterate

## Customization

### Company Context (`domain-context.md`)

All domain-specific knowledge lives in `domain-context.md`. This includes:

- **Company & product** — Name, type, target market
- **Personas** — Who uses your product and how
- **Compliance** — Regulatory frameworks relevant to your industry
- **Calendar** — Seasonal events that affect planning and releases
- **Metrics** — Domain-specific benchmarks and KPIs
- **Ecosystem** — Key integrations and partners
- **Sales & GTM** — Sales team structure, deal stages, ICP, buyer personas, win/loss patterns
- **Examples** — JTBD examples, funnel stages, onboarding milestones

The plugin ships with a B2B SaaS ERP example context. Replace it with your own.

### Personal Context (`personal-context.md`)

Your personal profile helps skills adapt to your experience level:

- **Role & seniority** — Title, years in product, team size
- **Background** — Domain expertise, strengths, growth areas
- **Organization** — Who you report to, stakeholders, decision-making culture
- **Communication preferences** — Feedback style, output format, language, formality
- **Skill self-assessment** — Rate yourself 1-5 across PM disciplines so skills adjust guidance depth
- **What to avoid** — Specific instructions (e.g., "don't over-explain JTBD, I know it well")

## Frameworks & Abbreviations

This toolkit builds on established product management and pricing methodologies:

### Pricing & Monetization
| Term | Full Name | What It Is | Used In |
|------|-----------|-----------|---------|
| **WTP** | Willingness to Pay | How much a customer would pay for a product/feature. The foundation of value-based pricing. | pm-pricing, pm-ai-pricing |
| **Van Westendorp** | Van Westendorp Price Sensitivity Meter | 4-question survey to find the acceptable price range (too cheap, good value, getting expensive, too expensive) | pm-pricing |
| **Gabor-Granger** | Gabor-Granger Price Point Testing | Survey method testing purchase probability at specific price points to find the revenue-maximizing price | pm-pricing |
| **NRR** | Net Revenue Retention | (Starting MRR + expansion - contraction - churn) / Starting MRR. Measures growth from existing customers. >100% means you're growing without new sales. | pm-pricing, pm-ai-pricing |
| **ARPU** | Average Revenue Per User/Account | Total revenue / total users or accounts. Key pricing health metric. | pm-pricing, pm-ai-pricing |
| **MoSCoW** | Must/Should/Could/Won't | Prioritization framework for requirements. Must = non-negotiable, Should = important, Could = nice-to-have, Won't = explicitly out of scope. | pm-prd |
| **TCO** | Total Cost of Ownership | Full cost including purchase, implementation, training, maintenance — not just license price. Used in competitive pricing comparisons. | pm-pricing, pm-battlecard |

### Product Strategy & Discovery
| Term | Full Name | What It Is | Used In |
|------|-----------|-----------|---------|
| **JTBD** | Jobs to Be Done | Framework by Christensen: customers "hire" products to get a job done. Focus on the job, not the product. | pm-jtbd, pm-workflow-problem-to-prd |
| **OKR** | Objectives and Key Results | Goal-setting framework: qualitative Objective + measurable Key Results. 0.7/1.0 score = success. | pm-okr, pm-workflow-quarterly-cycle |
| **SWOT** | Strengths, Weaknesses, Opportunities, Threats | Strategic analysis matrix. Internal (S/W) vs external (O/T), helpful vs harmful. | pm-swot, pm-workflow-competitive-intel |
| **OST** | Opportunity Solution Tree | Teresa Torres framework: desired outcome -> opportunities -> solutions -> experiments. Visual discovery tool. | pm-opportunity-tree |
| **RICE** | Reach, Impact, Confidence, Effort | Prioritization scoring: (Reach x Impact x Confidence) / Effort. Used for feature prioritization. | pm-feature-requests |
| **TAM/SAM/SOM** | Total/Serviceable/Obtainable Market | Market sizing: TAM = entire market, SAM = reachable with your product, SOM = realistic capture in 3 years. | pm-workflow-competitive-intel |

### Communication & Positioning
| Term | Full Name | What It Is | Used In |
|------|-----------|-----------|---------|
| **SCQA** | Situation, Complication, Question, Answer | Executive communication framework (McKinsey). Lead with context everyone agrees on, then the tension, the question, and your answer. | pm-executive-update, pm-comms-writer |
| **ADR** | Architecture Decision Record | Structured format for documenting decisions: context, options considered, decision made, consequences. | pm-decision-document |
| **Dunford Positioning** | April Dunford's 5-Component Framework | Sequential positioning: Competitive Alternatives -> Unique Attributes -> Value -> Target Customer -> Market Category. From "Obviously Awesome." | pm-messaging-framework, pm-battlecard, pm-sales-deck |
| **VPC** | Value Proposition Canvas | Strategyzer tool: Customer Profile (jobs, pains, gains) mapped to Value Map (products, pain relievers, gain creators). Tests product-market fit. | pm-value-prop-canvas |

### Operations & Metrics
| Term | Full Name | What It Is | Used In |
|------|-----------|-----------|---------|
| **SOP** | Standard Operating Procedure | Step-by-step documented process with ownership, decision points, and checklists. | pm-process-docs |
| **AARRR** | Acquisition, Activation, Retention, Revenue, Referral | "Pirate Metrics" framework for SaaS growth funnels. Each stage has its own metrics. | pm-funnel-analyzer, pm-metric-framework |
| **NPS** | Net Promoter Score | Customer loyalty metric: % Promoters (9-10) minus % Detractors (0-6). Range: -100 to +100. | pm-feedback-categorizer |
| **DAU/MAU** | Daily/Monthly Active Users | Engagement ratio. DAU/MAU > 60% = very sticky product. | pm-metric-framework |
| **ICP** | Ideal Customer Profile | Definition of the perfect-fit customer: company size, industry, tech maturity, buying trigger, disqualifiers. | domain-context.md, pm-messaging-framework |
| **GTM** | Go-to-Market | Strategy for launching products to customers: positioning, channels, pricing, enablement. | pm-gtm-launch, pm-workflow-sales-enablement |
| **CS** | Customer Success | Post-sale function: onboarding, adoption, expansion, renewal, churn prevention. | pm-customer-success |

### AI Pricing (specific to pm-ai-pricing)
| Term | What It Is |
|------|-----------|
| **Inference cost** | The cost of running an AI model per query/token. Variable cost that scales with usage. |
| **Attach rate** | % of eligible customers who adopt an AI feature. Key metric for AI monetization. |
| **Copilot tax** | How much more customers will pay for an AI-augmented version of an existing feature. Typically 20-40% for copilots, 50-100% for agents. |
| **Per-agent pricing** | Pricing model for autonomous AI workers — charge per AI agent deployed, typically at 10-30% of the human FTE cost it replaces. |
| **AI credits** | Usage allotment model: include N AI actions per month in the subscription, charge for overage. |

### Key Books Referenced
| Book | Author(s) | What It Contributes |
|------|----------|-------------------|
| *Obviously Awesome* | April Dunford | 5-component positioning framework used in pm-messaging-framework, pm-battlecard, pm-sales-deck |
| *Monetizing Innovation* | Madhavan Ramanujam & Georg Tacke (Simon-Kucher) | WTP-first pricing, 4 monetization failure types, Gabor-Granger, behavioral pricing in pm-pricing |
| *Inspired* | Marty Cagan | Product discovery and dual-track agile principles throughout |
| *Continuous Discovery Habits* | Teresa Torres | Opportunity Solution Tree in pm-opportunity-tree |
| *Measure What Matters* | John Doerr | OKR methodology in pm-okr |

## Hooks

The plugin includes 4 hooks that run automatically:

| Hook | Event | What It Does |
|------|-------|-------------|
| **Context Reinjection** | `SessionStart` (after compaction) | Re-injects `domain-context.md` and `personal-context.md` into context when long conversations compress |
| **Quality Gate** | `Stop` | Validates PM deliverables follow the 3 design principles (problem clarity, leading+lagging metrics, scope discipline) |
| **Usage Logger** | `PostToolUse` / `PostToolUseFailure` | Logs every PM skill execution to `~/.claude/pm-toolkit/audit.jsonl` for usage analytics |
| **Workflow Tracker** | `PostToolUse` | Tracks multi-step workflow progress to `.pm-toolkit-workflow-state.json` in the current project so workflows can resume across sessions |

Hook scripts live in `hooks/` and are configured via `hooks/hooks.json`. The workflow tracker writes per-project state — if you don't want it committed, add `.pm-toolkit-workflow-state.json` to your project's `.gitignore`.

## Skill Disambiguation

Some skills sound similar but serve different purposes:

| If you need... | Use this | Not this |
|----------------|---------|----------|
| A full requirements doc for engineering | `pm-prd` | pm-product-brief (that's a 1-page working-backwards narrative) |
| A 1-page pitch for leadership approval | `pm-one-pager` | pm-product-brief (that's for product team alignment) |
| To set OKRs for your squad | `pm-okr` | pm-workflow-quarterly-cycle (that's the full 5-stage quarterly planning ceremony) |
| A pricing strategy for your core product | `pm-pricing` | pm-ai-pricing (that's specifically for AI features) |
| A competitive cheat sheet for sales | `pm-battlecard` | pm-workflow-competitive-intel (that's a strategic analysis for product leadership) |

## Author

Martin Foerster

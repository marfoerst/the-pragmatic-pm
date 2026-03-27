# Ultimate PM Toolkit

A Claude Code plugin with 43 PM skills + 5 agents + 4 workflows + 4 hooks designed for product leadership at B2B SaaS companies.

**Domain-agnostic** — customize `domain-context.md` once for your company, product, personas, compliance requirements, and industry. Every skill adapts automatically.

## Install

```bash
claude plugin install --path ./pm-toolkit
```

## Setup

1. Open `domain-context.md` in the plugin root
2. Replace the example content with your company's details:
   - Company name, product, target market
   - Team structure
   - Personas (who uses your product)
   - Compliance & regulatory frameworks
   - Industry calendar (seasonal events affecting planning)
   - Domain-specific metrics and benchmarks
   - Ecosystem & integrations
   - Sales & GTM context (optional — for go-to-market skills)
3. Start using any skill — they all read your context automatically

## Quick Start

- `/pm-hub` — See all skills and get routed to the right one
- `/pm-review` — Quality-check any PM artifact before submitting for review

## Skills by Category

### Foundation
| Skill | What It Does |
|-------|-------------|
| `pm-hub` | Master router — lists skills, routes by intent |
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
| `pm-risk-register` | Product risk identification and mitigation |

### Communication
| Skill | What It Does |
|-------|-------------|
| `pm-executive-update` | SCQA-structured executive updates |
| `pm-decision-document` | ADR-style product decision records |
| `pm-stakeholder-simulator` | Simulate stakeholder reactions |
| `pm-product-brief` | Amazon-style working-backwards brief |
| `pm-one-pager` | Executive one-pager for proposals |
| `pm-board-deck` | Board/investor deck content |
| `pm-meeting-notes` | Structured PM meeting notes |

### Go-to-Market
| Skill | What It Does |
|-------|-------------|
| `pm-messaging-framework` | Consistent messaging across all touchpoints |
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
| Workflow | What It Does |
|----------|-------------|
| `pm-workflow-problem-to-prd` | Problem -> JTBD -> Persona -> Opportunity Tree -> PRD -> Review |
| `pm-workflow-competitive-intel` | SWOT -> Market Sizing -> Competitive Profile -> One-Pager |
| `pm-workflow-quarterly-cycle` | Strategic Review -> North Star -> OKRs -> Planning -> Roadmap |
| `pm-workflow-sales-enablement` | Messaging -> Battlecards -> Objection Playbook -> GTM Launch |

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
5. **Hybrid Interaction** — Ask critical questions, generate draft, iterate

## Customization

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

## Hooks

The plugin includes 4 hooks that run automatically:

| Hook | Event | What It Does |
|------|-------|-------------|
| **Context Reinjection** | `SessionStart` (after compaction) | Re-injects `domain-context.md` into context when long conversations compress, so personas, metrics, and compliance context are never lost |
| **Quality Gate** | `Stop` | Validates PM deliverables follow the 3 design principles (problem clarity, leading+lagging metrics, scope discipline) before Claude finishes responding |
| **Usage Logger** | `PostToolUse` / `PostToolUseFailure` | Logs every PM skill execution to `.pm-toolkit-audit.jsonl` for usage analytics |
| **Workflow Tracker** | `PostToolUse` | Tracks multi-step workflow progress to `.pm-toolkit-workflow-state.json` so workflows can resume across sessions |

Hook scripts live in `hooks/` and are configured via `hooks/hooks.json`.

## Author

Martin Foerster

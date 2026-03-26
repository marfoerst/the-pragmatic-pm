# Changelog

All notable changes to the PM Toolkit plugin are documented here.

---

## [1.2.0] — 2026-03-26

### Industry Knowledge Enrichment

Sharpened 5 existing skills with proven product methodology from April Dunford ("Obviously Awesome") and Ramanujam & Tacke ("Monetizing Innovation"). Added a dedicated AI Pricing skill informed by Simon-Kucher, BVP, and Monetizely research.

**43 skills + 5 agents + 4 workflows**

### Added

- **`pm-ai-pricing`** — New standalone skill for AI feature pricing and packaging. 9-phase process covering: embed-vs-charge decision framework, 6 AI pricing models (per-seat, per-agent, outcome-based, usage-based, hybrid), AI cost modeling with margin analysis and scaling scenarios, AI value measurement ("Worth 10x" test), AI credits and packaging strategies, AI-specific WTP research ("copilot tax"), AI pricing metrics (attach rate, AI NRR, cost-to-serve), and 7 AI pricing anti-patterns.

### Changed

- **`pm-pricing`** — Added 4 new sections from Ramanujam & Tacke's "Monetizing Innovation":
  - Phase 1B: Monetization Risk Diagnostic — diagnose Feature Shock, Minivation, Hidden Gem, and Undead failure patterns before pricing
  - Phase 4B: Gabor-Granger Price Point Testing — complements existing Van Westendorp with demand curve and revenue-maximizing price analysis
  - Phase 5B: Behavioral Pricing Principles — anchoring, compromise effect, decoy pricing, pennies-a-day framing, bundling vs unbundling
  - Phase 5C: WTP-Based Segmentation — segment customers by willingness-to-pay, not demographics; map tiers to WTP clusters

- **`pm-messaging-framework`** — Replaced generic positioning statement template with April Dunford's 5-component positioning framework:
  1. Competitive Alternatives (what customers use today — not just competitors)
  2. Unique Attributes (what only you have)
  3. Value mapped to attributes (your unique features enable your unique value)
  4. Target Customer Characteristics (who cares a lot)
  5. Market Category (Head-to-Head / Big Fish Small Pond / Create New Category)

- **`pm-battlecard`** — Added Dunford's competitive alternatives concept:
  - Reframed Question 1 from "Which competitor?" to "What is the prospect using today?" (includes manual processes, consultants, status quo)
  - Added Section 1B "Alternative Type" with selling strategies for 5 alternative types
  - Added status-quo-specific landmine questions for selling against manual processes

- **`pm-sales-deck`** — Grounded in Dunford positioning:
  - Added Positioning Foundation Check before slide generation (competitive alternative, unique value, market category)
  - Modified Slide 5 (Solution Intro) with market category framing
  - Modified Slide 7 (Differentiation) to ground in buyer's actual competitive alternative

- **`pm-value-prop-canvas`** — Added Positioning Bridge section mapping VPC findings to Dunford's 5 positioning components, with natural handoff to `/pm-messaging-framework`

### Sources

- April Dunford, *Obviously Awesome: How to Nail Product Positioning So Customers Get It, Buy It, Love It*
- Madhavan Ramanujam & Georg Tacke, *Monetizing Innovation: How Smart Companies Design the Product Around the Price* (Simon-Kucher)
- Simon-Kucher, "Best Practices for Generative AI Packaging and Pricing"
- Bessemer Venture Partners, "The AI Pricing and Monetization Playbook"
- Monetizely, "The 2026 Guide to SaaS AI and Agentic Pricing Models"
- BCG, "Winning Strategies of Hypergrowth SaaS Champions"

---

## [1.1.0] — 2026-03-26

### Sales & Marketing Enablement + Standalone PRD & OKR Skills

Added a complete Go-to-Market category with 6 new sales-facing skills, a Sales Enablement workflow, and a GTM Strategist agent. Also added standalone PRD and OKR skills that were previously locked inside multi-stage workflows. Removed pm-api-docs (developer concern, not PM).

**42 skills + 5 agents + 4 workflows**

### Added

- **`pm-prd`** — Standalone PRD generation with 4 modes: Full PRD, Lightweight Feature Spec, Iteration/V2 Spec, Migration/Compliance Spec. Built-in quality checks enforce problem-first thinking, leading+lagging metrics, scope discipline, and compliance awareness. Accepts prior discovery artifacts (JTBD, personas, opportunity trees) to pre-populate sections.

- **`pm-okr`** — Full OKR lifecycle skill with 5 modes: Define (create new OKRs), Refine (critique existing), Check-in (mid-quarter review), Score (quarter-end grading with classic/binary/traffic-light scoring), Align (map OKRs across company/team/individual levels). Enforces outcome-over-output writing, 60-70% confidence targeting, and leading+lagging KRs.

- **Go-to-Market category** (6 new skills):
  - **`pm-messaging-framework`** — Positioning statements, value pillars, elevator pitches (10s/30s/2min), per-persona and per-competitor messaging, proof points library
  - **`pm-battlecard`** — Per-competitor 1-page sales battlecards with feature comparison, objection responses, landmine questions, pricing comparison, deal-stage guidance
  - **`pm-objection-handler`** — Objection playbook organized by category (price, product gaps, competitor claims, risk, timing, integration) with Acknowledge-Reframe-Evidence-Redirect framework
  - **`pm-sales-deck`** — Sales/pitch deck content with 12-slide B2B structure, slide-by-slide talk tracks, and anticipated questions
  - **`pm-gtm-launch`** — Go-to-market launch playbook with P0/P1/P2 tier scaling, cross-functional checklists, enablement timelines, communication plans, success metrics
  - **`pm-win-loss`** — Win/loss analysis with two modes: interview guide generation and data pattern analysis

- **`pm-workflow-sales-enablement`** — 4-stage workflow: Messaging Framework → Battlecards → Objection Playbook → GTM Launch Playbook. All artifacts written for revenue teams, not product teams.

- **`pm-gtm-strategist`** agent — Routes to all 6 GTM skills. Bridges product strategy and revenue execution.

- **Sales & GTM Context** section in `domain-context.md` — ICP definition, deal stages, sales team structure, buyer personas (distinct from product user personas), win/loss patterns

### Changed

- **`pm-workflow-problem-to-prd`** — Stage 4 now delegates to `pm-prd` (Mode A) instead of maintaining an inline PRD template. Single source of truth for PRD generation.

- **`pm-workflow-quarterly-cycle`** — Stage 3 now delegates to `pm-okr` (Mode A) instead of maintaining an inline OKR template. Single source of truth for OKR generation.

- **`pm-hub`** — Added Go-to-Market category, pm-prd in Foundation, pm-okr in Strategy, routing disambiguations (standalone PRD vs workflow, standalone OKR vs quarterly cycle)

### Removed

- **`pm-api-docs`** — Developer documentation tool (OpenAPI/Swagger, endpoint docs). Not a PM concern. Removed from skill set, hub, and README.

---

## [1.0.0] — 2026-03-26

### Initial Release

The PM Toolkit — a Claude Code plugin for product leadership at B2B SaaS companies.

**35 skills + 4 agents + 3 workflows**

### Skills

**Foundation:** pm-hub, pm-review, pm-pricing, pm-north-star, pm-metric-framework, pm-onboarding-flow, pm-release-notes

**Discovery & Data:** pm-jtbd, pm-persona-generator, pm-feature-requests, pm-funnel-analyzer, pm-ab-test, pm-feedback-categorizer

**Strategy:** pm-quarterly-planning, pm-strategic-review, pm-swot, pm-value-prop-canvas, pm-opportunity-tree, pm-devils-advocate, pm-build-vs-buy, pm-risk-register

**Communication:** pm-executive-update, pm-decision-document, pm-stakeholder-simulator, pm-product-brief, pm-one-pager, pm-board-deck, pm-meeting-notes

**Operations:** pm-sprint-retro, pm-postmortem, pm-process-docs, pm-customer-success, pm-dashboard-designer, pm-journey-map, pm-api-docs

### Workflows

- **pm-workflow-problem-to-prd** — Problem → JTBD → Persona → Opportunity Tree → PRD → Review
- **pm-workflow-competitive-intel** — SWOT → Market Sizing → Competitive Profile → Positioning → One-Pager
- **pm-workflow-quarterly-cycle** — Strategic Review → North Star → OKRs → Planning → Roadmap

### Agents

- **pm-discovery-lead** — Orchestrates discovery work through 4 phases
- **pm-data-analyst** — Orchestrates data analysis and metrics
- **pm-ops-facilitator** — Orchestrates PM operations and ceremonies
- **pm-comms-writer** — Orchestrates PM communication with SCQA framework

### Design Principles

Every skill enforces: (1) Problem clarity before solutions, (2) Leading + lagging indicators for every metric, (3) Explicit non-goals and scope discipline, (4) Domain awareness via domain-context.md, (5) Hybrid interaction — ask critical questions, generate draft, iterate.

### Customization

All domain-specific knowledge lives in `domain-context.md`. Ships with a B2B SaaS ERP example (German SMB market, DACH region, DATEV ecosystem). Replace with your own company context.

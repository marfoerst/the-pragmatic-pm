# Changelog

All notable changes to the PM Toolkit plugin are documented here.

---

## [1.4.0] — 2026-03-27

### SaaS Migration & PE Integration

Added comprehensive migration planning capabilities for PE-backed SaaS companies. Covers platform rewrites, data migrations, product consolidations, vendor switches, and legacy sunsetting. Feature parity analysis is the central artifact — the document that determines whether migration is possible.

**45 skills + 5 agents + 5 workflows**

### Added

- **`pm-migration-planner`** (613 lines) — The most comprehensive skill in the toolkit. 8-phase migration planning with 5 migration types (Platform, Data, Product Consolidation, Vendor/API, Compliance). Includes: strategy selection framework (Big Bang / Strangler Fig / Parallel Run / Cohort-Based / Feature Flag), feature parity matrix with customer-weighted gap analysis, data migration plan with 3 validation gates, 5-gate go/no-go framework with named decision-makers, 8-touch customer communication playbook, post-migration validation checklist, and legacy sunset plan.

- **`pm-pe-migration-report`** — PE board migration progress dashboard. One-page format PE operating partners can digest in 5 minutes: ARR scorecard (migrated/remaining/at-risk/lost), wave status, synergy realization tracker, cost vs budget, top 5 risks, post-migration customer health.

- **`pm-workflow-migration`** — 5-stage migration workflow: Migration PRD → Migration Planner → Risk Register → Stakeholder Simulation → Comms + PE Report. Multi-session with mid-entry support. Stages 1-3 produce the 100-day plan; Stages 4-5 repeat per wave.

- **PE/Acquisition Context** section in `domain-context.md` — PE relationship, acquired companies table, target platform, migration constraints.

### Changed

- **`pm-risk-register`** — Added migration risk mode with 7 migration-specific categories: Data Integrity, Feature Parity, Customer Impact, Rollback, Timeline, Capacity, Integration.

- **`pm-customer-success`** — Added Stage G: Migration Support with health indicators (prep completion, support tickets, first login, workflow completion, data reconciliation, CSAT), intervention triggers, and CSM script templates.

- **`pm-stakeholder-simulator`** — Added 4 PE-specific stakeholder archetypes: PE Operating Partner, Acquired Company GM, Acquired Company PM, Acquired Company's Largest Customer.

- **`pm-hub`** — Added pm-migration-planner to Strategy, pm-pe-migration-report to Communication, pm-workflow-migration to Workflows.

- **`pm-ops-facilitator`** — Added migration routing.

---

## [1.3.0] — 2026-03-27

### Quality & Personalization Update

Comprehensive quality pass driven by 4-persona testing (Junior PM, Senior PM, Head of Product, VP Product). Added personal context, fixed all critical gaps, refreshed older skills, and prepared for public distribution.

### Added

- **`personal-context.md`** — Personal profile template for role, seniority, communication preferences, skill self-assessment (1-5), and "what to avoid" instructions. Skills adapt depth and tone to the user's experience level. Ships as `personal-context.example.md` (template in repo); `personal-context.md` is gitignored for privacy.

- **Mid-entry support** in all 3 workflows — PMs with partial work can now skip stages:
  - `pm-workflow-problem-to-prd`: Enter at any of 5 stages with existing artifacts
  - `pm-workflow-sales-enablement`: Enter at any of 4 stages
  - `pm-workflow-quarterly-cycle`: Enter at any of 5 stages

- **Revenue impact modeling** (Phase 7) in `pm-pricing` — 3-scenario revenue sensitivity model, break-even analysis, and sensitivity checks. Answers "what does this mean in euros?"

- **Price migration strategy** (Phase 8) in `pm-pricing` — Grandfather/sunset/immediate/hybrid options, customer communication plan, at-risk account playbook

- **2 new objection categories** in `pm-objection-handler`:
  - Internal Politics & Champion Risk (organizational dynamics, not product evaluation)
  - Scope & Unbundling (buyer needs only part of the product)

- **Mid-quarter review template** in `pm-workflow-quarterly-cycle` — OKR progress check, bet status, capacity reality check, and course-correction decisions

- **Deal-stage artifact map** in `pm-gtm-strategist` agent — Maps which GTM skill and artifact the sales team needs at each deal stage (Prospecting through Closed Lost)

- **Verdict roll-up rules** in `pm-review` — Explicit Red/Yellow/Green to verdict mapping + "After the Review" guidance for fixing issues and re-reviewing

- **Getting Started** beginner path in README — 5-step guided journey for new users

- **Frameworks & Abbreviations** glossary in README — 30+ terms explained (WTP, JTBD, SCQA, OKR, NRR, ARPU, MoSCoW, etc.) with "Used In" references

- **Skill Disambiguation** table in README — Clarifies PRD vs brief vs one-pager, pricing vs AI pricing, OKR vs quarterly planning

- **Key Books Referenced** table in README — Dunford, Ramanujam/Tacke, Cagan, Torres, Doerr

- **LICENSE** (MIT), **CONTRIBUTING.md**, **CLAUDE.md** — Standard open-source files for public distribution

### Changed

- **personal-context.md integrated across 21 files** — 10 key skills, 5 agents, 3 workflows, README, hub. Each adapts guidance depth to the user's stated seniority and preferences.

- **6 older skills refreshed to v1.1+ quality** — pm-swot, pm-board-deck, pm-meeting-notes, pm-executive-update, pm-one-pager, pm-stakeholder-simulator now have: Intent Detection, Pre-Population from Existing Artifacts, Anti-Patterns, and personal-context.md references

- **Hardcoded ERP examples removed from skills** — Replaced with `domain-context.md` references so non-ERP companies get clean output

- **domain-context.md Sales & GTM section** — Populated with example data (previously empty placeholders). Consistent with the product sections that already shipped populated.

- **README overhauled** — Install command updated to marketplace install, setup includes personal context, workflows section notes mid-entry support

### Infrastructure

- `.gitignore` updated — personal-context.md, .pm-toolkit-audit.jsonl, .pm-toolkit-workflow-state.json
- `personal-context.example.md` ships as template; actual personal-context.md is user-local
- Version bumped to 1.3.0 in plugin.json and marketplace.json

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

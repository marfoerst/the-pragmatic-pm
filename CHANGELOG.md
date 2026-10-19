# Changelog

All notable changes to the PM Toolkit plugin are documented here.

---

## [1.12.0] — 2026-10-19

### Discovery Depth, Evidence Weighting, and AI Reimagination

Four new skills and targeted upgrades to thirteen existing ones. The common thread: categories come from the data and are locked before they are applied, unprompted and observed evidence outweighs prompted agreement, gaps are shown rather than dropped, and value claims show their arithmetic. Everything stays at the level of *what*, never *how* — anything bound for engineering points to the Engineering-Ready Specification in `pm-prd`. Not yet run against real inputs.

**53 skills + 5 agents + 6 workflows**

### Added

- **`pm-discovery-synthesis`** (Discovery & Data) — Many transcripts into comparable findings: open discovery with surprises and weak signals, a PM-confirmed **taxonomy lock** (hard gate), one coded row per atomic insight (struggle vs. workaround, raised by customer vs. by us, said vs. inferred, figures, verbatim quote or "none"), and a cross-call brief with counts like "7/10 calls, 5 unprompted". Prompted-only themes are labelled weak. Optional challenge pass via `pm-devils-advocate`. Routed from `pm-discovery-lead`.
- **`pm-retention-analysis`** (Discovery & Data) — Retention-curve and cohort-table diagnosis: grain (user vs. account) and activity definition first, curve shape and floor, same-age cohort comparison, anomalous-cohort flags, and **masking of cells whose period isn't over**. Ends in rival hypotheses plus the data to pull. Routed from `pm-data-analyst`; disambiguated from `pm-cohort-planner` (migration) in the hub and README.
- **`pm-ai-reimagination`** (Strategy) — One customer job, stage by stage: current state, then each stage labelled **AI does it / AI assists / step disappears / stays human**, weighing regulation, data, trust, and a feasibility flag for engineering. Ends in a reimagined flow and the biggest gap as the opportunity. Describes the customer's experience, never the model or architecture.
- **`pm-roadmap-audit`** (Strategy) — Item-by-item roadmap audit: AI lens (reusing the four labels), evidence audit with Strong / Thin / None ratings, a cull step (what concretely happens if we skip it, is it sales or support noise, how stale is it) ending in keep / deprioritise / investigate with a one-line stakeholder rationale, and an optional bigger bet with a money story and validation plan.

### Changed

- **`pm-product-brief`** — Now reads `domain-context.md` and `personal-context.md` in its opening and has an Anti-Patterns section. New **Outcome Ladder** (behaviour change → consistent adoption → business result, leading and lagging, with specificity rules), a **Weakest Assumptions** close with one quick test each, an optional **Coach mode** where the PM writes and Claude critiques, and an optional **Prototype Scope** block ("probe, not spec") that can feed `pm-prototype-to-epics` and routes engineering handoff to `pm-prd`.
- **`pm-opportunity-tree`** — Reads `personal-context.md`. New Quick vs. **Guided mode** with a scope check (one initiative vs. portfolio), a solution-in-disguise detector, an explicit branching axis (segment or job step), a sub-opportunity check, evidence weighting in the Evidence column, a **divergence step** (the PM's ideas first, then deliberately different generic angles such as AI-first, remove the step, adjacent industry, analogy, inversion), thin-branch flags for fewer than 3 ideas, and backlog/OKR mapping that flags orphans.
- **`pm-jtbd`** — New **Mode D: Discovery interview guide** with a hard goal gate, one guide per segment, goals and measures before pain, past-tense episodes and actual spend, the PM's hunch held to the end (late agreement tagged weak), a cap of 7 main questions, and a note template that matches `pm-discovery-synthesis`. Mode B gains an Evidence Weight column. New Anti-Patterns section.
- **`pm-dashboard-designer`** — Reads `personal-context.md`; new **metric-confirm gate** before any layout; untracked metrics kept as instrumentation gaps; labelled placeholder-data mode; new **Template E: Feature Adoption** (three metric layers, health line, cohort view, user-level feature retention curve, funnel with size-the-prize, qualitative themes, AI health block, this week's actions). New Iterate step and Anti-Patterns section.
- **`pm-value-prop-canvas`** — New optional **Value Brief** for sales and PMM with quantified drivers, a stated realisation factor, visible arithmetic, and a named validator. Gross time saved is never counted as value.
- **`pm-ai-pricing`** — Phase 5 gains the same realisation rule.
- **`pm-gtm-launch`** — New Section **2b Internal Readiness FAQ** by function, with an AI block (quality bar, data handling, explainability, failure modes, liability), filled in a second pass from the brief and scaled by tier.
- **`pm-devils-advocate`** — New **Challenging a Research Synthesis** path: rival explanations, pain vs. preference vs. contented workaround, counter-evidence quoted with equal weight, and the one data point that would most raise confidence. New Anti-Patterns section.
- **`pm-one-pager`** — Expected Impact gains a **money story**: revenue levers from `domain-context.md`, every term of the arithmetic shown, and who can validate each number.
- **`pm-productboard-insights`** — Insights are tagged **unprompted / prompted**.
- **Cross-cutting, one to three lines each:** discover-then-lock pre-pass in `pm-feedback-categorizer` and a theme lock in `pm-feature-requests`; an evidence-weighting pitfall in `pm-review` Dimension 2; Coach options in `pm-okr` and `pm-north-star` (which also points to `pm-retention-analysis`); an Instrumentation Gaps table in `pm-metric-framework`; a realistic-impact anti-pattern in `pm-board-deck`; an optional AI lens in `pm-journey-map` and an optional "Where AI changes the job" problem-framing block in `pm-prd`. Iterate steps in the edited skills now name their own 1-2 weakest parts and ask for real data there. Edited skills that lacked the `personal-context.md` read now have it.
- **Routing** — `pm-hub` registers the four skills and adds disambiguations (retention vs. cohort migration, synthesis vs. single-call capture and VoC, roadmap audit vs. quarterly planning). `pm-discovery-lead` routes to `pm-discovery-synthesis`; `pm-data-analyst` routes to `pm-retention-analysis`. README tables updated, including the previously missing `pm-workflow-problem-to-stories` row; hook count corrected to 1 in README and `plugin.json`.

---

## [1.11.1] — 2026-10-19

### Engineering-Ready Specifications — fixes from a first QA run

Fixes to the unreleased 1.11.0 standard. Found by running `pm-prd` / `pm-workflow-problem-to-stories` on **3 real Jira tickets** (a German time-tracking story, a German 2FA story, an English AI-feedback story) and then having a separate agent **simulate** engineering's refine skill on the output. That was a simulation, not real engineers; the revised skills have not been re-run yet. Still strictly *what*, never *how*.

**49 skills + 5 agents + 6 workflows**

### Fixed

- **`pm-prd`** — The Handoff Block no longer claims "refine-complete" on every draft. New **Decision status: Confirmed / Assumed / Open** (only Confirmed rows say "no need to re-ask"). **Definition: refine-complete** is now judged per capability, and a new **Handoff marker line** is generated from the real state (ready to hand over / partial handover / draft). New **Incoming technical notes** rule: business rules hidden in a ticket's technical notes are mined into the spec, the rest is carried over into "Notes for engineering (not requirements — PM did not validate)", and the handoff must not silently contradict the original description, which engineering appends to. Step 4 gains a **question budget**: at most ~5 high-impact questions one at a time, everything else in one confirm-or-correct table of Assumed defaults, plus a fast path. Mode B's size is restated honestly (2-3 pages, or split) and it gets a compact, table-based form. New **Supporting sections**: Definitions, Regulatory & Information Security, Abort Criteria (linked to the "wrong if" kill criteria, not duplicated), Rollout & Follow-ups. New content-based **Compliance trigger sweep** that works even when `domain-context.md` is generic: uncovered triggers are flagged for an owner, and legal facts from the ticket are marked "stated in ticket, unverified". New **Self-consistency check**: scope vs. capabilities, repeated numbers, unmapped edge cases, unreferenced Open/Assumed decisions, consistent terms, measurable Done-when. The **Language** rule now writes the spec in the ticket's language, headings included, with an English→German **Heading mapping**. Section Requirements, quality checks, and the Completeness Checklist are updated, and the checklist now sits before the Handoff Block so the block stays last.
- **`pm-review`** — Dimension 5 now gives a Ready/Blocked verdict per item, and the score is derived from those verdicts. Yellow is now **partial handover** ("can hand over now / waiting on" with owners) instead of an all-or-nothing Red. New checks: decision status, carried-over technical notes, supporting sections, self-consistency, honest marker line, and language. Dimension 4 adds the content-based compliance sweep and the rule that legal facts must not be presented as verified.
- **`pm-workflow-problem-to-stories`** — Per-story Ready/Blocked status. The Stage 5 decision step uses the question budget and fast path, and technical notes in the input are handled by the pm-prd rule. The Epic spec carries Definitions, decision status, and the supporting sections. The tracker export generates its marker from the real state. The Stage 6 matrix gives per-item verdicts and a derived PARTIALLY READY verdict. New anti-patterns.
- **`pm-workflow-problem-to-prd`** — Stage 4 reflects the question budget, the supporting sections, and the sweep and consistency checks. The Stage 5 review adds per-capability readiness and a derived handoff verdict.
- **`pm-prototype-to-epics`** — Technical notes in bundles are mined rather than dropped. Prototype rules start as Assumed. The Epic template gains the supporting sections. The Phase 4 check is per Epic, with a generated marker. New anti-patterns.

### Removed

- **Hooks** — Removed `quality-gate.sh`, `usage-logger.sh`, and `workflow-tracker.sh`. The quality gate never ran its checks (it parsed the JSONL transcript as a JSON array, so it always exited silently) and its keyword rules conflicted with the engineering-ready standard, which `pm-review` now covers. The usage log and workflow state file were written but never read by any skill. `context-reinject.sh` stays.

---

## [1.11.0] — 2026-10-19

### Engineering-Ready Specifications

PM artefacts (PRDs, Epics, Stories) now leave the toolkit **refine-complete**: they already carry everything engineering's refinement pass writes into a ticket, so that pass finds nothing to add. Still strictly *what*, never *how* — the outcome-centric stance from 1.6.0 is unchanged.

**49 skills + 5 agents + 6 workflows**

### Changed

- **`pm-prd`** — New canonical section **Engineering-Ready Specification**: the eight elements engineering needs (Overview, User Stories, Expected Behaviors, Success Criteria, Data Requirements, Edge Cases, Error Conditions, Out of Scope), a refine-complete definition, a "Data requirements: WHAT, never HOW" table, and a Jira/Linear-ready **Engineering Handoff Block** (append-friendly marker, `refined` label convention). New interaction step **Step 4: Resolve Behavioural Decisions** — one question at a time, 2-4 options with user-perspective trade-offs, instead of leaving decisions for engineering. New template sections: User Stories & Expected Behaviors (per capability, with checkbox success criteria), Business Rules & Decisions (incl. roles & permissions), Data Requirements (business-level), Edge Cases & Error Conditions (all modes; replaces Mode A's "When things go wrong"). Non-Goals now double as Out of Scope with a "Deferred to" column; Open Questions carry a "Blocks engineering" tag. Mode B's capabilities section *is* the Handoff Block, so it stays short. "The Line We Don't Cross" now separates PM-owned business data requirements from engineering-owned schema/storage design. Section Requirements by Mode, quality checks (decision deferred to engineering, untestable success criterion, happy path only, schema masquerading as data requirement, missing out-of-scope, error without recovery, untagged open question), and Completeness Checklist updated.
- **`pm-workflow-problem-to-stories`** — Every story handed to Jira/Linear must be refine-complete; just-in-time now applies only to far-future stories, which stay in "Stories Not Yet Refined" and are explicitly not handed over. New sprint-ready-set step, decision-resolution step, engineering-ready story template (behaviors, success criteria, data requirements, edge cases, error conditions, out of scope), Ready-for-Engineering definition of done, Jira/Linear Export Format, an Engineering-Readiness Check in the Stage 6 review, and new anti-patterns. Compliance AC example reworded to stay outcome-level.
- **`pm-prototype-to-epics`** — Epic template carries user stories, expected behaviors, business-level data requirements (from the Artifact 1 entities), edge cases and error conditions (from in-scope G1/G2 gaps), extended out-of-scope, and checkbox success criteria; open behavioural decisions are resolved with the PM before handoff; Phase 4 tracker handoff uses the Engineering Handoff Block and a refine-complete check. New anti-patterns.
- **`pm-review`** — New **Dimension 5: Engineering Readiness** for PRDs, Epics, and Stories, plus an Engineering handoff verdict and the exact questions engineering's refinement would ask.
- **`pm-workflow-problem-to-prd`** — Stage 4 now lists pm-prd's current sections (the old solution/NFR wording was stale), runs the decision step, and the Stage 5 review scores engineering readiness.
- **`pm-workflow-migration`** — Stage 1 no longer asks the PRD for architecture or schema mapping; it produces an outcome-level Mode D spec that is refine-complete, and engineering's design responds to it.
- **`pm-migration-planner`**, **`pm-hub`**, `README.md` — pointers to the Engineering-Ready Specification and the new review gate.

---

## [1.10.0] — 2026-10-08

### New Skill: Prototype → Epics

Added `pm-prototype-to-epics` — derives a carved, traceable Epic list directly from an HTML prototype, tuned for Claude Design exports (single-file HTML or handoff bundle).

**49 skills + 5 agents + 6 workflows**

### Added

- **`pm-prototype-to-epics`** — Four phases: prototype ingest (size-aware reading, Claude Design signal table that separates real scope from variant/tweak panels, artboard alternatives, and mock data), clarifying questions (problem, commitment level, existing functionality, logic fidelity, constraints, destination), Screen & Flow Inventory plus an Implied Scope & Gaps list (empty/error states, permissions, persistence, integrations, compliance, migration), and Epic carving by workflow — never by screen — with outcome hypotheses, leading + lagging indicators, and a screen-to-Epic traceability matrix. Includes unpacking instructions for Claude Design bundled pages (`__bundler/manifest` + `__bundler/template`, prototype logic in the `text/x-dc` script), rules for tweak panels (role toggles = demo device, error toggles = required states) and hardcoded feature flags, and per-Epic **Business rules** when the PM confirms the prototype logic is the spec. Validated on a real Claude Design export. Artifact 3 matches the Epic List format of `pm-workflow-problem-to-stories`, so the output continues at Stage 4. Registered in `pm-hub` (Foundation + routing) and `README.md`; added as a mid-entry path in `pm-workflow-problem-to-stories`.

---

## [1.9.1] — 2026-07-09

### New Workflow: Problem → Prototype → PRD → Epics → User Stories

Added `pm-workflow-problem-to-stories` — a multi-skill chain that takes a user problem (with optional prototype/mockup) and produces a delivery-ready backlog: sequenced Epics with Lightweight PRDs (Epic-as-Spec) and INVEST-gated User Stories with acceptance criteria. Extends `pm-workflow-problem-to-prd` with Epic carving, Epic sequencing, and Story decomposition stages.

**48 skills + 5 agents + 6 workflows**

### Fixed

- Version and count metadata corrected across `plugin.json`, `marketplace.json`, `README.md`, and `CLAUDE.md` — the workflow count now reflects the 6th workflow (`pm-workflow-problem-to-stories`), which had shipped under the 1.9.0 label and therefore never triggered a plugin cache refresh. Bumped to 1.9.1 to force re-sync.

---

## [1.9.0] — 2026-06-26

### New Skill: Customer Insights → Productboard

Added `pm-productboard-insights` — distills customer demands from a transcript into atomic, verbatim, attributed Insights and files them in Productboard as Notes, closing the loop between customer conversations and the product backlog.

**48 skills + 5 agents + 5 workflows**

### Added

- **`pm-productboard-insights`** — Turns a transcript (sales call, discovery interview, support session, user test) into **one Insight per customer demand** and pushes each to Productboard as a Note via the **Notes API** (`POST https://api.productboard.com/v2/notes`, Bearer `PRODUCTBOARD_API_TOKEN`). Six phases: token preflight + access check, input clarification, signal-classified extraction (pain / request / desire / workaround / objection / praise / context), Note structuring mapped to the `/v2/notes` schema with idempotency via `metadata.source.recordId`, a mandatory review gate before any write, and a push step with explicit 401/422/429 handling. Defaults to review-then-push since Productboard is shared, outward-facing state. The official Productboard MCP (spec-centric) is used only to link insights to features — it cannot create notes. Registered in `pm-hub` (Discovery & Data) and `README.md`.

---

## [1.8.0] — 2026-06-25

### New Skill: Cohort Migration-Readiness

`pm-cohort-planner` — a discovery skill for **cohort-based migration**. For one customer cohort (e.g. Accountants), it reconstructs the **complete functional scope that cohort needs to do their entire working day/year in the new product**, so the cohort can be migrated *fully* with nothing stranded in the legacy system.

### Added

- **`pm-cohort-planner`** (new skill):
  - **Frequency-banded job map** — jobs organized by functional area × cadence (Daily / Weekly / Monthly / Quarterly / Annual / Ad-hoc-Exception). The cadence lens forces the whole working *year* into view, surfacing the infrequent-but-critical jobs (year-end close, audit export) where cohort migrations usually fail.
  - **Evidence-or-flag discipline** — every job carries a confidence level (Verified / Inferred / **Assumed — no evidence**). Absence of evidence is reported as a coverage risk, never silently filled.
  - **Mixed-input ingestion** — process charts/maps, legacy system artifacts, qualitative evidence (tickets, interviews), usage data, and existing PM docs, each with per-type extraction logic and conflict flagging.
  - **Completeness sweep** — actively hunts period-end events, exception/recovery jobs, cross-cohort hand-offs, and infrequent-but-critical jobs.
  - **Coverage-risk register + migration-readiness verdict** — Ready to plan / Evidence gaps must close first / Not enough signal, with explicit blockers.
  - **Hand-off block** — rows pre-formatted for `pm-migration-planner` Phase 3 (parity matrix); gaps routed to `pm-prd`.
  - Sits upstream of `pm-migration-planner`'s Cohort-Based strategy; reciprocal cross-links added.

### Changed

- **`pm-migration-planner`** — added a Related Skills pointer to `pm-cohort-planner` as the upstream per-cohort scoping step.
- Skill count updated to **47** across `README.md`, `plugin.json`, and `marketplace.json`.

---

## [1.7.0] — 2026-06-09

### Document Ingestion for Due Diligence

`pm-due-diligence` now reads the target's documents directly — the way real DD works, where the target hands over a data room full of decks, brochures, feature matrices, and pricing sheets.

### Changed

- **`pm-due-diligence`** — Added a first-class **Document Ingestion** step (new Step 2):
  - Reads a **local folder or file paths** (PDFs, decks, spreadsheets, exports) directly instead of requiring pasted snippets.
  - **Scope-filtered extraction** — pulls only functional-scope and pricing signal; deliberately skips financial/legal/HR documents and lists what was skipped and why.
  - **Source inventory** added to the output (each document, its type, provenance, and contribution) with volume triage for large data rooms.
  - **Provenance upgrade** — facts from the target's own documents are tagged `[confirmed]`, raising the confidence factor so a document-backed screen can reach a "Pursue" verdict (web-only screens stay capped at "Dig Deeper").
  - **Conflict flagging** — discrepancies between documents, the website, or PM notes are surfaced rather than silently resolved.
  - New anti-patterns for scope leakage (no financial/legal docs) and silent conflict resolution.

---

## [1.6.0] — 2026-06-09

### New Skill: Product & Commercial Due Diligence

Added `pm-due-diligence` — a fast pre-deal screen for evaluating a potential acquisition target's **functional scope and pricing**, ending in a Pursue / Pass / Dig Deeper verdict. It runs upstream of `pm-build-vs-buy` and `pm-migration-planner` and explicitly excludes financial, technical, and legal DD (naming those as separate workstreams).

**46 skills + 5 agents + 5 workflows**

### Added

- **`pm-due-diligence`** — Product & commercial DD screen. Single adaptive mode optimized for speed. Hybrid input (PM-provided material + web research) with provenance tagging (`[confirmed]` / `[researched]` / `[assumption — verify]`). One-page output: deal snapshot, functional fit map (Overlap / Complementary / Gap vs. our product, with inferred deal thesis), pricing fit (compatibility/migration risk + monetization upside), red flags (deal-killers vs. validate-later), a weighted scoring matrix, and a verdict with an auto-compiled "Validate in Deep DD" list. Includes a **confidence gate** that caps the verdict at "Dig Deeper" when too much rests on unconfirmed data, and a deal-killer rule for non-negotiable capability/compliance gaps. Domain-aware: maps fit against our modules, seeds red flags from compliance frameworks, scores ICP fit, and frames the thesis in PE/consolidation terms.

- **`pm-hub`** — Registered `pm-due-diligence` under Strategy.

---

## [1.5.0] — 2026-06-09

### Outcome-Centric PRD Rewrite

`pm-prd` was reframed from an engineering-handoff spec into a customer- and outcome-centric requirements document. The PRD now defines the problem, the customer, and the desired outcome — then stops at the boundary of "how." The PM owns the *what* and *why*; engineering and design own the *how*.

### Changed

- **`pm-prd`** — Major rewrite:
  - **New governing principle + "The Line We Don't Cross"** — an explicit ownership table (PM owns outcome/capabilities/metrics; team owns architecture, APIs, retries, tools, UI) plus a "write capabilities, not implementations" examples table.
  - **Reordered spine so the outcome leads** — Problem & Desired Outcome (split into Customer Outcome + Business Outcome) → Outcome Hypothesis → Success Metrics → solution detail.
  - **New Outcome Hypothesis section** — frames the solution as a bet ("we believe… we'll know we're wrong if…").
  - **Success Metrics moved above the solution + Decision Rules** — every metric now carries a scale/iterate/stop rule; measured-with-no-consequence is rejected.
  - **"Solution / Functional Requirements" replaced by "Capabilities the Customer Needs"** — capabilities expressed as "the customer must be able to…", with a customer-observable "Done when" column and a "Serves outcome" traceability column.
  - **"Non-Functional Requirements" replaced by "Quality Expectations & Guardrails"** — quality stated as the customer feels it (engineering sets thresholds), with guardrails pulled from domain guardrail metrics. No more prescribed P95/P99 targets or named tools.
  - **Explicit Outcome Review milestone** — launch ≠ success; the timeline now includes a post-launch checkpoint that applies the decision rules.
  - **New quality checks** — "no technical prescription" (rewrites how-dictating sentences) and "output → outcome traceability" (flags orphan capabilities as gold-plating).

---

## [1.4.1] — 2026-04-05

### Fixed

- **Hook script resolution** — `hooks/hooks.json` referenced scripts via `$CLAUDE_PROJECT_DIR`, which expanded to the user's current project rather than the plugin install directory. All five hook commands (`SessionStart`, `Stop`, `PostToolUse` ×2, `PostToolUseFailure`) now use `${CLAUDE_PLUGIN_ROOT}`, so hooks resolve correctly in every project. Previously every Claude Code session in an unrelated project produced non-blocking "No such file or directory" errors for all plugin hooks.

- **Usage logger path** — `hooks/usage-logger.sh` wrote `.pm-toolkit-audit.jsonl` into each user's project directory. The audit log now lives at `${XDG_STATE_HOME:-$HOME/.claude}/pm-toolkit/audit.jsonl` (created automatically), keeping user repos clean. Workflow tracker state remains per-project by design; README notes adding `.pm-toolkit-workflow-state.json` to `.gitignore` if undesired.

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

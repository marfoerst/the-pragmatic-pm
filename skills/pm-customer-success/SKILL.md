---
name: pm-customer-success
description: >
  Customer success playbook generator for lifecycle stages: onboarding, adoption,
  expansion, renewal, churn prevention. Creates playbooks with triggers, actions, owners,
  and health indicators. Domain-aware: adapts to compliance and onboarding requirements from domain-context.md.
  Use when someone says "customer success", "CS playbook", "onboarding playbook", "churn prevention",
  "renewal", "expansion", "customer health", "lifecycle", "adoption", "NRR".
---

# Customer Success Playbook Generator

You are a customer success strategist helping a product leadership team. **Read `domain-context.md`** at the plugin root for company, product, persona, compliance, and industry context. Adapt all outputs to match that context. You create playbooks that drive measurable outcomes across the customer lifecycle — not generic "check in with the customer" fluff.

## Core Principles

- **Proactive over reactive**: Playbooks trigger on leading indicators, not crisis signals.
- **Outcome-defined**: Every playbook has a measurable success metric.
- **Domain-native**: Onboarding your product may require specialized compliance, data migration, or regulatory steps. See `domain-context.md` for specifics.
- **Segmented**: SMB, mid-market, and enterprise customers need different playbooks.

## Interaction Flow

### Step 1: Clarify Context

Ask these questions before generating anything:

1. **Which lifecycle stage?**
   - (A) **Onboarding** — New customer activation and time-to-value
   - (B) **Adoption** — Driving feature usage and stickiness
   - (C) **Expansion** — Upsell, cross-sell, seat expansion
   - (D) **Renewal** — Securing contract renewal
   - (E) **Churn Prevention** — At-risk intervention
   - (F) **Full lifecycle** — All stages for a given segment

2. **Which customer segment?** (Define your segments — see `domain-context.md` for personas and market context)

3. **What's the current pain?** Why are you building this playbook now? What signal triggered the need?

Wait for answers before proceeding.

---

## Stage A: Onboarding Playbook

### Customer Story (Work Backwards)

_"As a new customer, I need to be productive within [X] days so that I can replace my current solution before [key deadline]. Success means: my team can perform core workflows without calling support."_

### Health Indicators

| Indicator | Type | Green | Yellow | Red |
|-----------|------|-------|--------|-----|
| Days to first booking | Leading | < 7 days | 7-14 days | > 14 days |
| Chart of accounts imported | Leading | Complete | Partial | Not started |
| Key integration configured | Leading | Connected + tested | In progress | Not started |
| Users invited | Leading | > 80% of licensed seats | 50-80% | < 50% |
| First month-end close completed | Lagging | On time | Delayed | Failed/skipped |
| Support tickets (onboarding) | Lagging | < 3 | 3-8 | > 8 |
| CSAT onboarding survey | Lagging | > 4.0 | 3.0-4.0 | < 3.0 |

### Onboarding Phases

#### Phase 1: Kickoff (Day 0-3)
| Step | Action | Owner | Trigger | Output |
|------|--------|-------|---------|--------|
| 1.1 | Welcome call — confirm goals, timeline, stakeholders | CSM | Contract signed | Kickoff notes, success criteria doc |
| 1.2 | Technical setup — tenant provisioning, SSO config | Implementation | Kickoff complete | Tenant ready, users can log in |
| 1.3 | Data migration plan — chart of accounts, open items, master data | Implementation | Kickoff complete | Migration plan with timeline |
| 1.4 | Compliance configuration (per domain-context.md) | Implementation | Tenant ready | Compliance checklist signed off |

#### Phase 2: Configuration (Day 3-14)
| Step | Action | Owner | Trigger | Output |
|------|--------|-------|---------|--------|
| 2.1 | Core data import and configuration | Implementation | Migration plan approved | Data live, validated |
| 2.2 | Key integration setup and validation | Implementation | Data imported | Successful test export |
| 2.3 | External system connections | Implementation | Tenant configured | Integration test passed |
| 2.4 | Multi-entity configuration (if applicable) | Implementation | Requirements confirmed | Entity structure live |
| 2.5 | User training — core workflows | CSM | Config complete | Training delivered, recorded |

#### Phase 3: Go-Live (Day 14-30)
| Step | Action | Owner | Trigger | Output |
|------|--------|-------|---------|--------|
| 3.1 | Parallel run — old system + new system side by side | Customer + CSM | Training complete | Reconciliation report |
| 3.2 | Data cutover — final migration, opening balances | Implementation | Parallel run passed | Go-live ready |
| 3.3 | Go-live — switch primary system | Customer + CSM | Cutover complete | Customer is live |
| 3.4 | First month-end close support | CSM | End of first month | Successful close |
| 3.5 | First key integration handoff to external stakeholder | CSM | Month-end close | External stakeholder confirms receipt |

#### Phase 4: Stabilization (Day 30-60)
| Step | Action | Owner | Trigger | Output |
|------|--------|-------|---------|--------|
| 4.1 | Health check — usage metrics, support tickets, blockers | CSM | 30-day mark | Health report |
| 4.2 | Onboarding retrospective with customer | CSM | 45-day mark | Feedback captured |
| 4.3 | Handoff to ongoing CS (if separate) | CSM | Stabilization complete | Account transitioned |

---

## Stage B: Adoption Playbook

### Health Indicators

| Indicator | Type | Green | Yellow | Red |
|-----------|------|-------|--------|-----|
| DAU/MAU ratio | Leading | > 60% | 40-60% | < 40% |
| Features used (of available) | Leading | > 70% | 40-70% | < 40% |
| Automation rules active | Leading | > 3 | 1-3 | 0 |
| API integrations connected | Leading | > 1 | 1 | 0 |
| Support ticket trend | Lagging | Decreasing | Stable | Increasing |
| NPS / CSAT | Lagging | > 40 / > 4.0 | 20-40 / 3-4 | < 20 / < 3 |

### Adoption Triggers and Actions

| Trigger | Signal | Action | Owner | Timeline |
|---------|--------|--------|-------|----------|
| Low feature adoption | < 40% features used after 60 days | Feature discovery session | CSM | Within 1 week |
| Single-user dependency | > 80% of activity from 1 user | Admin training + user enablement | CSM | Within 2 weeks |
| No bank reconciliation | Bank module unused after go-live | Workflow walkthrough | CSM | Within 1 week |
| No reporting usage | Reports module untouched | Executive reporting demo | CSM | Within 2 weeks |
| High support volume | > 5 tickets/week sustained | Root cause analysis + training | CSM + Support | Immediate |

---

## Stage C: Expansion Playbook

### Health Indicators

| Indicator | Type | Green | Yellow | Red |
|-----------|------|-------|--------|-----|
| Seat utilization | Leading | > 90% | 70-90% | < 70% |
| Module interest signals | Leading | Feature requests, trial activations | None | N/A |
| Usage growth rate | Leading | > 10% MoM | 0-10% | Declining |
| NRR contribution | Lagging | > 110% | 100-110% | < 100% |

### Expansion Triggers

| Trigger | Signal | Action | Owner |
|---------|--------|--------|-------|
| Seat cap approaching | > 90% seats used | Proactive expansion conversation | CSM + AE |
| New entity/subsidiary | Customer mentions new entity | Multi-entity module pitch | CSM + AE |
| Manual processes identified | Customer doing X manually | Automation/module demo | CSM |
| Partner referral | Customer's external stakeholder asks about your product | Partner program intro | CSM + Partnerships |

---

## Stage D: Renewal Playbook

### Health Indicators

| Indicator | Type | Green | Yellow | Red |
|-----------|------|-------|--------|-----|
| Renewal date proximity | Leading | > 90 days out | 30-90 days | < 30 days |
| Health score | Leading | > 80 | 50-80 | < 50 |
| Executive sponsor engaged | Leading | Active | Passive | Departed/unknown |
| Open critical issues | Leading | 0 | 1-2 | > 2 |
| Renewal commitment | Lagging | Confirmed | In discussion | At risk |

### Renewal Timeline

| Timing | Action | Owner |
|--------|--------|-------|
| R-120 days | Health assessment, identify risks | CSM |
| R-90 days | Business review with executive sponsor — value delivered, roadmap preview | CSM |
| R-60 days | Commercial proposal (if expansion/change) | AE + CSM |
| R-30 days | Contract sent, follow up weekly | AE |
| R-14 days | Escalation if unsigned | CSM Manager |
| R-0 | Renewal processed or churn logged | AE |

---

## Stage E: Churn Prevention Playbook

### Risk Signals

| Signal | Severity | Detection Method |
|--------|----------|------------------|
| Login frequency dropped > 50% | High | Product analytics |
| Executive sponsor left | High | CRM / CSM intel |
| Competitor evaluation mentioned | Critical | CSM / Support notes |
| Unresolved P1 issue > 14 days | High | Support system |
| Core workflow failure | High | Product events |
| Key integration errors recurring | Medium | Product events |
| Contract downgrade request | Critical | AE / CSM |

### Intervention Actions

| Risk Level | Action | Owner | SLA |
|-----------|--------|-------|-----|
| Medium | Proactive check-in, usage review | CSM | 48 hours |
| High | Executive outreach, rescue plan | CSM Manager | 24 hours |
| Critical | VP/C-level intervention, custom remediation | Head of CS | Same day |

### Rescue Plan Template
```markdown
# Customer Rescue Plan: [Customer Name]

## Situation
- Risk signal: [What triggered this]
- Current health score: [X/100]
- Contract value: [ARR]
- Renewal date: [Date]

## Root Cause
[Why are they at risk? Not symptoms — the actual problem.]

## Recovery Actions
| # | Action | Owner | Deadline | Status |
|---|--------|-------|----------|--------|
| 1 | [action] | [name] | [date] | Open |
| 2 | [action] | [name] | [date] | Open |
| 3 | [action] | [name] | [date] | Open |

## Success Criteria
- [What "saved" looks like — measurable]
- [Timeline for recovery]

## Escalation
- If no improvement by [date]: [next action]
```

---

## Stage G: Migration Support

_For managing existing customers through an involuntary platform migration or major system change. This is NOT onboarding (the customer is not new) and NOT churn prevention (the customer is not at risk yet). It is a distinct lifecycle event where an existing customer must be shepherded through a change they did not ask for._

### Migration Health Indicators

| Indicator | Type | Green | Yellow | Red |
|-----------|------|-------|--------|-----|
| Migration prep actions completed | Leading | All done | Partial | Not started (T-14) |
| Support tickets (migration-related) | Leading | < 2 per customer | 2-5 | > 5 |
| First login to new system | Leading | Within 48 hours | Within 1 week | Not logged in after 1 week |
| Critical workflow completed in new system | Lagging | Within 1 week | Within 2 weeks | Not completed after 2 weeks |
| Data reconciliation confirmed by customer | Lagging | Confirmed accurate | Minor issues | Major discrepancies |
| CSAT migration survey | Lagging | > 3.5/5 | 2.5-3.5 | < 2.5 |

### Intervention Triggers & Actions

| Trigger | Action | Owner | Timeline |
|---------|--------|-------|----------|
| Customer hasn't started prep actions (T-30) | Proactive call: "We noticed you haven't started. Can we help?" | CSM | Same day |
| 3+ migration support tickets | Escalation: dedicated migration support session | CSM + Support Lead | Within 24h |
| No login 72h post-cutover | Urgent outreach: "Is everything okay? Let's walk through together." | CSM | Same day |
| NPS dropped >20 points during migration quarter | Executive outreach + recovery plan | CS Director + PM | Within 1 week |
| Customer mentions competitor evaluation | Red alert: executive sponsor call + retention offer | CS Director + Sales | Within 48h |

### CSM Migration Script Templates

**Pre-migration call:** "Hi [Name], I'm reaching out because we're moving to [new platform] on [date]. I want to make sure your team is prepared and comfortable. Can I walk you through what's changing, what stays the same, and what you need to do?"

**Day-of-migration check-in:** "Hi [Name], the migration happened [today/yesterday]. I wanted to personally check — is everything working as expected? Any issues at all, even small ones?"

**Post-migration follow-up (T+7):** "Hi [Name], it's been a week since the migration. How is the team adjusting? Any workflows that feel different or anything we should look at together?"

---

## Output Delivery

Ask: **Where should I deliver this?**
- **Chat**: Full playbook right here
- **File**: Generate a markdown file
- **Notion**: Structured for Notion page creation

Default to chat unless specified.

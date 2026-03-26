# Domain Context

> **This is the only file you need to edit to customize the PM Toolkit for your company.**
> Every skill and agent in this plugin reads this file to adapt examples, personas, metrics,
> and compliance requirements to your specific product and industry.

---

## Company

- **Name**: [Your Company Name]
- **Product**: Cloud ERP (Enterprise Resource Planning)
- **Type**: B2B SaaS
- **Target market**: German SMBs (5-250 employees)
- **Geography**: DACH region (Germany, Austria, Switzerland)

## Team

- **PM team size**: ~15 product managers
- **Leadership**: Head of Product
- **Structure**: Squad-based (PM + Engineering per squad)

## Product Description

Cloud-native ERP platform for German small and medium businesses. Core modules include financial accounting (Finanzbuchhaltung), invoicing, banking/SEPA, reporting, and multi-entity consolidation. Tightly integrated with the DATEV ecosystem for tax advisor collaboration.

## Personas

| Persona ID | Role (German) | Role (English) | Description | Tech Savviness |
|------------|---------------|----------------|-------------|----------------|
| persona-1 | Buchhalter/in | Bookkeeper | Daily user. Books invoices, reconciles bank transactions, runs month-end close. Cares about efficiency and accuracy. | Medium |
| persona-2 | Geschaeftsfuehrer/in | Owner / CEO | Decision maker. Views dashboards, checks compliance status, approves expenses. Cares about overview and control. | Low-Medium |
| persona-3 | Steuerberater/in | Tax Advisor | External stakeholder. Receives DATEV exports, files tax returns, advises on compliance. Cares about data quality and format compatibility. | Medium |
| persona-4 | Controller/in | Controller | Power user. Builds reports, manages multi-entity consolidation, tracks KPIs. Cares about depth and flexibility. | High |
| persona-5 | Lohnbuchhalter/in | Payroll Clerk | Processes payroll, manages employee data, handles social insurance. Cares about correctness and deadlines. | Medium |

## Compliance & Regulatory

| Framework | Full Name | Description | Impact |
|-----------|-----------|-------------|--------|
| GoBD | Grundsaetze ordnungsmaessiger Buchfuehrung und Dokumentation | German legal requirements for digital record-keeping. Mandates immutability, audit trails, and archival. | Non-negotiable. Every booking must comply. |
| DATEV | DATEV eG Ecosystem | Dominant tax advisor software in Germany. Export format compatibility is critical for Steuerberater adoption. | Steuerberater channel depends on seamless DATEV export. |
| HGB | Handelsgesetzbuch | German commercial code governing financial reporting standards. | Affects reporting formats and chart of accounts. |
| ELSTER | Elektronische Steuererklaerung | Electronic tax filing system used by German tax authorities. | Required for UStVA and annual tax submissions. |
| UStVA | Umsatzsteuervoranmeldung | Monthly/quarterly VAT advance return filed electronically. | Hard deadline (10th of following month). |
| SKR03/SKR04 | Standardkontenrahmen | Standard chart of accounts frameworks used in German accounting. | Default CoA templates for new customers. |

## Industry Calendar

| Period | Event | Impact on Product |
|--------|-------|-------------------|
| Jan-Mar | Jahresabschluss (Annual accounts) season | Highest support load. Avoid breaking changes to Finanzbuchhaltung. Customers need stability. |
| Monthly, by 10th | UStVA filing deadline | Release timing must avoid disrupting tax submission workflows. |
| Apr-Jul | Steuererklaerung (Tax return) season | Tax advisors are busy. Feature launches targeting Steuerberater should avoid this window. |
| Varies | DATEV interface updates | Coordinate with DATEV release calendar for integration changes. |
| Dec-Jan | Holiday season + year-end | Reduced customer availability. Code freeze recommended. |

## Domain-Specific Metrics

### Activation Metrics (Leading)

| Metric | Definition | Good Benchmark |
|--------|-----------|----------------|
| Time to first booking | Days from account creation to first financial transaction | < 7 days |
| Chart of accounts completion | % of CoA imported and mapped | > 90% in week 1 |
| DATEV connection rate | % of customers who connect DATEV within 30 days | > 80% |
| Multi-user activation | % of licensed seats with active users | > 70% in month 1 |

### Engagement Metrics (Leading)

| Metric | Definition | Good Benchmark |
|--------|-----------|----------------|
| DAU/MAU | Daily active / Monthly active users | > 60% for accounting software |
| Core action frequency | Bookings per user per day | Industry-dependent |
| Feature breadth | # of distinct features used per user per month | > 5 modules |
| Bank reconciliation rate | % of transactions auto-reconciled | > 80% |

### Outcome Metrics (Lagging)

| Metric | Definition | Good Benchmark |
|--------|-----------|----------------|
| Month-end close time | Hours from period end to close completion | Decreasing trend |
| DATEV export success rate | % of exports without errors | > 99% |
| GoBD compliance score | % of bookings meeting all GoBD requirements | 100% (non-negotiable) |
| Net Revenue Retention | (Starting MRR + expansion - contraction - churn) / Starting MRR | > 110% |

## Ecosystem & Integrations

| System | Type | Importance |
|--------|------|------------|
| DATEV | Tax advisor data exchange | Critical — Steuerberater adoption depends on it |
| SEPA/HBCI | Banking connectivity | Critical — bank reconciliation is a daily workflow |
| ELSTER | Tax authority submission | Required — legal obligation |
| IDW/BSI | Certification bodies | Important — trust signal for enterprise customers |

## Domain-Specific Examples

### JTBD Examples

| Job Statement | Type |
|--------------|------|
| When quarter-end approaches, I want to close books in < 3 days, so I can meet DATEV deadlines. | Functional |
| When I receive a bank statement, I want to match transactions automatically, so I can avoid manual reconciliation errors. | Functional |
| When my Steuerberater asks for data, I want to export in DATEV format with one click, so I can avoid back-and-forth. | Functional |
| When I onboard a new client, I want to set up their chart of accounts quickly, so I can start productive work immediately. | Functional |
| When I present financials to the Geschaeftsfuehrer, I want numbers I trust completely, so I can maintain my professional credibility. | Emotional |
| When regulators audit us, I want to demonstrate GoBD compliance instantly, so I can avoid anxiety and penalties. | Social/Emotional |

### Interview Probes (by domain area)

| Domain | Probe |
|--------|-------|
| Month-end close | "Walk me through the last Monatsabschluss. Where did you lose the most time?" |
| DATEV integration | "How do you get data to your Steuerberater today? What breaks?" |
| Banking/SEPA | "Describe your last bank reconciliation. What surprised you?" |
| Invoicing | "When was the last time an invoice had an error? What happened next?" |
| Multi-entity | "How do you handle intercompany transactions? What's painful?" |
| Compliance | "How confident are you that your records are GoBD-compliant? What worries you?" |

### Onboarding Compliance Milestones

| Milestone | Typical Timeline | Emotion | Risk if Delayed |
|-----------|-----------------|---------|-----------------|
| First GoBD-compliant booking | Week 2-3 | Relief + validation | Doubt in system, compliance anxiety |
| First DATEV export to Steuerberater | Week 3-4 | Major relief | Steuerberater blocks adoption |
| First bank reconciliation (SEPA) | Week 2-3 | Confidence boost | Manual workarounds, frustration |
| First month-end close | Month 1-2 | Pride + exhaustion | Regression to old system |
| First UStVA via system | Month 1-3 | Trust established | Tax compliance risk |
| First Jahresabschluss | Month 6-12 | Full commitment | Existential risk to relationship |

### Funnel: First Value Moments (by persona)

| Persona | Likely "Aha" Moment | Signal |
|---------|---------------------|--------|
| Buchhalter/in | First successful month-end close | Completed close workflow |
| Geschaeftsfuehrer/in | First dashboard view with real data | Viewed report with >0 data |
| Steuerberater/in | First DATEV export that worked without corrections | Successful DATEV export |
| Solo operator | First invoice sent to a real customer | Invoice created + sent |
| Controller/in | First consolidated cross-entity report | Multi-entity report generated |

### Funnel: Common Drop-Off Hypotheses

| Transition | Common Hypotheses |
|-----------|-------------------|
| Visit -> Signup | Value prop unclear for specific persona; pricing page confusion; missing trust signals (DATEV partner badge, GoBD certification) |
| Signup -> Aha | Onboarding too complex; chart of accounts setup is daunting; no sample data to explore |
| Aha -> Habit | No recurring trigger; too much manual data entry; bank connection failed silently |
| Habit -> Paid | Free tier sufficient; sticker shock; missing one critical feature (often DATEV or specific report) |
| Paid -> Renewal | Product didn't deliver on month-end close promise; Steuerberater doesn't accept export format |

### Guardrail Metrics (for experiments touching core functionality)

| Guardrail | Why |
|-----------|-----|
| Data accuracy (booking correctness) | Accounting errors are catastrophic for trust |
| DATEV export success rate | Steuerberater workflow cannot break |
| GoBD compliance check pass rate | Legal requirement, not optional |
| Support ticket volume | Confusion shows up here first |
| Error rate in financial calculations | Rounding errors, tax calculation errors |

### Competitive Context

| Dimension | Details |
|-----------|---------|
| Market category | Cloud ERP for German SMBs |
| Primary competitors | Lexoffice, sevDesk, orgaMAX, DATEV Unternehmen Online, Sage, SAP Business One |
| Key differentiators | Cloud-native, multi-entity support, deep DATEV integration |
| Channel dynamics | Steuerberater recommendations strongly influence SMB purchasing decisions |
| Legacy factor | Many prospects are migrating from on-premise or desktop accounting software |

## Sales & GTM Context

> **Optional section.** Fill this in to enable go-to-market skills (pm-battlecard, pm-sales-deck, pm-gtm-launch, etc.).
> Leave blank if you don't use the GTM workflow.

### Sales Team Structure

- **Sales motion**: [Self-serve / Inside sales / Field sales / Channel-led / Hybrid]
- **Team size**: [N] AEs, [N] SDRs, [N] SEs
- **Average deal size**: EUR [X]
- **Average sales cycle**: [N] days/weeks
- **Primary CRM**: [CRM name]
- **Key channels**: [Direct, partner/Steuerberater, marketplace]

### Deal Stages

| Stage | Description | Typical Duration | Key Activities |
|-------|-------------|-----------------|----------------|
| Qualification | [description] | [duration] | [activities] |
| Discovery | [description] | [duration] | [activities] |
| Demo | [description] | [duration] | [activities] |
| Proposal | [description] | [duration] | [activities] |
| Negotiation | [description] | [duration] | [activities] |
| Closed | [description] | [duration] | [activities] |

### ICP (Ideal Customer Profile)

| Dimension | Criteria |
|-----------|---------|
| Company size | [employee count or revenue range] |
| Revenue range | EUR [range] |
| Industry | [sectors / verticals] |
| Geography | [regions] |
| Tech maturity | [description] |
| Buying trigger | [what causes them to evaluate a solution now] |
| Disqualifiers | [what makes a prospect NOT a fit] |

### Buyer Personas (distinct from product user personas above)

| Persona | Role | Cares About | Common Objections |
|---------|------|-------------|-------------------|
| Economic Buyer | [role, e.g., Geschaeftsfuehrer/CFO] | [priorities] | [typical pushback] |
| Champion | [role, e.g., Buchhalter/Controller] | [priorities] | [typical pushback] |
| Blocker | [role, e.g., IT Lead / incumbent vendor advocate] | [priorities] | [typical pushback] |

### Win/Loss Patterns

- **Top 3 reasons we win**: [reasons with evidence]
- **Top 3 reasons we lose**: [reasons with evidence]
- **Most common competitor in deals**: [competitor name]
- **Average win rate**: [X]%
- **Win rate vs top competitor**: [X]%

## Language

- **Default output language**: English
- **German on request**: Switch to professional German (Sie-Form for external, Du-Form for internal if specified)
- **German formatting conventions**: Dates as DD.MM.YYYY, currency as EUR with comma decimal

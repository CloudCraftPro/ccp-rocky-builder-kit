# Role Playbook

**How the capture framework adapts to different roles. Find your closest match and use it as a starting point.**

---

## Software Engineer / Developer

**Primary categories:** Tasks, Decisions, Context
**Secondary categories:** Questions, Commitments
**Minimal categories:** Projects (usually defined externally in Jira/Linear/GitHub)

**What the assistant does:**
- Tracks code review commitments ("I'll review Jake's PR by EOD")
- Captures architectural decisions with rationale (invaluable 6 months later)
- Maintains context about systems ("The payment service has a 30-second timeout because of the bank API")
- Flags tasks that have been blocked for too long
- Tracks questions raised in PR reviews or standups

**Urgency triggers:**
- Production incidents or outages
- Blocked deployments
- Security vulnerabilities
- Release deadline within 24 hours
- CI/CD pipeline failures affecting the team

**Reporting:**
- Daily: blocked items, overdue PRs, stale questions
- Weekly: decision log (what was decided this week and why), task velocity
- On-demand: "What decisions have we made about [system]?", "What's blocking me?"

**Integrations:**
- GitHub/GitLab: PR reviews, issue tracking
- Jira/Linear: sprint work, ticket status
- Slack: team channels, DMs with tech lead

**Person tracking:**
- Teammates: communication preferences, expertise areas, timezone
- No performance signals (not a manager role)

**Personality note:**
Engineers usually want terse communication, no fluff, and an assistant that speaks their language technically. Don't oversimplify. Don't explain things they already know.

---

## Project Manager / Program Manager

**Primary categories:** Tasks, Commitments, Questions
**Secondary categories:** Decisions, Context
**Minimal categories:** (none — PMs use everything)

**What the assistant does:**
- Tracks every commitment from every stakeholder. This is the PM's superpower.
- Maintains a map of who owes what to whom and when
- Catches questions that were asked in meetings but never answered
- Surfaces stale items before they become crises
- Produces status reports from capture data

**Urgency triggers:**
- Client deliverable due within 48 hours
- Stakeholder escalation
- Resource conflict (two projects competing for same person)
- Scope change without timeline adjustment
- Missed milestone

**Reporting:**
- Daily briefing: what's due today, what's overdue, what's waiting on someone
- Weekly: project health per workstream, commitment hit rates, stale questions
- Upstream: formatted status reports for leadership (weekly or biweekly)
- On-demand: "What has [client] been promised?", "What's blocking [project]?", "Who is overcommitted?"

**Integrations:**
- Email: heavy — PMs live in email. Triage is critical.
- Slack/Teams: channel monitoring for decisions and commitments made in real-time
- Jira/Asana: task and sprint tracking
- Calendar: meeting awareness for context and follow-up generation
- Confluence/Notion: documentation tracking

**Person tracking:**
- Team members: active items, reliability notes, capacity awareness
- Clients: communication preferences, decision authority, relationship health
- Stakeholders: what they care about, how they like updates
- Performance signals: yes — commitment hit rate and task velocity for team members

**Personality note:**
PMs need an assistant that's organized and proactive. The assistant should be the one remembering that Sarah promised a deliverable last Thursday and it hasn't arrived. It should draft the nudge message. It should notice that the same person is assigned to three projects simultaneously.

---

## Designer (UX/UI/Product)

**Primary categories:** Tasks, Context, Decisions
**Secondary categories:** Commitments, Questions
**Minimal categories:** Projects (usually inherited from PM)

**What the assistant does:**
- Tracks design feedback across revision cycles ("Client approved the nav but wants changes to the footer — rev 3")
- Captures design decisions with rationale ("We chose tab navigation over hamburger menu because of the user testing results")
- Maintains context about client preferences ("They hate gradients. Every time. Don't forget.")
- Tracks approval status per deliverable
- Catches when feedback contradicts previous approved decisions

**Urgency triggers:**
- Client review deadline
- Handoff to dev team due within 24 hours
- Accessibility audit findings
- Brand guideline violation flagged
- Stakeholder changed direction after sign-off

**Reporting:**
- Daily: what needs review, what's waiting on client feedback
- Weekly: revision cycle status, decisions made, blocked items
- On-demand: "What has [client] approved so far?", "What was the rationale for [decision]?"

**Integrations:**
- Email: feedback and approvals often arrive here
- Slack: quick feedback, stakeholder reactions
- Figma comments: design-specific feedback (if tooling supports it)
- Project management tool: task tracking

**Person tracking:**
- Clients: visual preferences, approval authority, feedback style
- Team members: who handles which deliverables
- No performance signals typically

**Personality note:**
Designers often have strong visual and organizational preferences. The assistant should be clean and organized in its communication. Avoid walls of text — use structure.

---

## Sales / Business Development

**Primary categories:** Commitments, Questions, Context
**Secondary categories:** Tasks, Decisions
**Minimal categories:** Projects (deals might become projects)

**What the assistant does:**
- Tracks every commitment made to a prospect ("Told them I'd send the proposal by Monday")
- Tracks every commitment made BY a prospect ("They said they'd loop in their CTO")
- Maintains context about each lead/account (budget cycle, pain points, decision timeline)
- Catches questions from prospects that need follow-up
- Monitors deal momentum — flags when a lead goes silent

**Urgency triggers:**
- Proposal deadline
- Contract expiration / renewal window
- Competitor mentioned by prospect
- Decision maker meeting scheduled within 48 hours
- Lead went dark after hot engagement (>5 business days)

**Reporting:**
- Daily: follow-ups due, commitments expiring, new leads
- Weekly: pipeline status, deal movement, stale leads
- On-demand: "What have I promised [prospect]?", "When did we last talk to [company]?", "What's the status of [deal]?"

**Integrations:**
- Email: primary communication channel with prospects
- CRM (HubSpot/Salesforce): deal tracking, contact management
- Calendar: meeting prep and follow-up capture
- LinkedIn: connection and engagement tracking (if tooling supports)

**Person tracking:**
- Leads: detailed — company, role, pain points, budget authority, communication preference, engagement history
- Clients: relationship health, renewal dates, upsell opportunities
- No performance signals

**Personality note:**
Salespeople need an assistant that thinks in terms of relationships and momentum. The assistant should notice when things are cooling off and prompt action. It should help prepare for meetings by surfacing everything known about the prospect.

---

## Engineering Manager / Tech Lead

**Primary categories:** Tasks, Commitments, Context
**Secondary categories:** Decisions, Questions
**Minimal categories:** (none — managers use everything)

**What the assistant does:**
- Tracks what each team member is working on and whether it's on track
- Captures 1:1 notes and commitments from those conversations
- Monitors team health signals (velocity, rework, responsiveness)
- Surfaces blockers before they're escalated
- Tracks hiring pipeline and interview feedback
- Maintains institutional knowledge about systems the team owns

**Urgency triggers:**
- Production incident
- Team member escalation / morale issue
- Sprint goal at risk
- Hiring deadline (offer expiring)
- Cross-team dependency blocked

**Reporting:**
- Daily briefing: team blockers, overdue items, PRs waiting review
- Weekly: team performance signals, sprint health, 1:1 action items status
- On-demand: "How is [person] doing?", "What's the status of [project]?", "Who is overloaded?"

**Integrations:**
- Jira/Linear: sprint tracking, ticket velocity, rework detection
- GitHub: PR review cycles, merge frequency
- Slack: team channel monitoring, DM triage
- Calendar: 1:1 scheduling, meeting follow-ups
- HR tools: PTO tracking, hiring pipeline (if accessible)

**Person tracking:**
- Direct reports: detailed — working style, strengths, growth areas, active items, performance signals
- Skip-levels: lighter touch — notable interactions, escalations
- Cross-team contacts: communication preferences, reliability
- Performance signals: yes — full computation (commitment hit rate, task velocity, question responsiveness, Jira metrics if applicable)

**Personality note:**
Engineering managers need an assistant that understands both the technical and people sides. It should be empathetic when discussing people and precise when discussing systems. It should never surface individual performance data to anyone except the manager, and it should frame performance issues as opportunities for coaching, not as judgments.

---

## Executive / Director / VP

**Primary categories:** Decisions, Commitments, Context
**Secondary categories:** Tasks, Questions
**Minimal categories:** (none — execs get a filtered view of everything)

**What the assistant does:**
- Tracks strategic decisions with full rationale (the exec's most valuable artifact)
- Monitors commitments to/from board, leadership, direct reports
- Maintains organizational context (who's doing what, what initiatives are active)
- Surfaces problems that need executive attention (declining metrics, missed commitments, resource conflicts)
- Helps prepare for leadership meetings with relevant context

**Urgency triggers:**
- Board or investor communication needed
- Legal / compliance / contractual issue
- Customer escalation to exec level
- Key employee resignation or performance crisis
- Budget/financial threshold exceeded

**Reporting:**
- Daily briefing: critical items only (execs don't need noise)
- Weekly: organizational health dashboard, initiative status, commitment tracking
- On-demand: "What decisions have I made about [topic]?", "What have we committed to [stakeholder]?", "Where are we at risk?"

**Integrations:**
- Email: heavy triage — execs get volume
- Calendar: meeting prep and follow-up
- Slack/Teams: executive channels, direct reports
- Board/investor tools: document tracking
- Financial dashboards: if accessible

**Person tracking:**
- Direct reports: detailed with performance signals
- Key stakeholders: board members, investors, major clients
- Organizational awareness: who reports to whom, who's critical to what

**Personality note:**
Executives need an assistant that's strategic, not tactical. Don't surface every task — surface the 3 things that matter most. Communication should be crisp. The assistant should be able to synthesize across projects and teams, not just report on individual items.

---

## Adapting Beyond These Roles

These are starting points. Your actual role is probably a mix. Common hybrids:

- **Tech Lead + IC Engineer** → Blend Engineer and Engineering Manager, scale down people management
- **Founder / Solo Operator** → Blend Executive and PM, heavier on tasks and lighter on delegation
- **Account Manager** → Blend PM and Sales, focused on client relationship and delivery
- **QA / Test Engineer** → Start from Engineer, add quality-specific context captures and defect tracking
- **Operations / DevOps** → Start from Engineer, add incident tracking, runbook context, on-call awareness
- **Freelancer / Contractor** → Start from Engineer or Designer, add client tracking from Sales, add time/billing awareness

The discovery interview (Phase 1) captures enough about you to inform these blends. Trust the process.

---

## Universal Requirements (All Roles)

Regardless of role, every instance of this framework requires:

1. **A named assistant.** Not optional. Your assistant has a personality — give it a name.
2. **A named framework.** The operational system (captures, indexes, person files, everything) needs a name. Default is "the Matrix." Keep it or pick your own. This name appears in file headers and conversation.
3. **Escalation Protocol.** Built into every AGENTS.md. When you or your assistant don't know how to handle something within the framework, the answer is: flag it for review and update the framework with what you learned. Don't paper over gaps — fix them.

---

_Pick the closest role, customize from there. Don't try to use everything. Start lean._

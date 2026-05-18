# SCHEMAS.md — File Templates and Formats

_Reference file for capture, person, project, and index file formats. Loaded on-demand when creating or editing files._

---

## Capture File Formats

### Common Fields (all captures)

Every capture file starts with this header:

```markdown
# [Type Prefix]-[Date]-[Sequence]
- **Type:** [question | decision | task | commitment | context]
- **Created:** [ISO date]
- **Source:** [email | slack | teams | manual | meeting | other]
- **Project:** [project name or "none"]
- **People:** [list of names]
- **Status:** [open | waiting | parked | closed | resolved | fulfilled | late | broken | cancelled]
- **Related:** [capture ID(s) or "none"]
- **Summary:** [one-line plain language description]
```

### Question

```markdown
- **Asked by:** [name]
- **Can answer:** [name or "unknown"]
- **Deadline:** [date or "none"]
- **Urgency:** [high | medium | low]

## Detail
[Full text of the question and any relevant context]

## Answer
[Filled in when resolved — include who answered and when]
```

### Decision

```markdown
- **Made by:** [name]
- **Involved:** [list of names]
- **Inform:** [list of names who need to know]
- **Reversible:** [yes | no | partially]

## Detail
[What was decided]

## Rationale
[Why this choice was made]

## Alternatives Considered
[What else was on the table, if known]
```

### Task

```markdown
- **Owner:** [name]
- **Assigned by:** [name]
- **Due:** [date]
- **Priority:** [high | medium | low]
- **Effort:** [small | medium | large]
- **Blocked by:** [capture ID, or "none"]
- **Waiting on:** [name and what, or "none"]
- **Recurring:** [none | daily | weekly | biweekly | monthly | quarterly | custom]

## Detail
[What needs to be done — clear definition of done]

## Completed
[Date completed, or empty]
```

### Commitment

```markdown
- **Promised by:** [name]
- **Owed to:** [name]
- **Promised on:** [date]
- **Due:** [date]
- **Waiting on:** [name and what, or "none"]
- **Recurring:** [none | daily | weekly | biweekly | monthly | quarterly | custom]

## Detail
[What was promised]

## Fulfilled
[Date fulfilled, or empty. If late, note the slippage.]
```

### Context

```markdown
- **Subject:** [person, project, system, or relationship this is about]
- **Confidence:** [observed | stated | inferred]
- **Expires:** [date or "never"]

## Detail
[The knowledge being captured]
```

---

## Index Format

```markdown
# [Project Name] Index
_Last updated: [ISO date]_

## Open Items

| ID | Type | Status | People | Summary | Date |
|----|------|--------|--------|---------|------|

## Recently Closed (last 30 days)

| ID | Type | Status | People | Summary | Closed |
|----|------|--------|--------|---------|--------|
```

---

## Person File Schemas

[INCLUDE ONLY THE SCHEMAS RELEVANT TO YOUR ROLE]

### Employee (for people you manage)

```markdown
# [Full Name]
- **Title:** [role]
- **Team:** [team name]
- **Manager:** [name]
- **Organization:** [org name]
- **Start date:** [date]
- **Contact:** [email, Slack handle, phone]
- **Timezone:** [timezone]

## Working Style
[Observations about how this person works. Grows over time.]

## Active Items
[Rolling list of open capture IDs involving this person. Updated automatically.]

## Performance Signals
_Updated weekly or on request._
- **Commitment hit rate:** [percentage on-time]
- **Average task velocity:** [average days]
- **Question responsiveness:** [average days]
- **Trend:** [improving | stable | declining]
- **Notes:** [narrative context]

## History
[Reverse chronological log of notable events.]
```

### Contact (for clients, stakeholders, external collaborators)

```markdown
# [Full Name]
- **Title:** [role]
- **Company:** [company name]
- **Projects:** [list of associated projects]
- **Contact:** [email, phone]
- **Decision authority:** [approver | influencer | end user | technical contact]
- **Communication preferences:** [channel, timing, style notes]

## Relationship Notes
[Rapport, quirks, sensitivities. Grows over time.]

## Active Items
[Rolling list of open capture IDs involving this person.]

## History
[Reverse chronological log of notable interactions.]
```

### Vendor/Contractor

```markdown
# [Full Name]
- **Company:** [company name]
- **Role/Service:** [what they provide]
- **Contact:** [email, phone]
- **Contract rate:** [hourly/fixed, amount]
- **Contract terms:** [start, end, renewal]
- **Projects:** [list of associated projects]

## Reliability Notes
[Delivery consistency, communication quality, responsiveness.]

## Active Items
[Rolling list of open capture IDs involving this person.]

## History
[Reverse chronological log of notable interactions.]
```

---

## Project File (_project.md)

```markdown
# [Project Name]
- **Client/Stakeholder:** [name]
- **Status:** [active | on hold | completed | cancelled]
- **Team:** [list of people involved]
- **Point of contact:** [primary person]
- **Start date:** [date]
- **Target end date:** [date]
- **Organization:** [org name]

## Description
[What this project is.]

## Milestones
[Key dates and deliverables, if known.]

## Summary
_Last refreshed: [date]_
[3-5 sentence snapshot of where the project stands. Refreshed on request.]
```

---

## Session Log Entry

```markdown
## [ISO-8601-timestamp] | [instance-id] | [event-type]
- **Trigger:** [what initiated the session]
- **Captures created:** [IDs, or "none"]
- **Captures modified:** [IDs, or "none"]
- **Indexes updated:** [paths, or "none"]
- **Person files updated:** [paths, or "none"]
- **Memory changes:** [description, or "none"]
- **Sequence state:** [type=NNN, or "none"]
- **Notes:** [free text, or omit]
```

**Event types:** `session-start`, `session-end`

For `session-start`, use simplified form:

```markdown
## [ISO-8601-timestamp] | [instance-id] | session-start
- **Synced from:** [last entry absorbed]
- **Changes absorbed:** [summary]
```

---

## Sequence Counter

```markdown
# Sequence Counter
_Resets daily at midnight. Global across all capture types._

## YYYY-MM-DD

- Q: NNN
- D: NNN
- T: NNN
- C: NNN
- X: NNN
```

Counter shows the **last used** number. `000` = none used yet for that type on that day.

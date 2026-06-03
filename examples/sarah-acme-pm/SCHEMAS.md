# SCHEMAS.md — Capture and Person Formats

## Capture Header (all types)

```markdown
---
id: T-20260601-003
type: Task
title: Draft Q3 OKR proposal for mobile team
status: open                # open | waiting | done | dropped
created: 2026-06-01
due: 2026-06-12
owner: Sarah
people: [Alex Kim]
project: acme-mobile-onboarding
tags: [okr, q3]
related: [D-20260530-001]
---
```

## Task (T) — body

```markdown
## What
[One-line concrete deliverable. "Definition of done" if helpful.]

## Why
[The reason this matters. Strategic context, not just description.]

## Notes
- [Anything relevant — links, blockers, related context]
```

## Commitment (C) — body

```markdown
## Direction
inbound          # someone promised Sarah
# or
outbound         # Sarah promised someone

## Who
[Name]

## What
[The actual commitment. Specific.]

## When
[Date or "soon" / "this sprint" / etc.]

## Notes
- [Where it was made (which meeting, thread), any caveats]
```

## Question (Q) — body

```markdown
## Asked by
[Name — or "Sarah" if she's the one asking]

## Asked of
[Name — or "Sarah" if she's expected to answer]

## Question
[The actual question, verbatim if possible.]

## Why it matters
[What's blocked or affected by not having an answer.]

## Escalate after
[Date — after which Sarah should chase or escalate]
```

## Decision (D) — body

```markdown
## Decision
[What was decided. Specific.]

## Rationale
[The reasoning. The cost of getting this wrong if rationale is lost is high.]

## Alternatives considered
- [Option A]: rejected because ...
- [Option B]: rejected because ...

## Reversibility
[easy | medium | hard — what undoing this would cost]

## Decided by
[Name(s)] on [date]
```

## Context (X) — body

```markdown
## Subject
[What this is about — one phrase]

## Content
[The knowledge itself. Be specific enough that a future search hit gives Sarah enough to act on without re-reading source material.]

## Source
[Where this came from — meeting, doc, conversation, with date]
```

## Person file (`people/<name>.md`)

```markdown
# [Name]

## Role
[Title] at [Org]

## Relationship to Sarah
[direct report | manager | peer | client | advisor | etc.]

## Working style
- [How they communicate, what they care about, what frustrates them]

## Active items
- [List of open captures involving this person — auto-maintained]

## Notes / history
- [Date]: [Significant interaction or context]
```

# AGENTS.md — [Framework Name]

## Every Session

1. Read `SOUL.md` — who you are
2. Read `USER.md` — who you work for
3. Read `MEMORY.md` — what you remember
4. Read `AGENTS.md` — how you operate (this file)
5. Read `_session-log.md` — what happened since last session
6. Write `session-start` entry to `_session-log.md`

---

## The Capture Framework

Six categories. Everything flows through this lens.

- **Questions** — Open loops needing answers
- **Decisions** — Choices made, with rationale
- **Tasks** — Work with an owner, deadline, definition of done
- **Commitments** — Promises between people (both directions)
- **Context** — Knowledge with no action attached
- **Projects** — Container grouping the other five

---

## Classification Rules

Classify in this order:

1. Someone promised something → **Commitment**
2. Work someone needs to do → **Task**
3. Choice was made → **Decision**
4. Someone waiting for an answer → **Question**
5. Useful knowledge, no action → **Context**
6. New body of work with people + timeline → **Project**

A single message can yield multiple captures. Default to capturing — easier to close than reconstruct.

**Confidence:** If confident, capture silently. If uncertain, ask: "That sounds like a [type] — should I track it?"

**Dual classification:** When something is both a commitment and a task, create both, link via Related field.

**Waiting status:** When a task or commitment depends on someone else, set Status to `waiting` and fill `Waiting on: [name] — [what]`. When resolved, flip back to `open`.

---

## When to Capture

**Always capture (no confirmation):** Explicit commitments with person + timeframe, tasks with owner + deadline, clear decisions, direct questions needing response, project status changes.

**Capture and mention:** Important context with no action, implicit commitments, informal decisions.

**Ask first:** Anything uncertain, sensitive/personal info, ambiguous classification.

**Direct conversation:** Only capture what [User Name] explicitly asks to track or items clearly matching "always capture" criteria. Don't capture casual statements or opinions.

---

## How to Write Capture Files

> For file formats and fields, read `SCHEMAS.md`

### Deduplication

Before creating any capture: same people + same content + same timeframe = probable duplicate. Search indexes first. Update existing captures rather than creating duplicates.

### File Naming

`[Prefix]-YYYYMMDD-NNN.md` — Q, D, T, C, X. Sequence numbers reset daily. Track in `_sequence.md`.

### File Location

- Known project → `projects/[project-name]/[category]/`
- No project → `captures/[category]/`
- New project needed → ask whether to create or file as orphan

---

## Index Maintenance

Every project directory and `captures/` has a `_index.md`.

> For index table format, read `SCHEMAS.md`

### Rules

- Update index on every capture create/modify/close
- Open items sorted by date, newest first
- Recently closed items stay 30 days then leave the index (files remain permanently)
- Long index = lots of open items — mention this in summaries

---

## Person File Management

### Directory Structure

```
people/
├── employees/ [If user manages people]
├── clients/ [If user works with clients]
│ └── [company-slug]/
├── vendors/ [If user works with vendors]
│ └── [company-slug]/
└── leads/ [If user tracks prospects]
```

> For person file schemas, read `SCHEMAS.md`

### Auto-Creation

When you encounter an unknown person: determine category, create if confident, ask if unsure. Always mention: "Created person file for [name] as [type]."

---

[CONDITIONAL: Include only if the user manages people]
## Performance Signal Computation

Compute from capture data. Never guess.

**Minimum threshold:** 3 data points per metric in 90-day window to display. Below that: "Insufficient data."

**Commitment hit rate:** % of commitments fulfilled on time. Report: "[X]% on-time ([N] of [M] in last 90 days)"

**Task velocity:** Avg calendar days from created to completed. Report: "Average [X] days ([N] tasks in last 90 days)"

**Question responsiveness:** Avg days from created to answered. Report: "Average [X] days ([N] questions, [M] stale)"

**Trend:** Compare current vs prior 90-day period. >15% movement = improving/declining.

**When to update:** Weekly or on request. Never surface unprompted unless trend = declining.
[END CONDITIONAL]

---

## Project Files

> For `_project.md` format, read `SCHEMAS.md`

---

## Reporting and Summaries

**"What's going on with [project]?"** → Read index + project file + scan context. Report: status, open item count, overdue/stale items.

**"How is [person] doing?"** → Read person file + scan indexes. Report: workload, commitment hit rate, overdue items.

**"What needs my attention?"** → Scan all indexes. Split into:
- **Action required** (open, no wait): overdue tasks, late commitments, stale questions
- **Waiting on others** (waiting status): sorted by wait duration, flag stale (>5 business days)

[CUSTOMIZE: Briefing schedule and content based on System Design]

**[Briefing Name] ([cadence], [time]):**
1. **On fire** — overdue, late, urgent
2. **Action required** — due soon, stale questions
3. **Stale waits** — items waiting > 5 business days
4. **What's new** — recent captures

---

[CONDITIONAL: Include only if email triage is needed]
## Email Triage Integration

### Account Mapping

[Map email accounts to organizational context per USER.md]

### Processing

1. Read message → classify captures → match people → match project → write captures + update indexes
2. Auto/Phishing → archive immediately
3. Urgent → notify immediately
4. Needs response → draft reply for approval
5. Never send without explicit approval

### Threads

Only classify newest unread. Update existing captures rather than duplicating.
[END CONDITIONAL]

---

[CONDITIONAL: Include only if messaging triage is needed]
## Messaging Triage Integration

### Processing

1. Read messages → classify captures → match people → match project → write captures
2. Urgent → notify immediately
3. Needs response → draft for approval
4. Never send without approval

### Signal vs. Noise

- **Always capture:** Commitments, task assignments, decisions, deadlines, blockers
- **Capture and mention:** Status updates, directed questions, informal decisions
- **Skip:** Reactions, acknowledgments, social chatter
- **Threads:** Capture the outcome, not every message
[END CONDITIONAL]

---

## General Operating Rules

- **Act, don't ask** — for reads, captures, internal organization
- **Ask before external actions** — messages, emails, calendar events
- **One capture per file, indexes stay lean**
- **Every capture follows the schema exactly**
- **Surface problems** — don't hide declining signals or mounting open items
- **Update indexes immediately** — same action as the capture
- **Archive, don't delete** — closed files stay in place permanently

---

## Correction Protocol

Execute immediately without confirmation:

- **"Reclassify [ID] as [type]"** — change type, move file, update indexes
- **"Move [ID] to [project]"** — move file, update source + destination indexes
- **"Reassign [ID] to [person]"** — change owner, update person files + index
- **"Close [ID]"** — mark closed, update index + person files
- **"Kill [ID]"** — mark cancelled, update index + person files
- **"Merge [ID] into [ID]"** — combine, close redundant, update all refs

Confirm: "Done — [brief description]."

---

## Urgency Definition

[CUSTOMIZE: Based on System Design urgency triggers]

Urgent = any of:
- [Urgency trigger 1]
- [Urgency trigger 2]
- [Urgency trigger 3]
- [Urgency trigger 4]
- Explicitly flagged by [User Name]

Everything else → next briefing cycle.

---

## Scheduled Operations

[CUSTOMIZE: Based on System Design reporting cadence]

**[Daily/Weekly/etc.] — [Time]:** [What happens]

**Monthly — 1st of Month:** Prune "Recently Closed" older than 30 days from indexes. Archive stale MEMORY.md entries. Close expired context captures.

---


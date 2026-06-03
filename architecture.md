# Architecture Reference

**How the system works. Read this if you want to understand what you're building, not just build it.**

---

## The Core Idea

Most AI assistants forget everything between sessions. You tell them about your team on Monday, and by Wednesday they're asking "who's Jake?" again. This system fixes that with a simple principle: **the workspace is the memory.**

Every session, the assistant reads a set of files. Those files contain its identity, your profile, its operational rules, and everything it has learned. When it learns something new, it writes it to a file. When it wakes up next time, it reads that file. No magic. No embeddings database (though you can add one). Just files.

---

## The File Hierarchy

Files are read in a specific order at the start of every session. This order matters — earlier files establish context for later ones.

```
1. SOUL.md → Who the assistant is. Personality. Directives. Boundaries.
2. USER.md → Who you are. Organizations. Accounts. Preferences.
3. MEMORY.md → What it remembers. Institutional knowledge. Lessons learned.
4. AGENTS.md → How it operates. Capture rules. Classification. Reporting.
5. SCHEMAS.md → File templates. Loaded on-demand, not at boot.
6. TOOLS.md → Environment notes. Device names, SSH hosts, etc.
```

SOUL.md and USER.md are relatively static — they change when your role or preferences change. MEMORY.md grows over time. AGENTS.md is your operating manual — you'll refine it as you learn what works.

---

## The Capture Framework

The system's main capability is **capturing** — classifying information into six categories and filing it persistently.

### The Six Categories

| Category | What It Catches | Example |
|----------|----------------|---------|
| **Question** | Something that needs an answer | "Did the client approve the wireframes?" |
| **Decision** | A choice that was made | "We're going with Postgres instead of MongoDB" |
| **Task** | Work with an owner and a deadline | "Jake needs to deploy the staging server by Friday" |
| **Commitment** | A promise between people | "I told Sarah I'd review her PR by end of day" |
| **Context** | Knowledge, no action needed | "The client's fiscal year ends in March" |
| **Project** | A container for the other five | "Website Redesign — Q2 deliverable for Acme Corp" |

### Why These Six?

These categories cover the complete lifecycle of professional information:

- **Questions** catch open loops. Every unanswered question is cognitive overhead. Tracking them means nothing festers.
- **Decisions** catch choices and their rationale. Three months from now, when someone asks "why did we do this?", the decision capture has the answer.
- **Tasks** catch work. This is the most obvious category, but most people only track tasks — the other five are what make this system different.
- **Commitments** catch promises. This is the category most people miss entirely. When someone says "I'll send that over," that's a commitment. Tracking both directions (what you promised, what was promised to you) prevents the most painful failures — broken promises you didn't even realize were promises.
- **Context** catches knowledge. Things that aren't actionable but are important to know. A client's communication preference. A system's quirk. Background that makes future decisions better.
- **Projects** provide structure. Without projects, captures are a flat list. Projects group related captures and give them meaning.

### Classification Priority

When something could be multiple categories, classify in this order:

1. Someone promised something → **Commitment**
2. Work someone needs to do → **Task**
3. Choice was made → **Decision**
4. Someone waiting for an answer → **Question**
5. Useful knowledge, no action → **Context**

Commitments take priority because they're the most dangerous to miss. A forgotten task is annoying. A broken promise damages relationships.

### Dual Classification

Sometimes something is both a commitment and a task. Example: "I'll build that report by Friday." That's a commitment (you promised) AND a task (work to do). Create both. Link them. The commitment tracks whether the promise was kept. The task tracks the actual work.

---

## File Naming and Location

Every capture gets a unique ID: `[PREFIX]-YYYYMMDD-NNN`

| Prefix | Category |
|--------|----------|
| Q | Question |
| D | Decision |
| T | Task |
| C | Commitment |
| X | Context |

The sequence number (NNN) resets daily and is tracked in `_sequence.md`.

Captures live in one of two places:
- `projects/[name]/[category]/` — if the capture belongs to a known project
- `captures/[category]/` — if it's an orphan (no project yet)

Orphans can be moved to a project later. The important thing is to capture first, organize second.

---

## Indexes

Every project directory and the `captures/` directory has an `_index.md` — a table of all open items and recently closed items.

Indexes are the primary query surface. When the assistant answers "what's going on with Project X?", it reads the index first, not every individual file. This makes queries fast and keeps the system scalable.

**Index rules:**
- Updated on every capture create, modify, or close
- Open items sorted by date, newest first
- Recently closed items stay 30 days, then leave the index (files remain permanently)
- Long indexes = too many open items — the assistant should flag this

---

## Person Files

People who appear in captures get their own files under `people/`. The directory structure mirrors the relationship:

```
people/
├── employees/ # Your team members
├── clients/
│ └── [company-slug]/ # Grouped by company
│ ├── _client.md # Company-level file
│ └── [person].md # Individual contacts
├── vendors/
│ └── [company-slug]/ # Grouped by company
└── leads/ # Prospects, not yet clients
```

Person files track:
- **Who they are** — title, contact info, timezone
- **Active items** — open captures involving them (auto-updated)
- **Working style** — observations about how they communicate and work (grows over time)
- **History** — notable events, not a log of every interaction
- **Performance signals** — only for people you manage, only if you want this

Person files are created automatically when a new name appears in captures. The assistant tells you when it creates one.

---

## Memory

`MEMORY.md` is institutional knowledge — things the assistant has learned that should persist. It's an index with pointers to individual memory files in the `memory/` directory.

Memory is NOT:
- A log (that's session-log)
- Task tracking (that's captures)
- Person-specific knowledge (that's person files)
- Project status (that's project indexes)

Memory IS:
- User preferences that aren't in SOUL.md
- Organizational facts that aren't obvious from the code/files
- Lessons learned from mistakes
- Terminology definitions
- Ongoing threads that span multiple sessions

Memory is capped at 300 lines in the index file. Older or less-referenced entries get archived.

---

## Reporting

The assistant proactively reports on the state of your world. The default rhythm:

- **Morning briefing (daily):** What's on fire, what's due today, what's stale, what's new
- **Weekly summary:** Performance signals, project health, orphan cleanup, stale items
- **On-demand queries:** "What's going on with [project]?", "How is [person] doing?", "What needs my attention?"

Reporting is fully customizable. You can change the cadence, content, and format. Some people want daily briefings. Some want weekly. Some want nothing unless something's wrong.

---

## Multi-Instance (Advanced)

If you use your assistant across multiple AI tools (e.g., Claude Code on your laptop + a web-based instance), you need multi-instance sync. This adds:

- **Instance registry** — which instances exist, what model they use, what sequence range they own
- **Session log** — append-only ledger of what each instance did
- **Sequence partitioning** — each instance gets a range of sequence numbers so they can't collide
- **Lock protocol** — lightweight file-level locking for concurrent access
- **Delegation protocol** — one instance can assign work to another

Most people don't need this. If you use one AI tool, skip it entirely.

---

## The Trust Model

The assistant operates on a two-tier trust model:

**Internal actions (high autonomy):**
- Reading anything
- Creating and updating captures
- Maintaining indexes
- Creating person files
- Organizing the workspace
- Running scheduled operations

These happen silently. The assistant tells you what it did, but doesn't ask permission.

**External actions (zero autonomy without approval):**
- Sending any message (email, Slack, text)
- Modifying calendar events
- Posting anything public
- Taking any action that affects other people
- Making purchases

These ALWAYS require showing you exactly what will be sent/done and getting explicit "yes."

The boundary is clear: **anything that stays inside your workspace is fair game. Anything that touches the outside world needs your approval.** You can move specific actions across this boundary as you build trust.

---

## Naming

Two names are central to every instance:

**The assistant name** — your assistant has a personality and needs a name. Pick something you'll be comfortable saying every day. This name is used in SOUL.md, CLAUDE.md, and throughout the framework.

**The framework name** — the operational system (captures, indexes, person files, the whole workspace) needs a name. The default is **"the Matrix"**. You can keep it or pick your own. This name is used in AGENTS.md headers, documentation, and conversational references. It gives the system identity beyond "the files."

Both names are chosen during the Discovery phase and used consistently throughout all generated files.

---

## Evolution

The system is designed to evolve:

- **Week 1:** The assistant learns your people, projects, and patterns. Expect lots of corrections.
- **Month 1:** The assistant has useful institutional memory. Classifications are mostly right. Briefings are genuinely helpful.
- **Month 3+:** The assistant knows things you've forgotten. It catches commitments you didn't realize you made. It flags problems before they become crises.

The captures accumulate. The memory deepens. The person files get richer. The system becomes more valuable the longer you use it — not because the AI gets smarter, but because the workspace gets smarter.

---

_This is a reference document. You don't need to memorize it. Your AGENTS.md file will contain all the operational rules your assistant needs._

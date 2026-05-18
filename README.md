# Rocky Builder Kit

**Build your own persistent AI assistant — tailored to your role, your tools, and your brain.**

---

## What is a "Rocky"?

Rocky is a personal AI assistant framework. Not a chatbot. Not a prompt template. It's an operational system that gives an AI:

- **Identity** — personality, communication style, boundaries
- **Memory** — persistent knowledge that survives across sessions
- **A capture framework** — a system for catching commitments, decisions, tasks, questions, and context so nothing falls through the cracks
- **Your profile** — who you are, what you do, how you work, what tools you use
- **Operational procedures** — how to triage email, track projects, manage people, report status

The result is an AI that knows you, remembers what happened last week, and proactively keeps your world organized.

---

## Who is this for?

Anyone who wants a persistent AI assistant. You don't need to be technical. You don't need to be a manager. The framework adapts to:

- **Engineers** tracking code reviews, sprint work, blockers, and decisions
- **Project managers** tracking deliverables, stakeholder commitments, and timelines
- **Designers** tracking feedback, revision cycles, and client approvals
- **Sales people** tracking leads, follow-ups, and deal commitments
- **Executives** tracking decisions, delegation, and organizational signals
- **Anyone** who loses track of things they said they'd do

The capture framework scales from "I just need to track my own tasks" to "I manage 30 people across multiple organizations."

---

## How to Build Yours

Two paths: **full build** (thorough, 45-90 min) or **quick start** (faster, 20-30 min).

### Quick Start (`quick-start.md`)
One prompt, one conversation, one result. The AI interviews you, designs your system, and generates all files in a single session. Produces a solid starting point — you can upgrade later. **Best for:** people who want to try it before committing to the full process.

### Full Build (Three Phases)
Each phase has a prompt you paste into Claude (or your preferred AI). Work through them in order.

**Phase 1: Discovery** (`01-discovery.md`)
An interview prompt. The AI asks you questions about who you are, what you do, what frustrates you, how you communicate. It then proposes how the six capture categories should be weighted for your role — with concrete examples from your actual work. Takes 15-30 minutes. The output is a discovery document that feeds into Phase 2.

**Phase 2: Architecture** (`02-architect.md`)
A design prompt. Feed it your discovery document. It designs your system — category weights, custom fields, classification triggers, urgency rules, integrations, reporting cadence, autonomy boundaries. You review and adjust. The output is a system design document.

**Phase 3: Assembly** (`03-assembler.md`)
A generation prompt. Feed it your system design. It produces all the workspace files — your SOUL.md, USER.md, AGENTS.md, SCHEMAS.md, MEMORY.md, CLAUDE.md, TOOLS.md, and the initial directory structure. Copy them into your workspace and you're live.

### Getting Started
- `day-one-walkthrough.md` — What your first session looks like step by step. What to say, what to expect, how to correct mistakes, what "good" looks like after an hour.
- `example-conversations.md` — Real examples of common interactions: getting briefings, creating captures, correcting classifications, managing projects, triaging email, and more. Learn by example.

### Reference
- `architecture.md` — How the system works (detailed technical reference)
- `categories-guide.md` — Deep dive into all six capture categories with real examples by role, custom field options, classification triggers, and guidance on how categories combine
- `role-playbook.md` — Role-specific adaptations and examples for Engineers, PMs, Designers, Sales, Managers, and Executives
- `templates/` — Skeleton files you can fill in directly (manual assembly)

### Equipping Your Assistant
Your assistant is only as capable as the tools available in its environment:
- `tools-reference.md` — CLI utilities organized by priority tier, with install commands for macOS, Windows, and Linux. Covers package managers (Homebrew, Scoop, Chocolatey, winget, apt), data processing, search, git tools, cloud CLIs, database clients, and more. Includes quick-install scripts.
- `mcp-reference.md` — MCP servers that give your assistant native access to Gmail, Slack, Google Calendar, Jira, databases, browsers, and more. Also covers zero-config built-in connectors for Claude Desktop users.
- `skills-reference.md` — Claude Skills: how to use existing skills, how to build your own, and how skills fit into your assistant framework.

### Ongoing Care
- `maintenance-guide.md` — Weekly, monthly, and quarterly maintenance routines. How to keep your system healthy, signs it needs attention, when to restructure vs. just maintain. Includes a printable checklist.
- `troubleshooting.md` — Common problems and fixes. Classification issues, memory problems, index drift, triage tuning, performance signal questions. Check here before reaching out for help.

---

## What You'll Need

1. **An AI with file access** — Claude Code, Cursor, or similar. The assistant needs to read/write files in a workspace directory.
2. **A workspace directory** — A folder on your machine (or a git repo) where your assistant's files will live.
3. **30-60 minutes** — For the full three-phase build.
4. **Honesty** — The discovery interview only works if you're real about how you work, what you forget, and what frustrates you. Your assistant is only as good as the profile you give it.
5. **Two names** — You'll need to name your assistant (it has a personality, it gets a name — "Rocky" is taken) and name your operational framework (the default is "the Matrix" — you can keep it or pick your own). Phase 1 will ask for both before anything else.

---

## Principles

These are the design principles behind the framework. Your Rocky should embody all of them.

1. **Act, don't ask** — for internal organization (reading, capturing, filing). Ask before external actions (sending messages, scheduling meetings).
2. **Capture by default** — it's easier to close a capture than reconstruct one you missed.
3. **Consistency enables search** — every file follows a schema. No freeform notes floating around.
4. **Memory is files** — your Rocky wakes up fresh every session. Its workspace IS its memory. No magic.
5. **Adapt to the human** — the framework bends to fit the person, not the other way around.
6. **Surface problems** — a good assistant tells you what's going wrong, not just what you asked about.
7. **Earn trust through competence** — the assistant has access to your professional life. It should act like it deserves that access.

---

## When You Get Stuck

Every instance of this framework has a built-in escalation path: **flag it for review, then update the framework to handle it next time.**

This isn't tech support. It's asking the people who designed the thing. They want to hear what's working and what's not.

---

## After You Build

Your assistant will improve over time as it:
- Learns your patterns and preferences (MEMORY.md)
- Accumulates institutional knowledge (capture files)
- Gets corrected and adjusts (feedback loop)
- Develops its personality through use

The first week will be rough. Let it make mistakes. Correct it. It gets better. By week three, you'll wonder how you worked without it.

---

_MIT licensed. Use it, fork it, change it._

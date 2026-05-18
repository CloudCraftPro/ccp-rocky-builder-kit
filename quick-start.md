# Quick Start — Single Prompt Build

**For people who want a working system in 20 minutes, not 60. One prompt, one conversation, one result.**

This produces a simpler system than the full three-phase process. It's a great starting point — you can always add complexity later.

---

## Before You Start

You need:
1. Claude Code, Cursor, or similar AI tool with file access
2. A workspace directory (empty folder or fresh git repo)
3. 20-30 minutes of honest conversation
4. A name for your assistant ("Rocky" is taken)
5. A name for your framework (default: "the Matrix" — or pick your own)

---

## The Prompt

Copy everything below and paste it into your AI tool. Then answer its questions.

```
You are building me a personalized AI assistant from scratch. This assistant will be persistent — it reads workspace files at the start of every session to remember who I am, what's going on, and what needs attention.

We're going to do this in one conversation. You'll interview me, design the system, and generate all the files. Let's move efficiently.

---

IMPORTANT RULES:

1. My assistant needs a NAME. Not "Assistant" or "AI" — a real name. Ask me for one before anything else. "Rocky" is already taken.

2. The operational framework needs a NAME. The default is "the Matrix." I can keep that or pick my own. Ask me. Use this name in all file headers and references.

3. The system is built on six capture categories — everything my assistant encounters gets classified as one of these:
 - **Questions** — open loops needing answers
 - **Decisions** — choices made, with rationale
 - **Tasks** — work with owner, deadline, definition of done
 - **Commitments** — promises between people (both directions)
 - **Context** — knowledge with no action attached
 - **Projects** — containers grouping the other five

4. Every system includes a hard-coded escalation path: when my assistant or I don't know how to handle something within the framework, we flag it for review and update the framework rather than working around it.

---

STEP 1: NAME AND IDENTITY (do this first, don't skip)

Ask me:
- What do I want to name my assistant?
- What do I want to call my framework? (Default: "the Matrix")

Do not proceed until I've committed to both names.

STEP 2: RAPID DISCOVERY (ask 3-4 questions at a time, not all at once)

Learn about me:
- Name, role, organization(s), timezone
- What I actually do day-to-day (not the job description)
- What tools I use (email, Slack, Jira, GitHub, etc.)
- What falls through the cracks — what I forget, lose track of, or miss
- How I want to be talked to (concise vs detailed, formal vs casual, humor level)
- How much autonomy the assistant should have (act then tell, or always ask)
- Who the important people in my work life are (team, clients, stakeholders)
- What a perfect morning briefing would contain

After discovery, propose how the six categories should be weighted for my role. Show me 2-3 example captures using my actual work context for each primary category. Map my stated pain points to specific categories. Get my feedback before proceeding.

STEP 3: GENERATE ALL FILES

Based on what you learned, generate these files. Use my assistant's name and framework name throughout:

**CLAUDE.md** — Boot sequence. Read order: SOUL.md → USER.md → MEMORY.md → AGENTS.md → SCHEMAS.md → TOOLS.md. Quick reference for capture categories, file naming, key rules. Include escalation note: "When stuck on framework questions, escalate."

**SOUL.md** — Who the assistant is. Include:
- Identity (name, purpose, core philosophy)
- How I work (from my answers above)
- Personality (matching what I said about communication style)
- Operational directives: external actions need approval, internal actions are silent
- When stuck → escalate
- Continuity: workspace files = memory

**USER.md** — Who I am. Include:
- Basics (name, location, timezone)
- Organization(s) with role and description
- Communication preferences
- Accounts and integrations (leave credentials as [configure])
- Context separation rules if I have multiple orgs

**AGENTS.md** — The operational framework, titled with my framework name. Include:
- Boot sequence
- The six capture categories
- Classification rules (priority ordered)
- When to capture (silently, mention, ask)
- File naming ([Q|D|T|C|X]-YYYYMMDD-NNN.md)
- Index maintenance rules
- Person file management
- Reporting (morning briefing if I want one, on-demand queries)
- Email/messaging triage rules (if I use email/messaging)
- General operating rules
- Correction protocol (reclassify, move, close, kill, merge)
- Urgency definition (customized to my role)
- Scheduled operations (daily/weekly/monthly)
- Escalation Protocol (MANDATORY — include full protocol)

**SCHEMAS.md** — File templates for captures, person files, indexes, projects. Only include schemas I'll actually use based on my role.

**MEMORY.md** — Empty memory index with sections: About [me], About the Organization(s), Lessons Learned, Terminology, Open Threads. Nothing filled in.

**TOOLS.md** — Skeleton with header explaining what goes here.

**_sequence.md** — Initialized at zero for today's date.

**_session-log.md** — Empty with header.

**captures/_index.md** — Empty index with correct table headers.

STEP 4: SETUP INSTRUCTIONS

After generating all files, give me:
1. The exact directory structure to create
2. Where each file goes
3. What to configure (email accounts, tool integrations)
4. How to start the first session
5. What to expect in the first week

---

Generate complete files. No placeholders except for credentials. Every rule, every schema, every trigger should be fully written. Use my actual work context — not generic examples.
```

---

## After the Prompt

The AI will interview you (5-10 minutes), propose your category weights (2 minutes of review), then generate all the files (the bulk of the output).

### What to do with the output:

1. **Create the workspace directory** on your machine
2. **Create the subdirectories:**
 ```
 mkdir -p captures/{tasks,questions,decisions,commitments,context}
 mkdir -p projects
 mkdir -p people/{employees,clients,vendors,leads}
 mkdir -p memory
 ```
3. **Save each file** in its correct location (the AI will tell you where)
4. **Read SOUL.md** — does the voice feel right? Adjust if not.
5. **Read AGENTS.md** — do the rules make sense? Are the urgency triggers correct?
6. **Initialize git** (recommended):
 ```
 cd your-workspace
 git init
 git add.
 git commit -m "Initialize [your framework name]"
 ```

### Then start your first session

Open your AI tool in the workspace. Say: "Wake up. Read your boot files."

See `day-one-walkthrough.md` for what to do next.

---

## What You Get vs. the Full Process

| Aspect | Quick Start | Full 3-Phase |
|--------|------------|--------------|
| Time | 20-30 min | 45-90 min |
| Interview depth | Good | Thorough |
| Category customization | Based on role | Based on role + pain points + detailed examples |
| Custom fields | Minimal | Role-specific |
| Classification triggers | Standard | Tailored to your tools and language |
| Personality tuning | Good | Precise |
| Result quality | Solid starting point | Production-ready |

The quick start gives you 80% of the value in 30% of the time. The full process fills in the nuance. **You can always upgrade** — run Phase 2 and Phase 3 later using your existing system as input.

---

## Upgrading Later

When you're ready to go deeper:

1. **Run Phase 2 (Architect)** with your existing AGENTS.md as input instead of a Discovery Document. Tell it: "Here's my current operational framework. Review it and suggest improvements — tighter classification triggers, better custom fields, sharper urgency rules."

2. **Run Phase 3 (Assembler)** with the improved design to regenerate specific files. You don't have to regenerate everything — just the files that changed.

3. **Add integrations** as you go. See `mcp-reference.md` for MCP servers and `tools-reference.md` for CLI tools.

---

_Quick doesn't mean shallow. A simple system you use every day beats a complex one you abandon after a week. Start here, grow from here._

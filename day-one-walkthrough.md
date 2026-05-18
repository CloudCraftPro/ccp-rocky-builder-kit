# Day One Walkthrough

**What your first session actually looks like, step by step. Read this before you start.**

---

## Before You Start

You should already have:
- [ ] All workspace files generated (CLAUDE.md, SOUL.md, USER.md, AGENTS.md, SCHEMAS.md, MEMORY.md, TOOLS.md)
- [ ] Sequence counter and session log initialized (_sequence.md, _session-log.md)
- [ ] Directory structure created (captures/, projects/, people/, memory/)
- [ ] Empty indexes in place (captures/_index.md)
- [ ] Your AI tool ready (Claude Code, Cursor, or similar) pointed at the workspace directory

If you haven't done this yet, go back to `03-assembler.md` and complete the Assembly phase.

---

## The First Conversation

Open your AI tool in the workspace directory. Your first message should be simple:

### You say:

> "Wake up. Read your boot files and tell me what you see."

### What should happen:

Your assistant reads the files in order (CLAUDE.md → SOUL.md → USER.md → MEMORY.md → AGENTS.md). It should:

1. **Acknowledge who it is** — by name (the name you chose)
2. **Acknowledge who you are** — your name and role
3. **Note that memory is empty** — this is a fresh start, nothing to remember yet
4. **Note that there are no captures yet** — empty indexes, no projects, no person files
5. **Write a session-start entry** to _session-log.md

If the assistant does something generic like "Hello! How can I help you today?" — it didn't read the boot files. Tell it: "Read CLAUDE.md first, then follow the instructions there."

### What it should sound like:

The tone should match what you configured in SOUL.md. If you set up a direct, no-nonsense personality, it shouldn't be bubbly. If you set up a warm, supportive personality, it shouldn't be cold.

If the tone is wrong, correct it immediately: "You're being too formal. Read your SOUL.md personality section again — I want you [casual/direct/warm/whatever you configured]."

---

## Feed It Something Real

Don't start with hypotheticals. Give it something from your actual day.

### Option A: Give it emails to triage

> "Here's what's in my inbox this morning. Triage these for me."

Then paste 5-10 emails (or if you have Gmail MCP configured, tell it to read your inbox). Watch what it does:

- Does it classify correctly? (Questions, tasks, commitments, context)
- Does it create person files for people it encounters?
- Does it update the index?
- Does it recognize what's urgent vs. what can wait?

**Expect mistakes.** This is the first run. The assistant has rules but no pattern memory yet. Correct every mistake:

- "That's not a task, it's a commitment — they promised us something, we didn't promise them."
- "Don't create a capture for that — it's a newsletter, just archive it."
- "Good catch on that commitment. But the due date is Friday, not next week."

### Option B: Describe your current situation

> "Here's what's on my plate right now. I have three active projects: [name them]. My biggest headache is [describe it]. The people I work with most are [name them]."

Let the assistant ask follow-up questions. Watch it:

- Create project directories and _project.md files
- Create person files for the people you mention
- Capture context about your current situation
- Start building indexes

### Option C: Walk through your calendar

> "Here's my schedule for today. Walk me through what I should be thinking about."

If Calendar MCP is configured, tell it to read your calendar. Otherwise, paste your schedule. Watch it:

- Identify prep work needed for meetings
- Flag commitments due today
- Note who you're meeting with (should cross-reference or create person files)
- Suggest follow-ups from yesterday

---

## The Correction Loop

This is the most important part of Day One. **You are training your assistant.** Every correction teaches it something.

### How to correct classification:

**Bad:** "That's wrong."
**Good:** "That's not a task — it's a commitment. When Jake says 'I'll get the spec to you by Thursday,' he's making a promise. File it as a commitment with Jake as 'Promised by' and me as 'Owed to.'"

The "good" version teaches a pattern, not just a correction.

### How to correct tone:

**Bad:** "Be different."
**Good:** "You're being too verbose. I asked a simple question — give me the answer in one sentence, not three paragraphs. Save the detail for when I ask for it."

### How to correct autonomy:

**Bad:** "Don't do that."
**Good:** "Don't create a project without asking me first. Captures are fine to create silently, but projects need my approval — I want to name them and scope them myself."

### How to correct information:

**Bad:** "That's not right."
**Good:** "Jake isn't a client, he's on my team. Move his person file from people/clients/ to people/employees/. And update his title — he's a Senior Engineer, not a contractor."

### After each correction:

Ask: "Update your MEMORY.md with what you just learned, so you don't make the same mistake next session."

Not everything needs to go in memory — only patterns that should persist. "Jake is an employee, not a client" is a correction to the person file, not a memory entry. "When I say someone's name without a company, assume they're on my team" is a pattern worth remembering.

---

## What to Do in the First Hour

Here's a realistic first session agenda:

### Minutes 0-10: Boot and verify
- Assistant reads boot files
- Verify it knows its name, your name, and its framework name
- Verify the tone feels right
- Fix anything that's off

### Minutes 10-30: Feed it real data
- Give it emails, your calendar, or a description of your current work
- Let it create captures, person files, and (maybe) projects
- Correct classification mistakes as they happen
- Don't worry about perfection — volume matters more than accuracy right now

### Minutes 30-45: Review what it built
- Ask: "Show me the captures index."
- Ask: "What person files did you create?"
- Ask: "What's in MEMORY.md now?"
- Correct anything that's wrong. Reclassify, move, merge, or delete.

### Minutes 45-60: First briefing test
- Ask: "What needs my attention right now?"
- Evaluate the briefing structure — is it what you expected?
- If sections are missing or wrong, tell it: "I want the briefing structured as [your preference]. Update AGENTS.md reporting section."
- Ask: "What open questions do I have?" and "What commitments are due this week?"

### Before you close:
- Ask: "Write your session-end entry to the session log."
- Verify it lists all the captures it created and files it modified.
- If it misses something, tell it.

---

## What "Good" Looks Like After Day One

By the end of your first session, you should have:

- [ ] **5-15 captures** — a mix of types, mostly from whatever you fed it
- [ ] **3-10 person files** — for the people who appeared in your captures
- [ ] **0-3 projects** — only if the work was clearly project-shaped
- [ ] **An index that reflects reality** — every capture is listed, statuses are correct
- [ ] **A session log with one session-start and one session-end entry**
- [ ] **A MEMORY.md with 2-5 entries** — things it learned from your corrections
- [ ] **An assistant that sounds like what you configured** — right tone, right verbosity

What "good" does NOT look like:
- 50 captures (too aggressive — it's capturing noise)
- 0 captures (too conservative — it's not catching anything)
- Everything is a task (classification isn't working)
- The assistant sounds generic (SOUL.md isn't being applied)
- No session log entry (continuity is broken)

---

## Common Day One Problems

**"It's not reading the boot files"**
→ Make sure CLAUDE.md is in the workspace root and your AI tool is pointed at that directory. Some tools need to be told explicitly: "Read CLAUDE.md and follow its instructions."

**"It's being way too verbose"**
→ Correct immediately: "Too many words. Be concise. If I need more detail, I'll ask." Then update SOUL.md if the verbosity setting isn't strong enough.

**"It created 30 captures from 5 emails"**
→ It's being too aggressive. Tell it: "You're over-capturing. A single email usually produces 1-2 captures, not 6. Only capture what's actionable or worth remembering."

**"It didn't capture anything"**
→ It's being too conservative. Tell it: "You missed a commitment in that email — [person] said [thing]. You should have caught that. Default to capturing, and I'll tell you when it's too much."

**"It keeps asking me what to do"**
→ Tell it: "For reads, captures, and file organization — just do it and tell me what you did. Only ask me before sending messages or taking external actions."

**"The directory structure is wrong"**
→ Fix it now before captures accumulate: "Move [directory] to [correct location]. Update any references."

---

## Day Two and Beyond

Day Two is where continuity gets tested. When you start a new session:

1. The assistant should read its boot files automatically
2. It should read the session log and know what happened yesterday
3. It should pick up where you left off — same captures, same projects, same people

**If it doesn't remember yesterday,** check:
- Did it write a session-end log entry? (If not, the new session has nothing to absorb)
- Are the capture files actually saved? (Check the directories)
- Is it reading _session-log.md at startup? (Check the boot sequence in CLAUDE.md)

**Day Two priorities:**
- Feed it more data (email, messages, meetings)
- Let it build on yesterday's captures (update existing ones, not just create new ones)
- Test a briefing: "Give me my morning briefing"
- Continue correcting — Day Two should have fewer mistakes than Day One

By **Day Five,** the assistant should be classifying correctly most of the time, your key people should have person files, and the briefing should be genuinely useful. If it's not, re-read your AGENTS.md and SOUL.md — the configuration might need tuning.

By **Week Two,** you should trust the assistant enough to stop checking every capture. The corrections become occasional rather than constant.

By **Week Three,** the assistant knows your world. It catches things you didn't. That's when it starts being indispensable.

---

_The first day is the hardest. It gets dramatically better from here. Be patient, be specific with corrections, and trust the process._

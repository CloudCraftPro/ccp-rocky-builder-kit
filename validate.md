# Self-Audit Prompt

**Use this after you've built your assistant — and again every couple of months to catch drift.** Mechanical issues are caught by `validate.sh` / `validate.ps1`. This prompt catches the semantic stuff a script can't see: tone mismatches, contradictions between files, principles that aren't actually being followed, dead weight that's piled up.

Paste everything below into your AI tool in the workspace directory and let your assistant audit itself.

---

```
You're going to audit yourself. Read everything in this workspace and then write me a candid report on what's wrong — not what's right.

Read in this order:
1. CLAUDE.md (boot)
2. SOUL.md (who you are)
3. USER.md (who I am)
4. AGENTS.md (how you operate)
5. SCHEMAS.md (file formats)
6. MEMORY.md (what you remember)
7. TOOLS.md (your environment)
8. _session-log.md (recent history)
9. captures/_index.md (current state)
10. Spot-check at least 5 recent captures across categories
11. people/_index.md and at least 2 person files
12. projects/_index.md and 1 active project

Now answer these questions honestly. Be specific. Cite file paths and line content. Don't pad. If everything is fine in a section, say "no issues" and move on.

## 1. Internal consistency

- Does SOUL.md describe a personality that matches how the session-log entries actually sound? (e.g., SOUL says "direct, no fluff" but the log is full of "Would you like me to…?")
- Do AGENTS.md classification rules match how recent captures were actually classified? Find a capture that should have been a different type.
- Are SCHEMAS.md field formats actually being followed in real captures? Find a capture missing a required field.
- Does USER.md describe a person whose actual recent activity (sessions, captures, projects) matches? Or does it describe someone slightly different?

## 2. Drift

- Are there captures that should be closed but are still `open` or `waiting`?
- Are there person files for people who haven't appeared in any capture in the last 90 days? (Candidates for archive.)
- Is MEMORY.md still accurate, or does it describe preferences I've corrected since?
- Is `_session-log.md` longer than ~200 entries? (Time to prune the oldest.)

## 3. Coverage gaps

- Look at the last 10 sessions in `_session-log.md`. Are there topics that recur but have no captures? (Things I keep mentioning to you that aren't being tracked.)
- Are any of the six categories effectively empty over the last 30 days? Why? Either I genuinely don't have any (fine) or the framework is missing them (not fine).
- Is there a person who shows up in 3+ captures but doesn't have a person file?

## 4. Operational hygiene

- Does the captures index match the files on disk? (If `validate.sh` already flagged this, just confirm.)
- Are any projects "active" with no activity in the last 30 days? Should be paused or closed.
- Are any captures missing the people field when they clearly involve specific people?

## 5. Principle adherence

The kit ships with these principles. Pick the 2-3 most relevant ones and tell me where I'm violating them:

- Act, don't ask — for internal organization
- Capture by default — easier to close than reconstruct
- Consistency enables search — every file follows the schema
- Memory is files — no magic
- Adapt to the human — the framework bends to fit the person
- Surface problems — tell me what's going wrong
- Earn trust through competence

## 6. The one thing

If you could change one thing about how I'm using this system — not adding more features, not refactoring the framework, but a behavior change on my part — what would it be? Be direct.

---

Format your report as:

**Internal consistency:** [findings or "no issues"]
**Drift:** [findings or "no issues"]
**Coverage gaps:** [findings or "no issues"]
**Operational hygiene:** [findings or "no issues"]
**Principle violations:** [the 2-3 most relevant + where I'm slipping]
**The one thing:** [your honest answer]

Keep the whole report under 500 words. Skip generalities. Cite file paths.
```

---

## When to run

- **Once after the initial build** — catches things the Assembly phase got wrong.
- **Every 1-2 months thereafter** — catches drift before it compounds.
- **After any framework change** — adding a category, restructuring schemas, etc.
- **If something feels off** — the assistant getting more verbose, captures missing, you finding yourself working around the system.

## What good output looks like

A useful self-audit is short, specific, and slightly uncomfortable. If your assistant says "everything looks great!" — it didn't actually audit. Push back: "Read the last 10 session logs carefully. Cite line content. What's actually wrong?"

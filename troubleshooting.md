# Troubleshooting & FAQ

**Common problems, why they happen, and how to fix them. Check here before escalating.**

---

## Classification Problems

### "My assistant keeps misclassifying things"

**Symptom:** Tasks are being filed as context. Commitments are being filed as tasks. Things end up in the wrong category regularly.

**Why it happens:** Your classification triggers in AGENTS.md are too vague, or your assistant hasn't learned your patterns yet. The first two weeks are the worst.

**Fix:**
1. Correct it every time, out loud: "That's not a context, it's a commitment — Sarah promised to deliver the mockups by Friday."
2. Be specific about WHY: "When someone says 'I'll have that to you by [date],' that's always a commitment, not a task."
3. After 5+ corrections of the same type, update AGENTS.md directly. Add the pattern to your classification triggers section so it persists across sessions.
4. Check your category weights — if commitments are weighted "minimal" but you're generating a lot of them, the weight is wrong. Bump it up.

**When to escalate:** If you can't figure out which category something belongs in even after reading the classification rules. That might be a framework gap, not a training problem.

### "Everything is becoming a task"

**Symptom:** Your assistant files almost everything as a task. Decisions, commitments, and questions are rare or absent.

**Why it happens:** Tasks are the most obvious category. If the classification triggers for other categories aren't specific enough, the assistant defaults to "someone needs to do something = task."

**Fix:**
1. Remind your assistant of the classification priority order: Commitment > Task > Decision > Question > Context
2. Ask: "Before you file that as a task, is there a promise in there? Did someone commit to something?" Train it to check for commitments first.
3. Audit your last 20 captures. Reclassify the ones that are wrong. The assistant learns from corrections.

### "I'm getting duplicate captures"

**Symptom:** The same commitment or task appears multiple times, often from different sources (email thread + Slack message about the same thing).

**Why it happens:** Deduplication relies on matching people + content + timeframe. If the wording is different enough across sources, the assistant treats them as separate.

**Fix:**
1. Merge them: "Merge T-20260326-003 into T-20260325-001 — they're the same task."
2. Tell the assistant to check the index before creating: "Before you create a new capture for [topic], check if we already have one."
3. If it's a recurring problem with a specific source (e.g., email threads that also appear in Slack), add a note to your AGENTS.md triage section: "When the same topic appears in both email and Slack, update the existing capture — don't create a new one."

---

## Memory and Continuity Problems

### "My assistant forgot what we talked about yesterday"

**Symptom:** The assistant doesn't remember conversations, decisions, or context from previous sessions.

**Why it happens:** Your assistant wakes up fresh every session. It only knows what's in the workspace files. If something wasn't captured to a file, it doesn't exist next session.

**Fix:**
1. This is working as designed. The workspace IS the memory. If something matters, it needs to be a capture, a memory entry, or a note in a person file.
2. If you told the assistant something important and it's gone, create the capture now: "Capture this as context: [the thing you told it]."
3. For preferences and patterns, update MEMORY.md: "Remember that I prefer weekly summaries on Monday mornings, not Sundays."
4. Check that your assistant is writing session-end entries to `_session-log.md`. If it's not, the next session has no record of what happened.

### "My assistant's personality reset"

**Symptom:** The assistant is being generic, overly formal, or not matching the tone you configured.

**Why it happens:** SOUL.md isn't being read at startup, or a new session started without the full boot sequence.

**Fix:**
1. Ask: "Did you read SOUL.md at the start of this session?" If not, tell it to read the boot files.
2. Check that CLAUDE.md lists the correct read order and that all files exist.
3. If the personality is consistently off, the SOUL.md itself might need tuning. Read it and adjust the personality section.

### "MEMORY.md is getting huge"

**Symptom:** Memory file is past 300 lines, or it's full of stale/irrelevant entries.

**Why it happens:** Entries are added but rarely pruned. The monthly maintenance cycle isn't running.

**Fix:**
1. Read through MEMORY.md and delete anything that's no longer true or useful.
2. Archive older entries to `memory-archive/YYYY-MM.md`.
3. Check if your scheduled operations include the monthly prune. If not, add it to AGENTS.md.
4. Ask your assistant: "Review MEMORY.md and flag anything that looks stale or redundant."

---

## Index and Organization Problems

### "I have too many orphan captures"

**Symptom:** The `captures/` directory is full of items that don't belong to any project.

**Why it happens:** Captures were created before a project existed, or the assistant couldn't determine which project they belong to.

**Fix:**
1. This is normal early on. Orphans are fine — they're captured, which is what matters.
2. Periodically review orphans: "Show me all orphan captures and suggest which projects they might belong to."
3. Move them: "Move T-20260320-001 to the acme-redesign project."
4. Create projects as patterns emerge: "These 8 orphan captures are all about the platform migration. Create a project for it."

### "My indexes are out of sync"

**Symptom:** A capture exists but isn't in the index, or the index shows a status that doesn't match the file.

**Why it happens:** The assistant updated a capture file but forgot to update the index (or vice versa). This happens more when corrections are made rapidly.

**Fix:**
1. Tell the assistant: "Rebuild the index for [project] from the actual files." It will scan all capture files in the directory and regenerate the index.
2. For a single entry: "Update the index — T-20260322-001 is now closed, but the index still shows it as open."
3. To prevent it: Remind the assistant that index updates are part of every capture action. "When you update a capture, always update the index in the same action."

### "I don't know what projects to create"

**Symptom:** You're not sure when something deserves its own project vs. staying as orphan captures.

**Why it happens:** Projects are containers, and it's not always obvious when a body of work deserves one.

**Rule of thumb:**
- **3+ captures** about the same body of work → probably a project
- **Named initiative** with a timeline → definitely a project
- **Client engagement** with deliverables → project
- **One-off task** → not a project, just an orphan task
- **Recurring process** (like monthly reporting) → could go either way. If it generates captures regularly, make it a project.

When in doubt, don't create a project. Orphans are fine. You can always organize later.

---

## Triage Problems

### "Email triage is too slow"

**Symptom:** Processing email takes forever because the assistant reads every message carefully.

**Why it happens:** The assistant is being thorough, which is good for accuracy but bad for volume.

**Fix:**
1. Add a scan-then-plan rule to your AGENTS.md: "For email triage, scan all messages first to identify patterns, then process in batches by type."
2. Define auto-archive rules: newsletters, automated notifications, receipts — things that can be labeled and archived without reading.
3. Batch similar emails: "Process all the Jira notification emails together, then all the client emails."
4. Set a time box: "Triage should take no more than 15 minutes for a typical day's email."

### "My assistant is capturing too much from email/Slack"

**Symptom:** Every message generates a capture. Noise is drowning out signal.

**Why it happens:** The "default to capturing" rule is being applied too aggressively to high-volume channels.

**Fix:**
1. Tighten the signal-vs-noise rules in your messaging triage section: "Skip reactions, acknowledgments, social chatter, routine status updates."
2. Add explicit skip rules: "Don't capture Jira notification emails — we track those through the Jira integration directly."
3. For Slack: "Only capture from DMs and the #decisions channel. Monitor #general but only capture if someone tags me or makes a commitment."

### "My assistant is capturing too little"

**Symptom:** Important things are slipping through because the assistant isn't recognizing them as captures.

**Why it happens:** Classification triggers are too narrow, or the assistant is being too conservative about what to capture.

**Fix:**
1. When something slips, tell the assistant: "That was a commitment — you should have caught that. When [person] says [pattern], always capture it."
2. Loosen the confidence threshold temporarily: "For the next week, capture anything that might be a commitment or task, even if you're not sure. We'll prune later."
3. Check the "When to Capture" section in AGENTS.md. If the "ask first" zone is too wide, narrow it.

---

## People and Relationship Problems

### "Person files are empty or useless"

**Symptom:** Person files exist but only have the header fields — no working style, no relationship notes, no active items.

**Why it happens:** Person files need to be actively maintained. They don't fill themselves from captures alone.

**Fix:**
1. After meaningful interactions, tell your assistant: "Update [person]'s file — add to working style that they prefer async communication and get frustrated by unscheduled calls."
2. The active items section SHOULD update automatically when captures reference that person. If it's not happening, remind the assistant: "When you create a capture involving [person], update their active items."
3. Don't expect person files to be rich on day one. They accumulate over weeks and months.

### "Too many person files for people who don't matter"

**Symptom:** The assistant created person files for every name it encountered, including one-off email contacts.

**Why it happens:** Auto-creation is aggressive by default.

**Fix:**
1. Add a threshold to AGENTS.md: "Only create person files for people who appear in 2+ captures, or who I identify as important."
2. Delete the ones that don't matter: "Delete the person file for [name] — they're a one-time vendor contact."
3. Adjust auto-creation rules: "Ask before creating person files for people outside [your org]."

---

## Performance Signal Problems

### "Performance signals say 'insufficient data'"

**Symptom:** You're trying to see how someone is doing, but the signals don't have enough data points.

**Why it happens:** Signals require minimum data thresholds (3 data points per metric in a 90-day window). If captures involving that person are sparse, there's not enough to compute meaningful signals.

**Fix:**
1. This is working as designed. Bad data is worse than no data. Wait until there are enough captures.
2. You can still check qualitatively: "Show me all captures involving [person] in the last 90 days" — read them manually.
3. If you need signals faster, be more aggressive about capturing commitments and tasks involving that person.

### "Performance signals seem wrong"

**Symptom:** The numbers don't match your perception of how someone is doing.

**Why it happens:** Signals are computed from captures, which may not be complete. If you only capture the commitments someone breaks (not the ones they keep), the hit rate will be artificially low.

**Fix:**
1. Check capture completeness: "How many commitments do we have for [person] in the last 90 days?" If it's only 3-4, the sample is too small.
2. Capture the positive too: When someone delivers on time, make sure it's captured and the commitment is marked fulfilled. Don't just track failures.
3. Add narrative context to the person file's Performance Signals notes: "Hit rate looks low, but 2 of the 3 'late' commitments were blocked by the client, not by Jake."

---

## System and Environment Problems

### "My assistant can't access [tool/service]"

**Symptom:** The assistant says it can't read email, access Slack, query the database, etc.

**Why it happens:** The MCP server isn't configured, isn't running, or the credentials are wrong.

**Fix:**
1. Check `.mcp.json` — is the server listed? Are the credentials correct?
2. Check if the MCP server process is running. Some need to be started manually.
3. See `mcp-reference.md` for setup instructions for your specific integration.
4. Try the CLI tool directly (e.g., `gh auth status`, `gcloud auth list`) to verify credentials outside of MCP.

### "My assistant is slow"

**Symptom:** Responses take a long time, especially for operations that scan multiple files.

**Why it happens:** Too many files to scan, large indexes, or too many MCP servers configured.

**Fix:**
1. Check your index sizes. If an index has 100+ open items, that's a lot. Close stale items.
2. Reduce the number of MCP servers to only what you actively use.
3. Make sure your assistant is reading indexes (fast) instead of scanning every individual file (slow).
4. Archive old captures — they don't need to be in the active directory tree. Move completed projects to an `archive/` directory.

---

## When to escalate

After trying the fixes above, reach out if:

- The framework's rules don't cover your situation (a gap, not a training issue)
- You want to add a capability that isn't documented
- You're hitting the same problem repeatedly despite corrections
- Something feels fundamentally wrong about how the system is structured for your role
- You want to connect your instance with other assistants

**How:** Have your assistant draft the question with: what you tried, what you expected, what happened, what you've already tried to fix. See the Escalation section in your AGENTS.md.

---

_Most problems are training problems, not framework problems. Correct your assistant consistently and it gets better. The system is designed to learn from your corrections — but only if you make them._

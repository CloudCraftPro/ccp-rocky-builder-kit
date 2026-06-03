# Maintenance Guide

**How to keep your system healthy over time. A system that isn't maintained degrades — and a degraded system gets abandoned.**

---

## Why Maintenance Matters

Your framework is a living system. Captures accumulate. Indexes grow. Memory fills up. Context expires. Person files go stale. Without regular maintenance, you end up with:

- Indexes full of closed items that should have been pruned
- Orphan captures that should have been assigned to projects
- Stale context captures that are no longer true
- Memory entries that are outdated or irrelevant
- Person files with incorrect active items
- An assistant that gives you yesterday's information today

None of this is catastrophic. It's all fixable. But it's much easier to maintain a clean system than to clean up a messy one.

---

## Weekly Maintenance (5-10 minutes)

Do this once a week. Pick a consistent day — Sunday evening, Monday morning, Friday afternoon. Doesn't matter when, but make it a habit. You can ask your assistant to do most of it.

### Tell your assistant:

> "Run weekly maintenance."

It should know what to do from AGENTS.md scheduled operations. If it doesn't, walk through this checklist:

**1. Orphan review**
> "Show me all orphan captures. Do any of them belong to a project now?"

Move captures that found a home. Close captures that are no longer relevant. Leave true orphans alone — they're fine.

**2. Stale item check**
> "What's been open for more than 14 days with no updates?"

Items that haven't been touched in two weeks are either forgotten, blocked, or no longer relevant. For each one:
- Still active → update the status or add a note
- Blocked → set to waiting, note what you're waiting on
- Dead → close or cancel it

**3. Index health**
> "Are all indexes up to date? Any mismatches between capture files and their indexes?"

If something's out of sync, fix it now. A quick rebuild takes seconds.

**4. Person file refresh**
> "Are active items on person files current?"

Person files should only show actually-open captures in their Active Items section. Closed items should have been removed when they were closed. If there's drift, clean it up.

**5. Memory review**
> "Anything in MEMORY.md that's no longer true?"

Memory entries have a shelf life. Organizational facts change. Lessons learned get internalized into AGENTS.md rules. Open threads resolve. Prune what's stale.

---

## Monthly Maintenance (15-20 minutes)

Do this on the 1st of each month, or close to it.

### Tell your assistant:

> "Run monthly maintenance."

**1. Index pruning**
> "Remove anything from 'Recently Closed' sections that's older than 30 days."

Closed items stay in indexes for 30 days so you can reference them. After that, they leave the index. (The files stay permanently — only the index entry is removed.)

**2. Memory archiving**
> "Is MEMORY.md over 300 lines? Archive older entries."

Move entries that are rarely referenced or no longer load-bearing to `memory-archive/YYYY-MM.md`. Keep MEMORY.md lean — it's read every session.

**3. Expired context**
> "Close any context captures past their expiration date."

Context captures with an `Expires` field should be reviewed when they expire. Some are truly expired (a budget freeze that ended). Some should have their expiration extended (a client preference that's still true). Close the dead ones, extend the living ones.

**4. Session log pruning**
> "Archive session log entries older than 30 days."

Move old entries to `memory/session-log-archive/YYYY-MM.md`. Keep the active session log manageable.

**5. Project health check**
> "Which projects have had no activity in the last 30 days?"

Projects with no new captures in a month are either complete, on hold, or forgotten:
- Complete → update status to completed, celebrate briefly
- On hold → update status, note why
- Forgotten → either it matters (revive it) or it doesn't (close it)

**6. Framework tuning**
> "What classification mistakes have I corrected more than twice this month?"

If the same correction keeps happening, it's not a training problem — it's a rules problem. Update AGENTS.md with new classification triggers or sharper rules.

---

## Quarterly Maintenance (30 minutes)

Every three months. Think of this as a system health assessment.

### Performance signal recalibration

If you track performance signals:
> "Update all performance signals. Compare current 90-day window to prior 90-day window. Flag any trend changes."

### Framework review

Read your own AGENTS.md. Ask yourself:
- Are the category weights still right? (Maybe you've shifted roles or responsibilities)
- Are the urgency triggers still accurate? (Maybe your definition of urgent has evolved)
- Is the reporting cadence still useful? (Maybe daily briefings are too frequent, or weekly isn't enough)
- Are there patterns your assistant should be catching that it isn't?

Update AGENTS.md based on your answers. This is tuning, not rebuilding.

### SOUL.md check-in

Read your SOUL.md. Does the personality still feel right? Has the assistant evolved in a direction you like? If the tone has drifted from what's written, either update the file to match reality or correct the assistant to match the file.

### Tool and integration review

- Are your MCP servers still working? Test each one.
- Any new tools you've started using that should be integrated?
- Any tools you've stopped using that should be removed?

## Signs Your System Needs Attention

Watch for these symptoms. They mean maintenance is overdue.

| Symptom | What it means | Fix |
|---------|--------------|-----|
| Indexes have 50+ open items | You're not closing things | Close completed items, cancel dead ones |
| Morning briefing is overwhelming | Too much noise, not enough priority | Tighten urgency rules, close stale items |
| Morning briefing is empty | Nothing is being captured | Check triage rules, feed it more data |
| Same corrections keep happening | AGENTS.md rules are too weak | Update classification triggers |
| Person files are all stubs | Not maintaining relationship data | Spend 5 min after key interactions updating notes |
| Orphan captures keep growing | No project structure | Create projects for recurring work streams |
| Memory is full of old entries | Monthly prune isn't happening | Archive stale entries, prune aggressively |
| Context captures are expired | Expiration review isn't happening | Run the monthly context check |
| Assistant asks too many questions | Autonomy rules are too tight | Widen the "do silently" zone in AGENTS.md |
| Assistant does too much silently | Autonomy rules are too loose | Narrow the boundary, add "ask first" items |

---

## When to Restructure (Not Just Maintain)

Maintenance keeps the system clean. Restructuring changes how it works. You should restructure when:

**Your role changed significantly.** New job, new responsibilities, promotion, reorg. Your category weights, urgency rules, and reporting cadence probably need to change. Go back to `02-architect.md` and redesign those sections.

**You outgrew the system.** Started solo, now managing people. Started with one org, now have two. The framework scales, but you need to add performance signals, multi-org rules, or new person file schemas.

**The framework fights you.** If you're constantly working around the rules instead of with them, the rules are wrong. Don't force it — change it.

**You stopped using it.** If you haven't opened the workspace in two weeks, something broke. Either the system is too complex (simplify), the reporting isn't useful (retune), or you lost the habit (recommit or simplify further). The most common reason people stop: the system asks too much of them. The fix is always to simplify.

---

## Maintenance Checklist (Copy This)

Print this or save it somewhere you'll see it.

### Weekly
- [ ] Review orphan captures — move or close
- [ ] Check stale items (>14 days unchanged)
- [ ] Verify index accuracy
- [ ] Update person file active items
- [ ] Quick memory review

### Monthly
- [ ] Prune "Recently Closed" from indexes (>30 days)
- [ ] Archive memory entries (keep under 300 lines)
- [ ] Close expired context captures
- [ ] Prune session log (>30 days)
- [ ] Check dormant projects
- [ ] Review repeated corrections → update AGENTS.md

### Quarterly
- [ ] Recalibrate performance signals
- [ ] Review and tune AGENTS.md (weights, urgency, reporting)
- [ ] Review SOUL.md personality
- [ ] Test integrations and MCP servers

---

_A maintained system is an indispensable tool. An unmaintained system is a pile of files. The difference is 15 minutes a week._

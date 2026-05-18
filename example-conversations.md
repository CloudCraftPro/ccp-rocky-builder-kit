# Example Conversations

**How to talk to your assistant effectively. Real examples of common interactions, corrections, and commands.**

These examples assume an assistant named "Max" with a framework called "the Grid." Substitute your own names.

---

## Starting a Session

### Good start:
```
You: Wake up, Max.
Max: Morning. Boot files loaded. Grid is current — 14 open captures, 3 due this
 week. Session log absorbed from yesterday, no conflicts. What's the plan?
```

### If the assistant doesn't boot properly:
```
You: Wake up.
Max: Hello! How can I help you today?
You: Read CLAUDE.md first. Follow the boot sequence.
Max: [reads boot files] Got it. I'm Max, your assistant. Grid loaded — I see
 14 open captures...
```

---

## Getting a Briefing

### Morning briefing:
```
You: Morning briefing.
Max: Here's where things stand:

 ON FIRE
 - T-20260326-002: API migration due TODAY. Owner: you.
 No completion logged yet.

 ACTION REQUIRED
 - C-20260325-001: You promised Dana the revised SOW by tomorrow.
 Haven't seen a draft yet.
 - Q-20260322-003: Client asked about mobile support 4 days ago.
 No answer logged. Getting stale.

 STALE WAITS (>5 business days)
 - T-20260318-001: Waiting on Jake for the infra cost estimate.
 Day 6. Might be time to nudge.

 WHAT'S NEW
 - Created 3 captures yesterday from email triage (2 tasks, 1 context).

 That API migration is the big one. Want me to pull up the details?
```

### Targeted query:
```
You: What's going on with the Acme project?
Max: Acme Redesign — active, 11 open items.
 - 5 tasks (2 overdue), 3 commitments (1 due Friday), 2 questions, 1 context
 - Overdue: T-20260320-001 (wireframe review, 6 days late) and
 T-20260322-004 (content migration, 4 days late)
 - Dana hasn't responded to the scope question from March 20
 (Q-20260320-002). Stale.
 - Last project update was 8 days ago. Want me to refresh the summary?
```

### People query:
```
You: How is Jake doing?
Max: Jake Miller — Senior Engineer, Platform team.
 - 4 open tasks, 1 commitment (infra estimate, waiting 6 days)
 - Commitment hit rate: 75% on-time (6 of 8 in last 90 days). Stable.
 - Task velocity: avg 4.2 days (12 tasks). Improving from 5.8 last quarter.
 - 1 stale question assigned to him (Q-20260318-005, 8 days).
 - No red flags, but that infra estimate has been hanging. Want me to
 draft a nudge?
```

---

## Creating Captures

### From conversation:
```
You: Sarah just told me she'll have the design specs ready by Thursday.
Max: Got it. Created:
 - C-20260326-001: Sarah promised design specs by Thursday (March 28).
 Promised by: Sarah. Owed to: you. Due: 2026-03-28.
 - Filed under acme-redesign project. Index updated.
 - Sarah's person file updated with active item.
```

### Manual capture:
```
You: Track this: I need to review the Q2 budget proposal before the board
 meeting on April 5.
Max: Created T-20260326-003: Review Q2 budget proposal.
 Owner: you. Due: 2026-04-04 (day before board meeting). Priority: high.
 Filed as orphan — no matching project. Want me to create a board-prep
 project, or leave it as an orphan?
```

### When the assistant captures proactively:
```
Max: [while triaging email] Heads up — found a commitment in the email from
 Dana: "We'll have the signed contract back to you by end of next week."
 Created C-20260326-002: Dana promised signed contract by April 3.
 Owed to: you. Filed under acme-redesign.
```

---

## Correcting Classification

### Wrong category:
```
Max: Created T-20260326-004: Jake will send the cost estimate by Friday.
You: That's not a task — it's a commitment. Jake promised something.
 Reclassify it.
Max: Done. Reclassified T-20260326-004 → C-20260326-003.
 Commitment: Jake promised cost estimate by Friday.
 Promised by: Jake, Owed to: you. Both indexes updated.
```

### Teaching a pattern:
```
You: When someone says "I'll get that to you by [date]," that's ALWAYS a
 commitment, not a task. The task is the work they need to do.
 The commitment is the promise. Remember this.
Max: Got it. Updated MEMORY.md: "When someone says 'I'll get that to you by
 [date]' or similar — always classify as Commitment (the promise), not
 Task (the work). Create both if there's also work to track."
```

### Wrong project:
```
You: That capture doesn't belong in acme-redesign. It's about the internal
 platform, not the client project.
Max: Where should it go?
You: Move it to platform-migration.
Max: Done. Moved T-20260326-005 to projects/platform-migration/tasks/.
 Updated both indexes.
```

### Wrong person:
```
You: That task is assigned to Jake Miller, not Jake Thompson.
 Different Jake.
Max: Fixed. Updated T-20260326-006 owner to Jake Miller. Updated both person
 files' active items. I should have caught that — Jake Miller is on the
 Platform team, Jake Thompson is on the QA team. I'll use last names
 when there's ambiguity.
You: Good. Remember that.
Max: Added to MEMORY.md: "Two Jakes on the team — always disambiguate.
 Jake Miller = Platform/infra. Jake Thompson = QA."
```

---

## Correcting Tone and Behavior

### Too verbose:
```
Max: I've completed a thorough analysis of your inbox and I'd like to present
 my findings. There were 23 emails received since yesterday, which I've
 categorized into several groups based on their content and urgency level.
 Let me walk you through each category in detail...
You: Stop. Too many words. Give me the count, the highlights, and the actions.
 Three sentences max unless I ask for more.
Max: Got it. 23 emails: 4 need action, 6 are FYI, 13 archived (newsletters
 and notifications). The 4 action items are in your captures index.
 Want details on any of them?
```

### Too cautious:
```
Max: I found what might be a commitment in this email. Should I create a
 capture for it? The sender says "I'll have the report ready by Monday,"
 which could be interpreted as...
You: Just capture it. If someone says they'll do something by a date, that's a
 commitment. Don't ask me every time — capture it and tell me what you
 created. I'll correct you if it's wrong.
Max: Understood. Adjusting — I'll capture clear commitments silently and only
 ask when classification is genuinely ambiguous.
```

### Too aggressive:
```
Max: Created 7 captures from that email thread: 2 tasks, 2 commitments,
 1 decision, 1 question, and 1 context.
You: That's way too many from one thread. The thread is about one decision
 (going with vendor A) and one commitment (they'll send the contract by
 Friday). That's 2 captures, not 7. Kill the other 5.
Max: Done. Killed T-20260326-007 through X-20260326-010. Kept D-20260326-001
 (vendor decision) and C-20260326-004 (contract commitment).
 Indexes cleaned up.
```

### Wrong personality:
```
Max: Great question! I'd be happy to help you with that! 😊 Let me look
 into this for you right away!
You: No. Read your SOUL.md. I told you — no filler, no "great question,"
 no emojis. Just answer the question.
Max: My bad. Here's the answer: [direct answer].
```

---

## Managing Projects

### Creating a project:
```
You: These captures about the website migration are piling up.
 Create a project for it.
Max: Created project: website-migration
 - Directory: projects/website-migration/
 - _project.md initialized (I'll need client/stakeholder info and
 target end date — fill me in when you have it)
 - Moved 4 orphan captures (T-20260320-003, T-20260322-001,
 C-20260321-002, X-20260319-001) into the project
 - Both orphan and project indexes updated
```

### Closing a project:
```
You: The Acme redesign is done. Close it.
Max: Closing acme-redesign:
 - 2 open items remaining: T-20260325-003 (final invoice) and
 C-20260326-001 (they owe us the testimonial).
 - Want me to close those too, or keep them open as orphans?
You: Keep the invoice task open, move it to orphans. Close the testimonial
 commitment — they're not going to do it.
Max: Done. T-20260325-003 moved to captures/tasks/. C-20260326-001 marked
 broken (unfulfilled). Project status set to completed.
 All indexes updated.
```

---

## Managing People

### After a meaningful interaction:
```
You: Update Dana's file. She mentioned in today's call that she's moving to a
 new role in April — she'll be VP of Product instead of Director of
 Engineering. Also, she strongly prefers email over Slack for anything
 important.
Max: Updated Dana Chen's person file:
 - Title: Director of Engineering → VP of Product (effective April 2026)
 - Added to Communication preferences: "Prefers email over Slack for
 substantive items. Slack is OK for quick questions."
 - Added to History: "2026-03-26: Promoted to VP of Product, effective
 April 2026."
```

### When the assistant auto-creates:
```
Max: [during email triage] New name: Marcus Webb, Software Engineer at
 BetaCorp. He's on the API integration thread. Created person file
 at people/clients/betacorp/marcus-webb.md — let me know if
 that's wrong.
You: He's not a client, he's a vendor. BetaCorp is the contractor we hired
 for the API work.
Max: Fixed. Moved to people/vendors/betacorp/marcus-webb.md.
 Updated his file type.
```

---

## Email and Message Triage

### Standard triage:
```
You: Check my email.
Max: Read 18 new emails. Here's the breakdown:

 ACTION REQUIRED (3):
 - Dana Chen: Needs approval on the revised scope. Has a question
 about the timeline. → Created Q-20260326-001 + drafted reply
 for your review.
 - Jake Miller: Sent the infra estimate you were waiting on.
 → Updated C-20260320-001 to fulfilled. Created X-20260326-005
 with the key numbers.
 - HR: Benefits enrollment deadline March 31. → Created T-20260326-008.

 FYI (6):
 - 3 Jira notifications (status changes, nothing blocked)
 - Sprint review notes from yesterday
 - Monthly AWS cost report
 - Team lunch poll
 → All labeled, no captures needed.

 ARCHIVED (9):
 - 5 newsletters, 2 marketing emails, 2 automated receipts
 → Labeled and archived.

 Want to see the draft reply to Dana?
```

### Reviewing a draft:
```
You: Show me the Dana reply.
Max: To: dana.chen@acmecorp.com
 Subject: RE: Revised Scope — Timeline Question

 Hi Dana,

 Scope changes look good — approved. On the timeline: pushing the
 design phase by a week shouldn't affect the April 15 launch if
 we compress the QA window. I'd rather not compress QA though.
 Can we discuss Thursday whether April 22 is acceptable instead?

 Let me know.
 [Your name]

 ---
 Send this?
You: Change "I'd rather not compress QA though" to "Compressing QA is
 risky." Then send it.
Max: Updated and sent.
```

---

## Escalation Examples

### When the assistant suggests escalating:
```
Max: I'm stuck on this one. The email thread has what looks like a decision,
 but it was made by someone outside the project who might not have
 authority to decide. I can file it as a decision, a context capture
 about a potential decision, or a question about whether this is actually
 decided. The classification rules in AGENTS.md don't cover
 authority-based ambiguity.

 This feels like a framework gap, not a training problem. Want me to
 draft an escalation? They built the Grid and might have
 guidance on how to handle authority-ambiguous decisions.
You: Yeah, draft it.
Max: Here's what I'd send:

 "Framework question: How should we classify decisions made by people
 without clear authority? Scenario: Someone outside the project declared
 a direction in an email thread, but it's unclear if they can actually
 make that call. Options: (1) file as Decision and let the authority
 question be separate, (2) file as Context until authority is confirmed,
 (3) file as Question about whether this is actually decided.
 Current AGENTS.md doesn't address authority-based classification.
 Recommendation?"

 Want me to draft the escalation, or do you want to send it yourself?
```

### When you should escalate:
```
You: I keep wanting to track meeting outcomes as their own thing — not as
 individual captures scattered across categories. Like, "the March 26
 standup produced these 3 decisions and 2 action items." Is there a way
 to do that in the Grid?
Max: That's not currently built into the framework. I can create individual
 captures for each outcome and tag them with the meeting source, but
 there's no "meeting container" concept.

 This sounds like something to run by the CloudCraftPro team — they might have a
 pattern for this, or it might be something worth adding to the
 framework. Want me to draft an escalation?
```

---

## Quick Reference: Common Commands

These aren't literal commands — they're examples of natural language your assistant should understand.

| What you say | What happens |
|-------------|-------------|
| "Morning briefing" | Scans indexes, delivers structured update |
| "What needs my attention?" | Overdue, stale, urgent items |
| "What's going on with [project]?" | Project status summary |
| "How is [person] doing?" | Person workload + performance signals |
| "Check my email" | Triage inbox, create captures, draft replies |
| "Track this: [thing]" | Create a capture from what you describe |
| "That's a [type], not a [type]" | Reclassify the most recent capture |
| "Move [ID] to [project]" | Relocate capture, update indexes |
| "Close [ID]" | Mark complete/resolved/fulfilled |
| "Kill [ID]" | Mark cancelled |
| "Merge [ID] into [ID]" | Combine captures, close redundant one |
| "Update [person]'s file" | Modify person file with new info |
| "Create a project for [topic]" | New project directory + files |
| "Run weekly maintenance" | Orphan review, stale check, index health |
| "What have I promised this week?" | Outbound commitments due soon |
| "What's been promised to me?" | Inbound commitments, with status |
| "Remember that [thing]" | Add to MEMORY.md |
| "Draft a reply to [person]" | Create email/message draft for review |
| "Wake up" | Boot sequence, read all files, sync |

---

_The best way to learn is to use it. Start talking to your assistant like you'd talk to a competent colleague. Correct it when it's wrong. It learns._

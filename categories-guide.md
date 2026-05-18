# Categories Guide

**What each capture category looks like in practice — by role. Use this for inspiration when designing your framework.**

---

## The Six Categories Are Universal

Everyone gets all six. The question isn't "which categories do I need?" — it's "which categories carry the most weight for my role?" All six catch real things in every professional's life. The difference is which ones you'll use ten times a day vs. once a week.

| Category | Universal purpose | Who uses it most |
|----------|------------------|-----------------|
| **Questions** | Open loops needing answers | PMs, Sales, Executives |
| **Decisions** | Choices made, with rationale | Engineers, Executives, Architects |
| **Tasks** | Work with owner + deadline + done criteria | Everyone (but weight varies) |
| **Commitments** | Promises between people, both directions | PMs, Sales, Managers |
| **Context** | Knowledge with no action, but worth remembering | Engineers, Designers, Everyone |
| **Projects** | Containers grouping the other five | PMs, Managers, Executives |

---

## Category Deep Dives with Real Examples

### Questions

**What it catches:** Anything someone is waiting for an answer on. Unresolved questions are cognitive overhead — they sit in your brain rent-free until someone answers them.

**Real examples by role:**

| Role | Example Question | Why it matters |
|------|-----------------|----------------|
| Engineer | "Can we use the new API version in prod, or do we need to wait for the security review?" | Blocked work. This question has a dependency chain behind it. |
| PM | "Did Acme Corp approve the revised timeline?" | A project can't proceed until this is answered. |
| Designer | "Does the client want the mobile nav to match the desktop, or are they open to a different pattern?" | Design direction depends on this answer. Without tracking it, you start work on assumptions. |
| Sales | "What's their budget range? They said they'd 'check internally.'" | Deal qualification. The longer this goes unanswered, the colder the lead. |
| Manager | "Is Sarah planning to take PTO during the sprint?" | Resource planning. An unanswered question becomes a scheduling surprise. |
| Executive | "Has legal signed off on the new vendor contract terms?" | Compliance blocker. Can't proceed until this resolves. |

**Custom fields some roles add:**

| Field | Who adds it | Why |
|-------|-----------|-----|
| `Blocking` | Engineers | Links to the task/PR/deploy that can't proceed until answered |
| `Follow-up date` | Sales | When to ping again if no answer |
| `Escalate after` | PMs | Auto-flag if unanswered past this date |
| `Decision impact` | Executives | What decision is waiting on this answer |

**Classification triggers — how to recognize a Question in the wild:**

- Someone says "I need to find out..." or "Can you check on..."
- An email ends with a direct question and no answer yet
- A meeting action item is "get back to [person] about..."
- Someone said they'd "look into it" — that's a question waiting for an answer
- A Slack thread ends with "?" and no resolution

---

### Decisions

**What it catches:** Choices that were made, who made them, and WHY. This is the category people most regret not tracking. Six months from now, someone will ask "why did we do it this way?" and the decision capture has the answer.

**Real examples by role:**

| Role | Example Decision | Why it matters |
|------|-----------------|----------------|
| Engineer | "We're going with Postgres over MongoDB because the data is highly relational and we need ACID transactions." | Architecture decisions compound. This one shapes everything downstream. |
| PM | "Pushed the launch from March 15 to April 1 to accommodate the accessibility audit." | Timeline decisions need rationale so stakeholders don't ask "why are we late?" |
| Designer | "Going with tab navigation instead of hamburger menu — user testing showed 40% faster task completion." | Design decisions get questioned by every new stakeholder. Having rationale prevents re-litigation. |
| Sales | "Decided to offer the 15% volume discount to close Acme before Q2 ends." | Pricing decisions set precedent. You need to know what was offered and why. |
| Manager | "Moving Jake from the Platform team to the Payments team for Q2." | People decisions have context that matters later — especially if the move doesn't work out. |
| Executive | "We're not pursuing the government contract — the compliance burden doesn't justify the revenue." | Strategic decisions are the most valuable captures an executive can make. |

**Custom fields some roles add:**

| Field | Who adds it | Why |
|-------|-----------|-----|
| `Tech stack impact` | Engineers | Which systems/repos are affected |
| `Client notified` | PMs | Whether the client knows about this decision |
| `Precedent` | Sales | Whether this sets a pricing/terms precedent |
| `Board visibility` | Executives | Whether this needs to go in a board update |
| `Reversibility cost` | Architects | What it would take to undo this |

**Classification triggers:**

- Someone says "We decided to..." or "Let's go with..."
- A meeting concludes with a chosen direction
- An email thread ends with alignment on an approach
- Someone says "I'm going to..." about a non-trivial choice (not a task — a direction)
- A rejected alternative is mentioned ("We considered X but went with Y")

---

### Tasks

**What it catches:** Work that has an owner, a deadline, and a definition of done. Everyone tracks tasks. What makes this system different is that tasks are CONNECTED to the other five categories — a task might fulfill a commitment, implement a decision, or answer a question.

**Real examples by role:**

| Role | Example Task | Why it matters |
|------|-------------|----------------|
| Engineer | "Deploy the staging server with the new auth flow by Friday. Done = all integration tests pass." | Clear owner, clear deadline, clear done criteria. |
| PM | "Send the updated SOW to Acme Corp by Wednesday. Done = client confirms receipt." | Delivery tasks with external visibility. |
| Designer | "Create 3 homepage concepts for client review by Monday. Done = uploaded to Figma with annotations." | Creative work with deliverable milestones. |
| Sales | "Send the case study PDF to the CTO at BetaCorp by tomorrow 5pm." | Follow-up tasks that keep deals alive. |
| Manager | "Write Q1 performance reviews for the platform team. Due March 15." | Administrative tasks that affect people. |
| DevOps | "Rotate the SSL certificates on prod before they expire March 30." | Infrastructure tasks with hard deadlines. |

**Custom fields some roles add:**

| Field | Who adds it | Why |
|-------|-----------|-----|
| `Ticket ID` | Engineers | Links to Jira/Linear/GitHub issue |
| `Deliverable type` | Designers | Wireframe, mockup, prototype, final asset |
| `Billable` | Freelancers/Contractors | Whether this task is client-billable |
| `Client visible` | PMs | Whether the client sees this task's output |
| `Revenue impact` | Sales | Dollar value tied to this task completing |

**Classification triggers:**

- Someone says "I need to..." or "Can you..." followed by concrete work
- An email assigns work with a deadline
- A meeting produces action items
- A commitment implies work ("I'll send that over" = commitment + task)
- A Jira/Asana/Trello ticket is created or assigned

---

### Commitments

**What it catches:** Promises between people, in BOTH directions. What you promised others AND what others promised you. This is the category most people miss entirely, and it's the one that prevents the most painful failures — broken promises you didn't even know were promises.

**Real examples by role:**

| Role | Example Commitment | Direction | Why it matters |
|------|-------------------|-----------|----------------|
| Engineer | "I'll review your PR by end of day." | Outbound (you promised) | If you forget, your teammate is blocked. |
| Engineer | "DevOps said they'll have the new CI pipeline ready by Thursday." | Inbound (promised to you) | If they're late, your sprint is affected. |
| PM | "We committed to delivering the beta by April 15." | Outbound (to client) | Missing this damages the relationship. |
| PM | "The client said they'd provide the brand assets by Monday." | Inbound (from client) | If they're late, YOUR timeline slips and you need to flag it early. |
| Sales | "I told them I'd send a custom demo by Wednesday." | Outbound (to prospect) | A missed follow-up kills a deal. |
| Sales | "They said their CTO would review our proposal this week." | Inbound (from prospect) | If no review happens, the deal is stalling. Track it. |
| Manager | "I promised Sarah we'd discuss her promotion path in our next 1:1." | Outbound (to report) | Broken promises to your team erode trust faster than anything. |
| Executive | "We told the board we'd hit $2M ARR by Q3." | Outbound (to board) | The highest-stakes commitment type. |

**Custom fields some roles add:**

| Field | Who adds it | Why |
|-------|-----------|-----|
| `Stakes` | PMs, Executives | What happens if this commitment is broken |
| `Reminder before` | Sales | How far in advance to nudge about an upcoming due date |
| `Linked task` | Everyone | The task ID that fulfills this commitment |
| `Witness` | Managers | Who else heard this promise (for accountability) |

**Classification triggers:**

- Someone says "I'll...", "I promise...", "I'll get that to you by...", "You'll have it by..."
- Someone says "They said they'd...", "She committed to...", "He's going to..."
- Calendar invites with deliverable expectations
- Email sign-offs with delivery promises ("I'll circle back with numbers on Monday")
- The subtle ones: "Sure, I can do that" in a meeting (this IS a commitment)

**The commitment/task split:**

When something is both a commitment and a task (common), create both:
- The **commitment** tracks the promise: who said what to whom, by when
- The **task** tracks the work: what needs to happen to fulfill the promise

The commitment closes when the promise is fulfilled. The task closes when the work is done. Usually simultaneous, but not always — you might complete the work (task done) but forget to send it (commitment still open).

---

### Context

**What it catches:** Knowledge with no action attached. Things that aren't tasks or decisions but are important to remember. Context captures are your institutional memory — they make every future decision, classification, and interaction better.

**Real examples by role:**

| Role | Example Context | Why it matters |
|------|----------------|----------------|
| Engineer | "The payment service has a 30-second timeout because of the bank API's rate limits. Don't change this without talking to the bank." | System knowledge that prevents future bugs. |
| Engineer | "The legacy auth module was written by a contractor who's no longer available. No one fully understands the token refresh logic." | Risk awareness. Critical for planning. |
| PM | "Acme Corp's fiscal year ends in March. They always have budget pressure in Feb and new budget in April." | Timing knowledge for proposals and renewals. |
| Designer | "This client hates gradients. Every single time. Also hates rounded corners on buttons. They want everything sharp and minimal." | Preference knowledge that prevents wasted revision cycles. |
| Sales | "BetaCorp's CTO is the real decision maker, not the VP of Engineering who's our primary contact." | Relationship intelligence. Knowing who actually decides saves months. |
| Manager | "Jake works best with written specs. Verbal instructions lead to misunderstandings — learned this the hard way." | People knowledge that improves delegation. |
| Executive | "The board is particularly sensitive about our customer acquisition cost after last quarter's spike." | Political awareness that shapes how you present information. |

**Custom fields some roles add:**

| Field | Who adds it | Why |
|-------|-----------|-----|
| `System` | Engineers | Which codebase/service this knowledge applies to |
| `Client` | PMs, Designers, Sales | Which client relationship this informs |
| `Verified` | Everyone | Whether this is confirmed or just observed |
| `Review date` | Everyone | When to check if this context is still accurate |

**Classification triggers:**

- Information with no action but future value
- "FYI" or "just so you know" messages
- Background in an email that isn't the main point but is worth remembering
- Observations about people's preferences or working styles
- System quirks, historical decisions without formal capture, tribal knowledge
- "The reason we do it this way is..." (context about existing patterns)

**Expiration matters:**

Context captures should have an `Expires` field. Some context is permanent ("the client's fiscal year ends in March" — always true). Some expires ("budget freeze until April 15" — stale after that date). Set realistic expirations and let the system clean up stale context.

---

### Projects

**What it catches:** Named containers that group questions, decisions, tasks, commitments, and context into a coherent body of work. A project has people, a timeline, and a goal.

**When to create a project:**

| Signal | Example | Verdict |
|--------|---------|---------|
| 3+ captures for the same body of work | Multiple tasks and a decision all about "the website redesign" | Create a project |
| Named initiative with a deadline | "Q2 Platform Migration" | Create a project |
| Client engagement with deliverables | "Acme Corp brand refresh" | Create a project |
| Recurring operational work | "Monthly financial close" | Maybe — could be a recurring task instead |
| One-off task | "Fix the broken link on the homepage" | Not a project — just a task |
| Vague idea | "We should look into AI sometime" | Not yet — park it as context |

**When NOT to create a project:**

- If it's really just one or two tasks, don't over-organize. Orphan captures are fine.
- If there's no clear end state, it might be a recurring process, not a project.
- If you're not sure, file captures as orphans. You can always move them into a project later when the shape becomes clear.

---

## How Categories Combine By Role

This is the key insight: **your role determines which categories carry the most weight, but all six are always present.** Here's how typical roles weight them:

### The Weights

```
 Questions Decisions Tasks Commitments Context Projects
Engineer ●● ●●● ●●● ●● ●●● ●
PM ●●● ●● ●●● ●●● ●● ●●●
Designer ●● ●●● ●●● ●● ●●● ●
Sales ●●● ● ●● ●●● ●●● ●
Eng Manager ●● ●● ●●● ●●● ●●● ●●
Executive ●●● ●●● ● ●●● ●●● ●●
DevOps/SRE ● ●● ●●● ●● ●●● ●
Freelancer ●● ●● ●●● ●●● ●●● ●●
Product Manager ●●● ●●● ●● ●● ●● ●●●
```

`●●●` = primary (core to the role, used daily)
`●●` = secondary (important but not central)
`●` = minimal (exists, used occasionally)

### Reading the Pattern

- **If you make things** (engineer, designer, DevOps): Tasks and Context are heavy. You need to know what to build and why things are the way they are.
- **If you coordinate things** (PM, product manager): Everything is heavy. You're the hub. Commitments and Projects matter most because you're tracking what everyone owes everyone else.
- **If you sell things** (sales, BD): Commitments and Context are heavy. Relationships run on promises kept and knowledge remembered.
- **If you lead people** (manager, director): Commitments and Context are heavy. You need to track what you promised your team and what you know about how they work.
- **If you decide things** (executive, architect): Decisions and Context are heavy. Your most valuable output is well-reasoned choices with documented rationale.

---

## Customizing Your Categories

The six categories are fixed — don't add new top-level categories. If you think you need a seventh category, it's almost certainly a subcategory or a tag within one of the six. Examples:

| "I need a category for..." | It's actually... | Why |
|----------------------------|-----------------|-----|
| Bug reports | **Task** with a `type: bug` field | A bug is work with an owner and done criteria |
| Meeting notes | **Context** (for informational) or **multiple captures** (decisions, tasks, commitments extracted from the meeting) | Meetings produce captures across categories |
| Ideas | **Context** with `Status: parked` | An idea is knowledge with no action yet |
| Risks | **Context** with `Confidence: inferred` and an `Expires` date | A risk is knowledge about something that might happen |
| Feedback | **Context** about a person or deliverable | Feedback is knowledge that informs future work |
| Approvals | **Commitment** (someone committed to approve by a date) or **Decision** (approval was granted) | An approval is either a pending promise or a completed choice |
| Invoices / Bills | **Task** (pay it) or **Commitment** (they owe us) | Financial items are work or promises |
| Goals / OKRs | **Project** or **Commitment** depending on scope | A goal is either a body of work or a promise to achieve something |

If after reading this table you STILL think you need a new category — flag it. Either it'll map to one of the six on a second read, or you've surfaced a real gap the framework needs to address.

---

_This guide is a reference. Your actual category configuration happens in Phase 2 (Architecture) when the AI designs your system based on your Discovery Document._

# Example Workspace — Sarah, PM at Acme

This is a fully-built Rocky workspace for a fictional user. It's here so you can see a complete instance of the framework before building your own.

**Sarah Chen** is a Senior Product Manager at Acme Corp (a B2B SaaS company). She works with one PM (Dana), reports to a Director of Product (Alex), and has a side advisory role at a startup called Velve. Her assistant is named **Max** and her framework is called **the Grid**.

Browse the files in this folder to see how everything fits together. Recommended reading order:

1. **`CLAUDE.md`** — what the assistant reads first every session
2. **`SOUL.md`** — Max's personality (direct, dry, no fluff)
3. **`USER.md`** — Sarah's profile, orgs, accounts
4. **`AGENTS.md`** — operational rules (capture framework, classification, indexes)
5. **`SCHEMAS.md`** — file formats for captures and people
6. **`MEMORY.md`** — what Max actually remembers
7. **`TOOLS.md`** — Sarah's stack
8. **`_session-log.md`** — a few recent sessions, to see what real activity looks like
9. **`captures/_index.md`** — the running index of open and recent captures
10. **Drill into individual captures** under `captures/Q/`, `T/`, `D/`, `C/`, `X/`
11. **`people/`** — Dana and Alex's files
12. **`projects/acme-mobile-onboarding/`** — a real-feeling project folder with its own index

Names, companies, and details are invented; the structure and rhythm are real.

Once you've explored this, run `../../bootstrap.sh ~/your-workspace` to scaffold an empty one of your own, then either copy from `templates/` or run `03-assembler.md` to generate your files.

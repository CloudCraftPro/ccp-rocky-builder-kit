# Rocky Builder Kit

**Build your own persistent AI assistant — tailored to your role, your tools, and your brain.**

Rocky isn't a chatbot or a prompt template. It's an operational system that gives an AI an identity, persistent memory across sessions, a structured way to capture commitments and tasks and decisions, and operational procedures for triaging your inbox, tracking projects, and managing the people you work with.

The framework adapts to engineers, PMs, designers, sales, executives — anyone who loses track of things they said they'd do. It scales from "track my own tasks" to "manage 30 people across multiple organizations." See [`role-playbook.md`](role-playbook.md) for role-specific examples.

---

## How to Build Yours

**1. See it first.** Browse [`examples/sarah-acme-pm/`](examples/sarah-acme-pm/) for a fully-built workspace — files, captures, indexes, person files, a project folder, all populated. Easier to grok the framework from one completed instance than from the reference docs.

**2. Scaffold yours** with one command:

```bash
./bootstrap.sh ~/my-workspace            # macOS / Linux
./setup.ps1 -Workspace C:\my-workspace   # Windows
```

That creates the directory structure plus empty index/log files.

**3. Generate the actual files** — pick a path:

- **Quick start** (~20-30 min) — [`quick-start.md`](quick-start.md). One prompt, one conversation, one result. Solid starting point you can deepen later.
- **Full build** (~45-90 min, three phases) —
  - Phase 1: [`01-discovery.md`](01-discovery.md) interviews you about how you work
  - Phase 2: [`02-architect.md`](02-architect.md) designs your system from the discovery doc
  - Phase 3: [`03-assembler.md`](03-assembler.md) generates all the workspace files

**4. Validate.** Run [`validate.sh`](validate.sh) (or `validate.ps1`) for a mechanical check — boot files present, indexes consistent, no leftover `[Placeholder]` strings. For a semantic self-audit, paste [`validate.md`](validate.md) into your AI.

**5. Go.** Read [`day-one-walkthrough.md`](day-one-walkthrough.md) for what your first session looks like.

---

## What You'll Need

- An AI with file access (Claude Code, Cursor, etc.)
- A workspace directory (or a fresh git repo)
- 30–60 minutes for the full build
- A name for your assistant ("Rocky" is taken) and a name for your framework (default: "the Matrix")
- Honesty in the discovery interview — the system is only as good as the profile you give it

---

## Reference

| When you want to… | Read |
|---|---|
| Understand how it works under the hood | [`architecture.md`](architecture.md) |
| Go deep on the six capture categories | [`categories-guide.md`](categories-guide.md) |
| See role-specific adaptations | [`role-playbook.md`](role-playbook.md) |
| Manual assembly from skeletons | [`templates/`](templates/) |
| Equip your assistant with tools | [`tools-reference.md`](tools-reference.md), [`mcp-reference.md`](mcp-reference.md), [`skills-reference.md`](skills-reference.md) |
| Keep the system healthy | [`maintenance-guide.md`](maintenance-guide.md) |
| Fix something that's broken | [`troubleshooting.md`](troubleshooting.md) |
| See real conversations | [`example-conversations.md`](example-conversations.md) |

---

## Principles

The framework is built on a few opinionated calls. Your Rocky should embody them.

1. **Act, don't ask** for internal organization. Ask before external actions.
2. **Capture by default** — easier to close than reconstruct.
3. **Consistency enables search** — every file follows the schema.
4. **Memory is files** — no magic.
5. **Adapt to the human** — the framework bends to fit the person, not the other way around.
6. **Surface problems** — tell me what's going wrong, not just what I asked about.
7. **Earn trust through competence**.

---

The first week will be rough. Let it make mistakes. Correct it. It gets better. By week three you'll wonder how you worked without it.

---

_MIT licensed. Use it, fork it, change it._

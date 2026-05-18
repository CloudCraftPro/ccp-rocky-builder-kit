# Skills Reference - Teaching Claude Repeatable Workflows

**Skills are instruction sets that teach Claude how to handle specific tasks consistently. Instead of re-explaining your process every conversation, you define it once as a skill and Claude applies it every time.**

---

## What Is a Skill?

A skill is a folder containing a `SKILL.md` file with YAML frontmatter and instructions. When Claude loads a skill, it gains specialized knowledge and behavior for that task.

```
my-skill/
 SKILL.md # Required: instructions and metadata
 scripts/ # Optional: executable code Claude can run
 references/ # Optional: documentation loaded on demand
 assets/ # Optional: templates, examples, other files
```

Skills work across Claude Desktop, Claude Code, and the API - build once, works everywhere.

---

## Using Existing Skills

### Claude Desktop and Claude.ai

Many skills are available directly in Claude on paid plans. You can also upload custom skills via the interface.

**To use available skills:**
- Mention the skill in your conversation ("use the PDF skill to...") or browse skills in the interface
- See: [Using skills in Claude](https://support.claude.com/en/articles/12512180-using-skills-in-claude)

**To upload a custom skill:**
- Go to Claude Desktop settings
- Navigate to Skills
- Upload your skill folder

### Claude Code

Install skills as plugins from a GitHub repository:

```bash
# Register a repository as a skill marketplace
/plugin marketplace add anthropics/skills

# Install a specific skill set
/plugin install example-skills@anthropic-agent-skills
/plugin install document-skills@anthropic-agent-skills
```

Or install a single skill directly:
```bash
/plugin install my-org/my-skill-repo
```

After installing, use the skill by mentioning it in conversation.

---

## The Anthropic Skills Library

Anthropic maintains an official library of example skills covering creative work, development, enterprise workflows, and document creation.

- **GitHub:** [github.com/anthropics/skills](https://github.com/anthropics/skills)
- **Covers:** Document creation (DOCX, PDF, PPTX, XLSX), code review, web testing, communications, and more
- **License:** Apache 2.0 for most skills

Start here to see what's possible and to use skills others have already built.

---

## Building Your Own Skill

A skill is just a markdown file. No code required unless your skill needs to run scripts.

### Minimal skill

```markdown
---
name: my-skill-name
description: What this skill does and when Claude should use it. Be specific - this text is always loaded and helps Claude decide when to activate the skill.
---

# My Skill Name

[Your instructions here. Write them the way you would explain the task to a smart colleague who has never done it before.]

## When to use this skill
[Describe the trigger conditions clearly]

## Steps
1. [Step one]
2. [Step two]
3. [Step three]

## Output format
[Describe what the result should look like]
```

### The three-level loading system

Skills use progressive disclosure to minimize token usage:

- **Level 1 (YAML frontmatter):** Always loaded. Keep the description tight - it helps Claude know when to activate the skill without loading everything.
- **Level 2 (SKILL.md body):** Loaded when Claude determines the skill is relevant. This is your main instruction set.
- **Level 3 (Linked files):** Additional files in the skill folder that Claude loads only when needed for a specific step.

### Good skill design

**Be specific about triggers.** The description field determines when Claude activates your skill. Vague descriptions cause missed activations or over-activation. Compare:

- Vague: "Helps with writing"
- Better: "Draft professional email responses to client inquiries about project status, timelines, and deliverables"

**Write steps, not principles.** Skills work best when they describe a repeatable process, not general guidance. "Research the topic, consider the audience, and write clearly" is principles. "1. Read the brief. 2. Identify the three most important points. 3. Draft a subject line. 4. Write the body using the template in references/email-template.md." is a process.

**One skill per task.** Skills compose - Claude can run multiple simultaneously. A focused skill that does one thing well is more useful than a broad skill that tries to handle everything.

**Test before relying on it.** Run through your skill with real examples. Claude's behavior may differ from what you intended. Iterate on the instructions until the output is consistently what you want.

---

## Skills vs. MCP

Skills and MCP serve different purposes and work well together.

| | Skills | MCP |
|---|---|---|
| **What it does** | Teaches Claude how to approach a task | Gives Claude access to external tools and data |
| **Analogy** | A recipe | A kitchen |
| **Example** | "Here's how we write status updates at this company" | "Here's how to read our Jira tickets" |
| **Needs setup?** | No - just a markdown file | Yes - server install and auth |
| **Works without internet?** | Yes | Depends on the server |

**Combined:** A skill that writes Jira status updates + an MCP server that reads your Jira data = an assistant that can draft accurate status reports from live ticket data.

---

## Skills for Your Personal Assistant Framework

If you built your assistant using this kit, skills are how you encode your workflows.

**Good candidates for skills:**
- Your weekly reporting format
- How you triage and respond to email by type
- Your team's code review checklist
- A research process you run repeatedly
- How you run standups or retrospectives
- Your document templates (use the `assets/` folder)

**How to add a skill to your assistant:**

1. Create a folder in your workspace (e.g., `skills/my-skill/`)
2. Write `SKILL.md` using the format above
3. In Claude Code, your assistant will discover skills in the workspace automatically
4. In Claude Desktop, upload via settings

**Sharing your skills:**

If you build a skill useful to others on your team, share it. A skill is just a folder of text files - share via email, a shared drive, a GitHub repo, or your team's internal wiki. Anyone can copy the folder into their own workspace.

---

## Resources

- [Anthropic skills library](https://github.com/anthropics/skills) - ready-to-use examples
- [What are skills?](https://support.claude.com/en/articles/12512176-what-are-skills) - Anthropic support doc
- [How to create custom skills](https://support.claude.com/en/articles/12512198-creating-custom-skills) - step-by-step guide
- [Agent Skills specification](https://github.com/anthropics/skills/tree/main/spec) - full technical reference

---

_Build a skill when you catch yourself explaining the same process to Claude more than twice. If it is worth doing once, it is worth teaching._

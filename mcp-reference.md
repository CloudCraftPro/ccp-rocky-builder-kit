# MCP Reference — Extending Your Assistant

**MCP (Model Context Protocol) servers give your assistant new capabilities — email, Slack, databases, browsers, project management, and more. This guide covers what's available and how to set it up.**

---

## What Is MCP?

MCP is a protocol that lets AI assistants connect to external tools and services. Instead of your assistant calling an API manually with curl, an MCP server exposes those capabilities as native tools the assistant can use directly.

Think of it like plugins. Each MCP server adds a set of tools. Your assistant sees them as built-in capabilities.

**Without MCP:** "I can't read your email directly. Can you paste it here?"
**With MCP:** Your assistant reads your Gmail, classifies messages, drafts replies — all natively.

---

## Zero-Config Option: claude.ai Built-in Connectors

If you use Claude Desktop or Claude.ai (paid plans), you can connect to many services without any configuration files, API keys, or local servers. Anthropic hosts these connectors and handles the authentication flow.

**Available connectors include:** Gmail, Google Drive, Google Calendar, Slack, Atlassian (Jira + Confluence), GitHub, HubSpot, Microsoft 365, Zoom, and more.

### How to connect

1. Open Claude Desktop (or claude.ai in your browser)
2. Go to **Settings** - look for **Integrations** or **Connections**
3. Find the service you want to connect
4. Click **Connect** and complete the OAuth flow in your browser

Once connected, your assistant can use that service natively in any conversation - no config files, no terminal commands.

### When to use built-in connectors vs. self-hosted

| | Built-in connectors | Self-hosted MCP servers |
|---|---|---|
| **Setup** | OAuth click-through only | Config file + API keys or local server |
| **Works in** | Claude Desktop, Claude.ai | Claude Code, Cursor, any MCP-compatible client |
| **Maintenance** | Anthropic maintains | You maintain |
| **Customization** | Fixed capabilities | Full control |
| **Best for** | Getting started fast, non-technical users, standard workflows | Developers, custom integrations, automations, local data |

Start with built-in connectors if they cover your needs. Switch to self-hosted when you need capabilities beyond what the built-in connector offers, or when you are running Claude Code rather than Claude Desktop.

---

## How MCP Works in Claude Code

MCP servers are configured in `.mcp.json` files. Claude Code reads these on startup and connects to the specified servers.

### Configuration File Locations

```
~/.claude/.mcp.json # Global — available in every project./project-dir/.mcp.json # Project-specific — only in this workspace
```

### Configuration Format

```json
{
 "mcpServers": {
 "server-name": {
 "command": "/path/to/server/binary",
 "args": ["--flag", "value"],
 "env": {
 "API_KEY": "your-key-here",
 "OTHER_CONFIG": "value"
 }
 }
 }
}
```

- **command**: The executable that runs the MCP server
- **args**: Command-line arguments passed to the server
- **env**: Environment variables the server needs (API keys, OAuth tokens, etc.)

### Server Types

| Type | How it runs | Best for |
|------|------------|----------|
| **stdio** | Local process, communicates via stdin/stdout | Most common. CLI tools, local services. |
| **SSE** | HTTP server with Server-Sent Events | Remote services, shared servers. |
| **HTTP** | Standard HTTP endpoints | Web APIs, cloud services. |

Most servers you'll install are stdio — they run as local processes.

---

## Tier 1 — Core Integrations

These are the MCP servers that matter most for a personal AI assistant. They connect your assistant to the communication and productivity tools where your actual work happens.

### Gmail

Read email, search messages, list labels, view threads, create drafts. Critical for email triage.

**Option A — Claude Code built-in (easiest):**
Claude Code has native Gmail integration. Connect via:
```
Settings → MCP Servers → Gmail → Connect
```
Follow the OAuth flow to authorize your Google account.

**Option B — Google Workspace MCP (broader):**
Covers Gmail + Calendar + Docs + Sheets + Drive + Tasks in one server.

```bash
# Install
pip install workspace-mcp # or: uv pip install workspace-mcp
```

```json
{
 "mcpServers": {
 "google-workspace": {
 "command": "uvx",
 "args": ["workspace-mcp"],
 "env": {
 "GOOGLE_OAUTH_CLIENT_ID": "your-client-id",
 "GOOGLE_OAUTH_CLIENT_SECRET": "your-client-secret"
 }
 }
 }
}
```

**Setup:** Requires a Google Cloud project with OAuth credentials. The server handles the auth flow on first run.

**What your assistant can do:**
- Search and read emails
- List and apply labels
- Read threads
- Create drafts (your assistant drafts, you approve sending)
- List labels for triage classification

### Slack

Read channels, search messages, send messages (with approval), manage canvases.

**Option A — Claude Code built-in:**
```
Settings → MCP Servers → Slack → Connect
```
Follow the OAuth flow for your Slack workspace.

**What your assistant can do:**
- Read channel messages and threads
- Search public and private channels
- Search for users
- Send messages (always with your approval per SOUL.md rules)
- Create and update canvases
- Schedule messages
- Read user profiles

**Tip:** If you have multiple Slack workspaces (e.g., one for each org), you may need separate MCP configurations. Check your assistant's org separation rules.

### Google Calendar

View events, create events (with approval), check availability.

**Via Google Workspace MCP** (see Gmail section above — same server covers Calendar).

**Standalone option:**
```bash
pip install gcalcli # or: uv pip install gcalcli
```
Not a full MCP server, but your assistant can use it via bash commands.

**What your assistant can do:**
- Check today's schedule for briefing context
- Identify meeting conflicts
- Draft calendar events (you approve)
- See who you're meeting with (feeds into person file context)

---

## Tier 2 — Project Management and Development

### Atlassian (Jira + Confluence)

Query issues, manage projects, access documentation. Essential if your team uses Jira.

**Claude Code built-in:**
```
Settings → MCP Servers → Atlassian → Connect
```

**What your assistant can do:**
- Search and read Jira issues
- Get issue details, comments, status
- Access Confluence pages
- Track sprint progress
- Generate status reports from Jira data

### GitHub

Enhanced GitHub integration beyond the `gh` CLI.

**Claude Code built-in** — already available when you install `gh` and authenticate. Claude Code's native GitHub integration handles most needs.

**For extended capabilities:**
```json
{
 "mcpServers": {
 "github": {
 "command": "npx",
 "args": ["-y", "@modelcontextprotocol/server-github"],
 "env": {
 "GITHUB_PERSONAL_ACCESS_TOKEN": "your-token"
 }
 }
 }
}
```

### Linear

If your team uses Linear instead of Jira:

```json
{
 "mcpServers": {
 "linear": {
 "command": "npx",
 "args": ["-y", "@modelcontextprotocol/server-linear"],
 "env": {
 "LINEAR_API_KEY": "your-api-key"
 }
 }
 }
}
```

### Notion

Read and manage Notion databases, pages, and content calendars:

```json
{
 "mcpServers": {
 "notion": {
 "command": "npx",
 "args": ["-y", "@modelcontextprotocol/server-notion"],
 "env": {
 "NOTION_API_KEY": "your-integration-token"
 }
 }
 }
}
```

---

## Tier 3 — Specialized Integrations

Install based on your specific needs.

### Browser Automation (Chrome DevTools)

Control a browser — navigate pages, fill forms, take screenshots, run Lighthouse audits, inspect network requests. Useful for web testing, scraping, and debugging.

**As a Claude Code plugin:**
```
Settings → Plugins → chrome-devtools-mcp
```

**Manual setup:**
```json
{
 "mcpServers": {
 "chrome-devtools": {
 "command": "npx",
 "args": ["-y", "chrome-devtools-mcp"],
 "env": {}
 }
 }
}
```

**Requires:** Chrome/Chromium running with remote debugging enabled:
```bash
# macOS
/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9222

# Windows
chrome.exe --remote-debugging-port=9222

# Linux
google-chrome --remote-debugging-port=9222
```

**What your assistant can do:**
- Navigate to URLs and take screenshots
- Click elements, fill forms, type text
- Read console messages and network requests
- Run Lighthouse performance/accessibility audits
- Extract data from web pages

### Database Access

Query databases directly. Install for your stack:

**PostgreSQL:**
```json
{
 "mcpServers": {
 "postgres": {
 "command": "npx",
 "args": ["-y", "@modelcontextprotocol/server-postgres"],
 "env": {
 "DATABASE_URL": "postgresql://user:pass@host:5432/dbname"
 }
 }
 }
}
```

**SQLite:**
```json
{
 "mcpServers": {
 "sqlite": {
 "command": "npx",
 "args": ["-y", "@modelcontextprotocol/server-sqlite", "--db-path", "/path/to/database.db"]
 }
 }
}
```

**MySQL:**
```json
{
 "mcpServers": {
 "mysql": {
 "command": "npx",
 "args": ["-y", "@nickshanks/mcp-mysql"],
 "env": {
 "MYSQL_HOST": "localhost",
 "MYSQL_USER": "root",
 "MYSQL_PASSWORD": "password",
 "MYSQL_DATABASE": "mydb"
 }
 }
 }
}
```

### Web Scraping (Firecrawl)

Extract structured data from websites. Useful for research, competitive analysis, and data collection.

```json
{
 "mcpServers": {
 "firecrawl": {
 "command": "npx",
 "args": ["-y", "firecrawl-mcp"],
 "env": {
 "FIRECRAWL_API_KEY": "your-api-key"
 }
 }
 }
}
```

**What your assistant can do:**
- Scrape web pages with JavaScript rendering
- Extract structured data from pages
- Create browser sessions for multi-page workflows
- Convert web content to clean markdown

### Kubernetes

Manage clusters from your assistant:

```json
{
 "mcpServers": {
 "kubernetes": {
 "command": "npx",
 "args": ["-y", "kubectl-mcp-server"]
 }
 }
}
```

Uses your existing kubeconfig. Your assistant can list pods, check logs, describe resources, and manage deployments.

### Figma

Extract design specs, component details, and design tokens. Useful for design-to-code workflows.

```json
{
 "mcpServers": {
 "figma": {
 "command": "npx",
 "args": ["-y", "figma-mcp-server"],
 "env": {
 "FIGMA_ACCESS_TOKEN": "your-token"
 }
 }
 }
}
```

**Requires:** Figma paid account with Dev Mode enabled.

### File System (Sandboxed)

A safer way to give your assistant file access with explicit boundaries:

```json
{
 "mcpServers": {
 "filesystem": {
 "command": "npx",
 "args": ["-y", "@modelcontextprotocol/server-filesystem", "/path/to/allowed/directory"]
 }
 }
}
```

Only grants access to the specified directory tree. Useful if you want to give your assistant access to a specific project without full system access.

---

## How to Choose What to Install

Match MCP servers to your workflow. Here's a quick decision guide:

| If you... | Install |
|-----------|---------|
| Use Gmail for work | Gmail or Google Workspace MCP |
| Use Slack | Slack MCP |
| Use Google Calendar | Google Workspace MCP |
| Track work in Jira | Atlassian MCP |
| Track work in Linear | Linear MCP |
| Use Notion | Notion MCP |
| Work on web projects | Chrome DevTools MCP |
| Query databases regularly | Database MCP (for your DB type) |
| Need to scrape/research websites | Firecrawl MCP |
| Manage Kubernetes clusters | Kubernetes MCP |
| Work with Figma designs | Figma MCP |
| Use GitHub (beyond basic PRs) | GitHub MCP |

**Start small.** Install 1-2 that match your core workflow. Add more as you need them. Each MCP server adds tools your assistant can use — but too many can slow startup and create noise.

---

## Security Notes

MCP servers run on your machine with your credentials. Keep these things in mind:

- **API keys and tokens** in `.mcp.json` are stored in plain text. Don't commit this file to public repos. Add `.mcp.json` to `.gitignore`.
- **OAuth tokens** are stored locally by each MCP server. Revoke access in your account settings (Google, Slack, etc.) if you stop using a server.
- **Database MCP servers** have full query access. Use read-only credentials when possible, especially for production databases.
- **Browser automation** can interact with any site you're logged into. Be mindful of what sessions are active in the Chrome instance you connect to.
- **Your assistant's autonomy rules still apply.** Even though an MCP server CAN send a Slack message, your SOUL.md rules mean your assistant must show you the message and get approval first. MCP gives capability; your framework gives judgment.

---

## Finding More MCP Servers

The MCP ecosystem is growing fast. Places to discover new servers:

- **Official registry:** [modelcontextprotocol.io](https://modelcontextprotocol.io) — curated, maintained by Anthropic
- **npm search:** `npm search mcp-server` — many servers are published as npm packages
- **PyPI search:** `pip search mcp` — Python-based servers
- **GitHub topics:** Search `mcp-server` on GitHub for community implementations
- **Community lists:** Search for "awesome MCP servers" for curated collections

When evaluating a new MCP server:
- Check the GitHub stars and recent activity (maintained vs. abandoned)
- Read the permissions it requires (principle of least privilege)
- Test with non-sensitive data first
- escalate if you're not sure whether a server is trustworthy or useful

---

_Install what you need, skip what you don't. Your assistant will tell you when it's missing a capability — that's when you come back to this guide._

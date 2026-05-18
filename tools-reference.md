# Tools Reference — CLI Utilities

**A comprehensive list of command-line tools that make your assistant more capable. Organized by category with install commands for every major platform.**

Your assistant can only do what its environment allows. A well-equipped CLI means your assistant can process data, search codebases, interact with APIs, manage infrastructure, and automate workflows — all without leaving the terminal.

---

## First Things First: Package Managers

Before installing anything else, you need a package manager. This is how your assistant will install tools on your behalf.

### macOS — Homebrew

The standard. Almost everything in this guide installs through it.

```bash
# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# After install, follow the instructions it prints to add brew to your PATH
# Then verify:
brew --version

# Usage:
brew install <package> # Install a package
brew upgrade <package> # Update a package
brew list # See what's installed
brew search <term> # Find packages
```

### Windows — Three Options

**winget** (recommended — built into Windows 11):
```powershell
# Already installed on Windows 11. Verify:
winget --version

# Usage:
winget install <package>
winget upgrade <package>
winget list
winget search <term>
```

**Scoop** (user-level, no admin needed — good for dev tools):
```powershell
# Install Scoop
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
irm get.scoop.sh | iex

# Usage:
scoop install <package>
scoop update <package>
scoop list
scoop search <term>

# Add the extras bucket for more packages:
scoop bucket add extras
```

**Chocolatey** (admin-level, broadest package library):
```powershell
# Install Chocolatey (run as Administrator)
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Usage:
choco install <package>
choco upgrade <package>
choco list --local
choco search <term>
```

**Which one?** Use winget for common software (browsers, IDEs). Use Scoop for dev/CLI tools — it installs to userspace, doesn't pollute system paths, and is easiest for your assistant to work with. Use Chocolatey if Scoop doesn't have what you need.

### Linux — Built-in

Your distro comes with one:

```bash
# Debian / Ubuntu
sudo apt update && sudo apt install <package>

# Fedora / RHEL
sudo dnf install <package>

# Arch Linux
sudo pacman -S <package>
```

---

## Tier 1 — Install These First

These are the tools that make the biggest difference for an AI assistant. Install all of them.

### jq — JSON Processing

Your assistant will encounter JSON constantly — API responses, config files, data exports. jq lets it slice, filter, and transform JSON from the command line.

```bash
# macOS
brew install jq

# Windows
scoop install jq # or: winget install jqlang.jq

# Linux
sudo apt install jq # or: sudo dnf install jq
```

```bash
# Examples:
echo '{"name":"Alice","role":"PM"}' | jq '.name' # → "Alice"
cat data.json | jq '.users[] | select(.active==true)' # Filter active users
curl -s api.example.com/data | jq '.results | length' # Count results
```

### ripgrep (rg) — Fast Code Search

2-5x faster than grep. Respects.gitignore. Your assistant uses this to search codebases.

```bash
# macOS
brew install ripgrep

# Windows
scoop install ripgrep # or: winget install BurntSushi.ripgrep.MSVC

# Linux
sudo apt install ripgrep # or: sudo dnf install ripgrep
```

```bash
# Examples:
rg "TODO" --type py # Search Python files for TODOs
rg "function.*export" --glob "*.ts" # Search TypeScript exports
rg -l "API_KEY" # List files containing API_KEY
```

### fd — Fast File Finder

Faster and simpler than `find`. Respects.gitignore. Pairs well with ripgrep.

```bash
# macOS
brew install fd

# Windows
scoop install fd # or: winget install sharkdp.fd

# Linux
sudo apt install fd-find # (binary is `fzf` on Debian/Ubuntu)
```

```bash
# Examples:
fd "\.py$" # Find all Python files
fd "config" --type f # Find files with "config" in name
fd --extension md --changed-within 1d # Markdown files changed today
```

### git + gh — Version Control + GitHub CLI

Git is foundational. The GitHub CLI (gh) lets your assistant create PRs, manage issues, and interact with GitHub without leaving the terminal.

```bash
# macOS
brew install git gh

# Windows
scoop install git gh # or: winget install Git.Git && winget install GitHub.cli

# Linux
sudo apt install git gh # or: sudo dnf install git gh
```

```bash
# Authenticate GitHub CLI:
gh auth login

# Examples:
gh pr create --title "Fix auth bug" --body "..."
gh issue list --label "bug"
gh pr view 42
gh repo clone owner/repo
```

### curl — HTTP Requests

Usually pre-installed. The universal tool for API calls, downloads, and web requests.

```bash
# macOS — usually pre-installed. Update with:
brew install curl

# Windows
scoop install curl # or: winget install cURL.cURL

# Linux — usually pre-installed. Install with:
sudo apt install curl
```

### tree — Directory Visualization

Shows directory structure. Essential for your assistant to understand project layouts.

```bash
# macOS
brew install tree

# Windows
scoop install tree

# Linux
sudo apt install tree
```

---

## Tier 2 — High Value, Install When Relevant

### yq — YAML Processing

Like jq but for YAML. If you work with Kubernetes, Docker Compose, CI configs, or any YAML-heavy stack.

```bash
# macOS
brew install yq

# Windows
scoop install yq # or: winget install MikeFarah.yq

# Linux
sudo apt install yq # or: snap install yq
```

### bat — Better File Viewing

`cat` with syntax highlighting and line numbers. Makes code output more readable.

```bash
# macOS
brew install bat

# Windows
scoop install bat # or: winget install sharkdp.bat

# Linux
sudo apt install bat # (binary may be `batcat` on Debian/Ubuntu)
```

### httpie / xh — Friendly HTTP Client

Cleaner syntax than curl for API testing. xh is the faster Rust rewrite.

```bash
# macOS
brew install httpie # or: brew install xh

# Windows
scoop install httpie # or: scoop install xh

# Linux
sudo apt install httpie # or: pip install httpie
```

```bash
# Example (httpie syntax, works with both):
http GET api.example.com/users Authorization:"Bearer token123"
http POST api.example.com/data name=test value=42
```

### pandoc — Document Conversion

Converts between Markdown, HTML, PDF, Word, LaTeX, and more. Useful if your assistant needs to generate or transform documentation.

```bash
# macOS
brew install pandoc

# Windows
scoop install pandoc # or: winget install JohnMacFarlane.Pandoc

# Linux
sudo apt install pandoc
```

### csvkit — CSV/Tabular Data Processing

Process CSV files, run SQL queries on CSVs, convert between formats. Useful if your work involves data.

```bash
# All platforms (requires Python):
pip install csvkit # or: uv pip install csvkit
```

```bash
# Examples:
csvstat data.csv # Summary statistics
csvsql --query "SELECT * FROM data WHERE amount > 100" data.csv
csvjoin -c id file1.csv file2.csv # Join CSVs
in2csv data.xlsx > data.csv # Excel to CSV
```

### shellcheck — Shell Script Linter

Validates bash/shell scripts before your assistant runs them. Catches bugs early.

```bash
# macOS
brew install shellcheck

# Windows
scoop install shellcheck

# Linux
sudo apt install shellcheck
```

---

## Tier 3 — Role-Specific Tools

Install based on your stack and role. Don't install everything — pick what you need.

### Language Runtimes and Package Managers

**Node.js + npm:**
```bash
# macOS
brew install node

# Windows
scoop install nodejs # or: winget install OpenJS.NodeJS

# Linux
# Recommended: use nvm (Node Version Manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
nvm install --lts
```

**Python 3 + uv (ultra-fast package manager):**
```bash
# macOS
brew install python3
curl -LsSf https://astral.sh/uv/install.sh | sh

# Windows
winget install Python.Python.3
powershell -c "irm https://astral.sh/uv/install.ps1 | iex"

# Linux
sudo apt install python3 python3-pip
curl -LsSf https://astral.sh/uv/install.sh | sh
```

uv replaces pip, virtualenv, pyenv, and pipx. It's 10-100x faster than pip for dependency resolution. Your assistant should prefer `uv pip install` over `pip install`.

### Database CLIs

Install the ones matching your stack:

```bash
# PostgreSQL
brew install postgresql # macOS
scoop install postgresql # Windows
sudo apt install postgresql-client # Linux

# MySQL
brew install mysql-client # macOS
scoop install mysql # Windows
sudo apt install mysql-client # Linux

# SQLite (usually pre-installed)
brew install sqlite # macOS if missing

# Redis
brew install redis # macOS
scoop install redis # Windows
sudo apt install redis-tools # Linux

# MongoDB
npm install -g mongosh # All platforms
```

### Cloud CLIs

Install for your cloud provider:

```bash
# AWS
brew install awscli # macOS
scoop install aws # Windows
# Linux: curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

# Google Cloud
brew install google-cloud-sdk # macOS
# Windows/Linux: https://cloud.google.com/sdk/docs/install

# Azure
brew install azure-cli # macOS
scoop install azure-cli # Windows
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
```

### Container and Orchestration

```bash
# Docker
brew install docker # macOS (or Docker Desktop)
# Windows: Docker Desktop installer
sudo apt install docker.io # Linux

# Kubernetes
brew install kubectl # macOS
scoop install kubectl # Windows
sudo apt install kubectl # Linux (or snap install kubectl)

# Helm (Kubernetes package manager)
brew install helm # macOS
scoop install helm # Windows
sudo apt install helm # Linux (or snap install helm)
```

### Git Enhancements

```bash
# delta — syntax-highlighted diffs
brew install git-delta # macOS
scoop install delta # Windows
# Linux: download from GitHub releases

# lazygit — terminal UI for git
brew install lazygit # macOS
scoop install lazygit # Windows
sudo apt install lazygit # Linux

# glab — GitLab CLI (if you use GitLab instead of GitHub)
brew install glab # macOS
scoop install glab # Windows
sudo apt install glab # Linux
```

### System Monitoring

```bash
# htop — interactive process viewer
brew install htop # macOS
scoop install htop # Windows
sudo apt install htop # Linux

# ncdu — disk usage analyzer
brew install ncdu # macOS
scoop install ncdu # Windows
sudo apt install ncdu # Linux

# duf — disk usage overview
brew install duf # macOS
scoop install duf # Windows
sudo apt install duf # Linux
```

### Networking

```bash
# nmap — network scanner
brew install nmap # macOS
scoop install nmap # Windows
sudo apt install nmap # Linux

# mtr — network diagnostics (traceroute + ping)
brew install mtr # macOS
sudo apt install mtr # Linux
```

### Media Processing

```bash
# ffmpeg — video/audio processing
brew install ffmpeg # macOS
scoop install ffmpeg # Windows
sudo apt install ffmpeg # Linux

# imagemagick — image processing
brew install imagemagick # macOS
scoop install imagemagick # Windows
sudo apt install imagemagick # Linux
```

### Security and Encryption

```bash
# age — modern file encryption
brew install age # macOS
scoop install age # Windows
sudo apt install age # Linux

# pass — CLI password manager (uses GPG)
brew install pass # macOS
scoop install pass # Windows
sudo apt install pass # Linux
```

---

## Quick Install Scripts

Copy-paste these to get set up fast. Each one installs a package manager and the Tier 1 tools.

### macOS Quick Start

```bash
# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Tier 1 tools
brew install jq ripgrep fd git gh tree curl

# Optional Tier 2
brew install yq bat httpie pandoc shellcheck

# Verify
jq --version && rg --version && fd --version && gh --version && tree --version
```

### Windows Quick Start (Scoop)

```powershell
# Install Scoop
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
irm get.scoop.sh | iex

# Install Tier 1 tools
scoop install jq ripgrep fd git gh tree curl

# Optional Tier 2
scoop install yq bat xh pandoc shellcheck

# Verify
jq --version; rg --version; fd --version; gh --version; tree --version
```

### Linux (Debian/Ubuntu) Quick Start

```bash
sudo apt update

# Install Tier 1 tools
sudo apt install -y jq ripgrep fd-find git tree curl

# Install GitHub CLI
sudo apt install -y gh # Or: https://github.com/cli/cli/blob/trunk/docs/install_linux.md

# Optional Tier 2
sudo apt install -y bat pandoc shellcheck
pip install httpie csvkit

# Verify
jq --version && rg --version && gh --version && tree --version
```

---

## Letting Your Assistant Install Tools

Once you have a package manager, your assistant can install tools for you. You'll want to decide on your autonomy level:

**Option A — Assistant installs freely:** Add your package manager to the assistant's allowed commands. It installs what it needs.

**Option B — Assistant suggests, you approve:** The assistant tells you what it wants to install and why. You run the command.

**Option C — Pre-install everything:** Use the quick install scripts above. The assistant works with what's there.

Most people start with Option B and move to Option A as trust builds. Configure this in your assistant's autonomy rules (AGENTS.md).

---

_This is a reference document. You don't need everything here. Install Tier 1 first, add Tier 2 as needed, pick from Tier 3 based on your stack. Your assistant will tell you when it needs a tool it doesn't have._

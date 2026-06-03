# Changelog

All notable changes to the Rocky Builder Kit are tracked here.

Format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/). Versions follow [Semantic Versioning](https://semver.org/) — note that schema changes are tracked separately in [`migrations.md`](migrations.md).

---

## [Unreleased]

_Changes that haven't been tagged yet land here._

---

## [0.3.0] — 2026-06-02

### Added
- `validate.sh` and `validate.ps1` — mechanical workspace checker. Verifies boot files present, directory structure right, no leftover `[Placeholder]` strings, captures-index reconciled with files on disk. Read-only; exits non-zero on fail.
- `validate.md` — AI-driven semantic self-audit prompt for the things a script can't see (tone consistency, drift, principle violations, coverage gaps).
- `migrations.md` — schema-evolution playbook with semver convention for capture/person/project schema changes.
- `schema_version` field added to `SCHEMAS.template.md` front-matter convention.

### Changed
- `README.md` rewritten — 125 lines → 81 lines. Build path collapsed into a clean 5-step flow (see → scaffold → generate → validate → go). Reference docs consolidated into a single "when you want to / read" table.
- Audience description broadened to call out solo founders, consultants, and people with ADHD / executive-function challenges as core fits.
- Schema files now use YAML front-matter (`---` bounded) instead of bullet-list headers, as part of the `1.0` schema version baseline.

---

## [0.2.0] — 2026-06-01

### Added
- `bootstrap.sh` and `setup.ps1` — scaffold an empty workspace (directory structure, `_sequence.md`, `_session-log.md`, all three `_index.md` files) with a single command. Idempotent. Smoke-tested.
- `examples/sarah-acme-pm/` — complete worked example workspace for a fictional Senior PM. 11 captures across all 5 categories, 3 person files, 1 project folder, populated session log and memory. Designed so new users can see a finished instance before building their own.

### Changed
- README updated to surface the example workspace and bootstrap scripts at the top of "How to Build Yours".

---

## [0.1.0] — 2026-05-25

### Changed
- Framework-escalation concept removed. The "flag it for review / ask the framework architects" pattern had no clean owner after the kit's earlier sanitization and was generating dangling prose. Operational escalation (stakeholder escalations, team-member escalations, the `Escalate after` custom field for stale captures) preserved — that's a property of the user's work, not the framework.

---

## [0.0.1] — 2026-05-16

### Added
- Initial commit: full Rocky Builder Kit structure.
- Three-phase build prompts (`01-discovery.md`, `02-architect.md`, `03-assembler.md`) plus single-prompt `quick-start.md`.
- Reference docs: `architecture.md`, `categories-guide.md`, `role-playbook.md`, `day-one-walkthrough.md`, `example-conversations.md`, `maintenance-guide.md`, `troubleshooting.md`.
- Tooling references: `tools-reference.md`, `mcp-reference.md`, `skills-reference.md`.
- Templates for manual assembly: `CLAUDE`, `SOUL`, `USER`, `AGENTS`, `SCHEMAS`, `MEMORY`, `TOOLS`.
- MIT license.

---

[Unreleased]: https://github.com/CloudCraftPro/ccp-rocky-builder-kit/compare/v0.3.0...HEAD
[0.3.0]: https://github.com/CloudCraftPro/ccp-rocky-builder-kit/releases/tag/v0.3.0
[0.2.0]: https://github.com/CloudCraftPro/ccp-rocky-builder-kit/releases/tag/v0.2.0
[0.1.0]: https://github.com/CloudCraftPro/ccp-rocky-builder-kit/releases/tag/v0.1.0
[0.0.1]: https://github.com/CloudCraftPro/ccp-rocky-builder-kit/releases/tag/v0.0.1

# Migrations — Evolving the Framework

Your Rocky workspace has hundreds of capture files, person files, index files. The day you decide to change a field name, add a category, or restructure the schema, you don't want to hand-edit them all.

This is the playbook for that day.

---

## Schema versioning

Every capture, person, and project file declares its schema version in the front-matter:

```yaml
---
schema_version: 1.0
id: T-20260601-002
type: Task
...
---
```

`SCHEMAS.md` declares the **current** schema version at the top. When `SCHEMAS.md` says `1.1` and a capture file says `1.0`, that file is on an older schema and may need migrating before it's safely usable.

This sounds bureaucratic. It is, slightly. It also takes seconds per file and saves hours of "why is half my workspace broken" later.

---

## The semver convention

| Change type | Bump |
|---|---|
| Add a new field with a sensible default | **PATCH** (`1.0` → `1.0.1`) — existing files keep working, new files get the field |
| Add a new category, new status enum value, or new optional section | **MINOR** (`1.0` → `1.1`) — old files still parse but new features aren't available to them |
| Rename a field, change a required field, restructure file layout | **MAJOR** (`1.0` → `2.0`) — old files need migrating before use |

---

## When you make a schema change

1. **Update `SCHEMAS.md`** with the new field/format and bump the version at the top.
2. **Add a migration entry below** describing what changed and how to migrate old files.
3. **Decide your migration strategy:**
   - **Lazy:** old files keep their old version. New files get the new schema. Migrate individual files only when you touch them. Fine for additive changes.
   - **Eager:** run a one-time migration over the whole workspace. Required for breaking changes (renamed fields, changed required fields).
4. **Ask your assistant to do the migration.** Modern AI tools can read every file in a directory, transform it per a spec, and write it back. Give it the migration entry below as the spec.

---

## Migration log

Track every schema change here. Newest first.

### `1.0` — Initial schema (2026-MM-DD)

- Front-matter convention adopted: every capture, person, and project file starts with a YAML block bounded by `---`.
- `schema_version` field added to all file types.
- All other fields as described in `SCHEMAS.md`.

**Migration from pre-versioned workspaces:**
- Pre-1.0 files used a bullet-list header (`- **Type:** task`) instead of YAML front-matter.
- Migration: ask your assistant to "Convert every `.md` file under `captures/`, `projects/`, and `people/` from the bullet-header format to YAML front-matter with `schema_version: 1.0`. Preserve all field values exactly. Move the body content (anything after the header) unchanged."
- Verify with `./validate.sh` after migration.

---

## Adding new categories

Rocky ships with five capture types (Q/D/T/C/X) plus Project as a container. If you find yourself needing a sixth — say, **Risks (R)** for compliance-heavy work — here's the change footprint:

1. **Schema:** add the new type to the `type:` enum in `SCHEMAS.md`. Add a section for the new type's category-specific fields. Bump to MINOR.
2. **AGENTS.md:** add to the "Six categories" list (it's seven now), update classification rules, update file-naming convention (`R-YYYYMMDD-NNN.md`).
3. **Directory structure:** `mkdir captures/R` and update bootstrap script if you maintain it.
4. **Indexes:** the existing `captures/_index.md` format already handles arbitrary types. No change needed.
5. **Existing captures:** no migration needed — they keep their old category. New captures can use the new type.

The framework deliberately doesn't enforce the original six. They're a strong default, not a constraint. Fork and reshape.

---

## Common mistakes

- **Don't migrate without a backup.** Even a simple "rename field X to Y" can hit edge cases. `cp -r ~/my-rocky ~/my-rocky.bak.YYYY-MM-DD` first.
- **Don't try to migrate captures that are years old and you'll never read again.** Mark them frozen on the old schema, exclude them from active indexes, move on.
- **Don't change the schema mid-project.** Finish what you're tracking on the current schema, then migrate during a quiet week.

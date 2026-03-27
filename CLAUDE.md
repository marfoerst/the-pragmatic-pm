# CLAUDE.md — Project Instructions

This is a Claude Code plugin called **The Pragmatic PM Toolkit**. It contains PM skills, agents, and workflows — all as markdown files. There is no application code.

## Project Structure

```
.claude-plugin/     — Plugin manifest (plugin.json + marketplace.json)
agents/             — 5 orchestrator agents (markdown)
skills/             — 43 skills + 4 workflows (each in its own directory as SKILL.md)
hooks/              — 4 automation hooks (JS scripts + hooks.json)
domain-context.md   — Company/product/persona context (customized per user)
personal-context.md — User's role, seniority, preferences (personal, may be gitignored)
CHANGELOG.md        — Release notes for all versions
```

## Key Conventions

- **Every skill** reads `domain-context.md` and `personal-context.md` in its opening paragraph
- **Frontmatter** uses YAML with `name` and `description` fields (description includes trigger phrases)
- **Skills** follow a phase-based interaction: ask questions first, then generate, then iterate
- **Workflows** chain multiple skills with checkpoint-driven artifact handoffs and support mid-entry
- **Agents** route user intent to the right skill, asking clarifying questions first
- **No hardcoded examples** — all domain-specific content comes from `domain-context.md`

## When Editing Skills

- Preserve the YAML frontmatter exactly
- Keep the `domain-context.md` and `personal-context.md` references in the opening paragraph
- Maintain the ask-then-generate pattern — never skip to output without questions
- Include both leading AND lagging indicators in any metrics section
- Add Anti-Patterns sections to catch common mistakes
- Test mentally: would this produce useful output for a junior PM AND a senior PM?

## When Adding Skills

- Directory: `skills/pm-{name}/SKILL.md`
- Register in `skills/pm-hub/SKILL.md` under the right category
- Register in `README.md` in the matching table
- Follow the existing quality standard (see pm-ai-pricing or pm-battlecard as reference)

## Version Management

- Versions tracked in `.claude-plugin/plugin.json` and `.claude-plugin/marketplace.json`
- Changelog in `CHANGELOG.md`
- Bump minor version for new skills/features, patch for fixes

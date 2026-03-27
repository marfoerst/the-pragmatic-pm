# Contributing to The Pragmatic PM Toolkit

Thanks for your interest in contributing. This toolkit is built for product managers by product managers.

## How to Contribute

### Improve an Existing Skill

1. Fork the repo
2. Edit the `SKILL.md` file in the relevant `skills/` directory
3. Follow the existing structure (YAML frontmatter, phases, templates, anti-patterns)
4. Submit a PR with a clear description of what you changed and why

### Add a New Skill

1. Create a new directory: `skills/pm-{your-skill-name}/SKILL.md`
2. Follow the skill template below
3. Add your skill to `skills/pm-hub/SKILL.md` in the appropriate category
4. Add your skill to `README.md` in the matching table
5. Submit a PR

### Skill Template

Every skill must have:

```yaml
---
name: pm-{skill-name}
description: >
  What this skill does. 2-3 sentences.
  Use when someone says "{trigger phrase 1}", "{trigger phrase 2}", "{trigger phrase 3}".
---
```

Then in the body:

- **Opening:** `You are a [role] helping a product leadership team. **Read \`domain-context.md\`** at the plugin root...` Also reference `personal-context.md`.
- **Intent Detection:** When to activate this skill
- **Process:** Phase-based interaction (ask questions first, then generate)
- **Templates:** Markdown code blocks with placeholder text
- **Quality Checks / Anti-Patterns:** What to watch for
- **Tone:** How the skill communicates
- **Language:** Reference `domain-context.md` for preferences
- **Output Destination:** Ask where to deliver (chat / file / Notion)

### Add a New Agent

1. Create a new file: `agents/pm-{agent-name}.md`
2. Follow the agent template (YAML frontmatter with `name`, `description`, `tools`)
3. Define routing logic: intent -> skill mapping
4. Add to `README.md` agents table

### Fix a Bug or Typo

Just submit a PR. No issue needed for small fixes.

## Quality Standards

- **Problem-first:** Every skill must enforce "why before what"
- **Leading + lagging:** Every metric section must include both
- **Scope discipline:** PRDs and specs must have explicit non-goals
- **Domain-aware:** Reference `domain-context.md`, don't hardcode company-specific examples
- **Personal-aware:** Reference `personal-context.md` to adapt depth to user seniority
- **Tested:** Run your skill mentally through a realistic scenario before submitting

## What We Don't Accept

- Skills that duplicate existing skills (check `pm-hub` first)
- Skills that are developer tools, not PM tools
- Skills without the ask-first interaction pattern (no blind generation)
- Skills that hardcode company-specific examples instead of referencing `domain-context.md`

## Code of Conduct

Be constructive. This is a tool for PMs — treat contributions like you'd treat a colleague's PRD review. Direct, specific, positive-first.

## License

By contributing, you agree that your contributions will be licensed under the MIT License.

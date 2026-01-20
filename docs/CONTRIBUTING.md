# Contributing Guide

Thank you for your interest in contributing to Antigravity Full Stack HQ!

## How to Contribute

### Reporting Issues

1. Check existing issues first
2. Use issue templates if available
3. Include:
   - Clear description
   - Steps to reproduce
   - Expected vs actual behavior
   - Environment details

### Suggesting Features

1. Open an issue with `[Feature]` prefix
2. Describe the use case
3. Explain why it would be valuable

### Submitting Changes

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/my-feature`
3. Make your changes
4. Test thoroughly
5. Commit with conventional commits: `feat: add new skill`
6. Push to your fork
7. Open a Pull Request

## Development Guidelines

### Adding Agents

Agent files should:
- Have clear `name` and `description` in frontmatter
- Define expertise areas
- Include guiding principles
- Specify response format
- List what the agent does NOT do

Template:

```markdown
---
name: agent-name
description: Clear description. Use when [specific situations].
---

# Agent Name

You are a [role] specializing in [expertise].

## Core Expertise
- Area 1
- Area 2

## Guiding Principles
- Principle 1
- Principle 2

## Response Format
1. Step 1
2. Step 2

## What I Do Not Do
- Thing 1
- Thing 2
```

### Adding Skills

Skill folders should:
- Contain a `SKILL.md` file
- Have clear activation triggers in description
- Include "Use when" and "Do not use when" sections

Template:

```markdown
---
name: skill-name
description: Clear description. Use when [triggers].
---

# Skill Name

## Use This Skill When
- Trigger 1
- Trigger 2

## Do Not Use When
- Exception 1

## Instructions
...
```

### Adding Workflows

Workflow files should:
- Define a clear command (e.g., `/myworkflow`)
- Have step-by-step process
- Include output format template

Template:

```markdown
---
name: workflow-name
description: What it does.
command: /command
---

# Workflow Name

## Purpose
...

## Process
### Step 1
### Step 2

## Output Format
...
```

## Code Style

- Use Markdown for all documentation
- Keep lines under 100 characters when possible
- Use code blocks with language identifiers
- Use tables for structured data

## Testing Your Changes

Before submitting:

1. Install your changes locally
2. Restart Antigravity
3. Test affected functionality
4. Verify no regressions

## Commit Messages

Follow Conventional Commits:

- `feat:` new feature
- `fix:` bug fix
- `docs:` documentation
- `chore:` maintenance
- `refactor:` code restructure

Examples:
- `feat: add rust-patterns skill`
- `fix: correct typo in architect agent`
- `docs: update installation instructions`

## Pull Request Process

1. Update README if needed
2. Update CHANGELOG.md
3. Ensure CI passes (if configured)
4. Request review
5. Address feedback
6. Squash commits if requested

## Code of Conduct

- Be respectful and inclusive
- Provide constructive feedback
- Help others learn
- Credit others' work

## Questions?

Open an issue with `[Question]` prefix or start a discussion.

Thank you for contributing!

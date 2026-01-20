# Customization Guide

This guide explains how to customize the Full Stack HQ to match your preferences and tech stack.

## Customizing GEMINI.md

The `GEMINI.md` file is the core configuration. Edit `~/.gemini/GEMINI.md` to customize.

### Change Tech Stack

Find the "Tech Stack Defaults" section and modify:

```markdown
## Tech Stack Defaults (Unless Explicitly Overridden)

### Frontend
- **Framework**: Vue.js           # Changed from Next.js
- **Language**: TypeScript
- **Styling**: UnoCSS             # Changed from Tailwind

### Backend
- **Primary**: Express.js         # Changed from NestJS
```

### Change Code Style

```markdown
## Code Style

### TypeScript / JavaScript
- Semicolons required             # Changed from no semicolons
- Double quotes (" not ')         # Changed from single quotes
- 4 spaces indentation            # Changed from 2 spaces
```

### Change Approval Keywords

```markdown
### Explicit Approval Keywords

- `GO`
- `YES`
- `APPROVED`
- `LET'S DO IT`
```

### Add Forbidden Patterns

```markdown
## Forbidden Patterns

- `any` type in TypeScript
- `console.log` in production
- `eval()` anywhere
- `document.write()`
- Inline styles in React          # Added
```

### Change Git Conventions

```markdown
### Commits

Use Gitmoji format:
- `:sparkles:` new feature
- `:bug:` bug fix
- `:recycle:` refactor
```

## Adding Custom Agents

Create a new file in `~/.gemini/antigravity/agents/`:

```markdown
---
name: my-custom-agent
description: Description of what this agent does. Use when [specific situations].
---

# My Custom Agent

You are a [role] specializing in [expertise].

## Core Expertise
- ...

## Guiding Principles
- ...

## Response Format
1. ...
2. ...

## What I Do Not Do
- ...
```

## Adding Custom Skills

Create a new folder in `~/.gemini/antigravity/skills/`:

```
~/.gemini/antigravity/skills/my-skill/
└── SKILL.md
```

SKILL.md template:

```markdown
---
name: my-skill
description: Description for when this skill activates. Use when [triggers].
---

# My Skill

## Use This Skill When
- ...

## Do Not Use When
- ...

## Instructions
...
```

## Adding Custom Workflows

Create a new file in `~/.gemini/antigravity/workflows/`:

```markdown
---
name: my-workflow
description: What this workflow does.
command: /mycommand
---

# My Workflow

## Purpose
...

## Process
### Step 1: ...
### Step 2: ...

## Output Format
...
```

## Per-Project Customization

For project-specific rules, create `.agent/rules/` in your project:

```
my-project/
└── .agent/
    └── rules/
        └── PROJECT.md
```

PROJECT.md example:

```markdown
---
name: project-rules
activation: always
---

# Project-Specific Rules

This project uses:
- MongoDB instead of PostgreSQL
- Mongoose instead of Prisma
- Express instead of NestJS

Override global rules accordingly.
```

## Tips

### Keep It Simple

Do not over-customize. Start with defaults and adjust as needed.

### Test Changes

After modifying GEMINI.md:
1. Restart Antigravity
2. Start new conversation
3. Test with a simple prompt

### Version Control

Consider keeping your customizations in a Git repo:

```bash
cd ~/.gemini
git init
git add .
git commit -m "My Antigravity configuration"
```

### Share Team Settings

For team consistency, share customizations via:
1. Team Git repository
2. Shared installation script
3. Documentation

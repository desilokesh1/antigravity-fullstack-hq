---
name: global-rules
description: Global rules and constraints for all workspaces. Always active.
activation: always
---

# Global Agent Rules

You are assisting a senior developer who values clarity, maintainability, and explicit control over automation. Follow these rules strictly across all projects.

---

## Core Principles

### Permission-First Workflow
- **NEVER** execute commands, create files, or initialize frameworks without explicit approval
- **NEVER** make assumptions about project structure or user intent
- **NEVER** say "usually done this way" or make generic suggestions
- Always follow: **Plan -> Approval -> Execute**

### Explicit Approval Keywords
The agent may only proceed with execution when one of the following exact phrases is present in the user's message:

- `PLAN APPROVED`
- `IMPLEMENTATION APPROVED`
- `PROCEED`
- `DO IT`

Any variation, partial approval, or implied consent must be treated as **NOT approved**.
When in doubt, ask: "Please confirm with PLAN APPROVED or IMPLEMENTATION APPROVED to proceed."

### Conversation Hygiene
- If a conversation transitions from planning to execution without explicit approval, **stop immediately** and request confirmation
- If context becomes unclear or contradictory, ask for clarification rather than assuming
- If a conversation becomes polluted with mixed instructions, suggest starting a new conversation

### Communication Style
- Be concise and direct first
- Expand only when asked or when complexity requires it
- No filler phrases, no excessive politeness
- When suggesting code: state your recommendation clearly, explain why briefly, then ask for approval

---

## Tech Stack Defaults (Unless Explicitly Overridden)

These are the preferred technologies. If a project uses different tools, follow that project's conventions instead.

### Frontend
- **Framework**: Next.js (App Router)
- **Language**: TypeScript (strict mode)
- **Styling**: Tailwind CSS
- **Animation**: Framer Motion / GSAP (only in premium projects, use sparingly)
- **State**: Prefer React hooks, Zustand if needed

### Backend
- **Primary**: NestJS with TypeScript
- **Secondary**: Next.js API Routes (small services only)
- **Validation**: class-validator + class-transformer (NestJS)

### Database
- **Primary**: PostgreSQL
- **ORM**: Prisma
- **MongoDB**: Avoid unless explicitly requested

---

## Code Style

### General
- Language for code, comments, commits: **English**
- Documentation: English (Turkish supplementary notes acceptable)

### TypeScript / JavaScript
- No semicolons
- Single quotes (' not ")
- 2 spaces indentation (no tabs)
- Prefer const, use let only when necessary
- Prefer arrow functions
- Prefer early returns over nested conditions
- Explicit return types for functions

### React / Next.js
- Functional components only
- Named exports (no default exports except pages)
- Props interface: {ComponentName}Props
- Colocate styles, tests, and types with components
- Use 'use client' / 'use server' directives explicitly

### NestJS
- Follow module-based architecture
- One entity per file
- DTOs for all request/response
- Use guards and interceptors appropriately

### Prisma
- Schema changes require migration plan approval first
- Always generate client after schema changes
- Use transactions for multi-table operations

---

## Git Conventions

### Commits
Follow Conventional Commits strictly:
- `feat:` new feature
- `fix:` bug fix
- `refactor:` code change without feature/fix
- `chore:` maintenance, dependencies
- `docs:` documentation only
- `test:` test additions or fixes
- `style:` formatting only (no code change)

Format: `type(scope): short description`
Example: `feat(auth): add JWT refresh token rotation`

### Branches
- `main` -> protected, production
- `dev` -> development integration
- `feature/<short-description>` -> new features
- `fix/<short-description>` -> bug fixes
- `hotfix/<short-description>` -> urgent production fixes

**IMPORTANT**: Never create branches autonomously. Always ask first.

---

## Testing Guidelines

### Frontend
- **Unit/Component**: Vitest
- **E2E**: Playwright (critical paths only)

### Backend
- **Unit/Integration**: Jest

### Philosophy
- No 100% coverage obsession
- Test critical business logic and edge cases
- Test what breaks, not what works obviously
- If test scope is unclear, ask before proposing tests

---

## CI/CD Boundaries

Agent capabilities:
- Suggest pipeline improvements (high-level only, no YAML, no implementation details)
- Review existing workflows
- Explain CI/CD concepts
- **CANNOT** create or modify pipeline files
- **CANNOT** trigger deployments
- **CANNOT** push to remote

---

## Error Handling Protocol

When you encounter an error or issue:

1. **Report** - Describe what went wrong
2. **Analyze** - Explain the likely cause
3. **Impact** - What does this affect?
4. **Options** - Provide 2-3 solution paths
5. **Wait** - Ask which approach to take

Never auto-fix. Always get approval.

---

## Code Suggestions Protocol

When suggesting code changes:

1. **State recommendation** - "I suggest X"
2. **Brief reasoning** - "Because Y" (1-2 sentences)
3. **Show alternative** - "Alternatively, Z would..."
4. **Ask** - "Should I proceed with X?"

Never implement without confirmation.

---

## Forbidden Patterns

These are explicitly banned:
- `any` type in TypeScript (use `unknown` if truly needed)
- `console.log` in production code (use proper logging)
- Hardcoded secrets or API keys
- `var` keyword
- Default exports (except Next.js pages/layouts)
- CSS-in-JS (use Tailwind)
- Class components in React
- Relative imports crossing module boundaries (use path aliases)

---

## Response Format Preferences

### For explanations
- Start with the answer/solution
- Add context only if necessary
- Use code blocks with proper language tags

### For code reviews
- List issues by severity (critical -> minor)
- Be specific about line/location
- Suggest fix, don't just point out problems

### For planning
- Numbered steps
- Clear deliverables per step
- Explicit approval checkpoints marked with [APPROVAL NEEDED]

---

## Quick Reference

| Action | Allowed? |
|--------|----------|
| Suggest code | Yes (with approval) |
| Create files | No (ask first) |
| Run commands | No (ask first) |
| Create branches | No (ask first) |
| Modify CI/CD | No |
| Deploy | No |
| Install packages | No (ask first) |
| Database migrations | No (plan only) |
| Propose tests | Yes (ask if scope unclear) |

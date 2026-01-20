---
name: enhance
description: Improve existing code through refactoring, optimization, or cleanup. Use when improving code quality.
command: /enhance
---

# Enhance Workflow

## Purpose

Systematically improve existing code without changing functionality.

## Process

### Step 1: Understand

- What does this code do?
- Why does it exist?
- What are its dependencies?

### Step 2: Identify Issues

- Code smells
- Performance problems
- Maintainability concerns
- Missing tests

### Step 3: Plan Changes

- List improvements
- Prioritize by impact
- Ensure safe refactoring

### Step 4: Implement

- One change at a time
- Verify after each change
- Keep commits focused

### Step 5: Verify

- Tests still pass
- Behavior unchanged
- Performance acceptable

## Output Format

```markdown
## Enhancing: [File/Component Name]

### Current State
[Brief description of current implementation]

### Issues Identified

1. **[Issue]** - [Impact]
2. **[Issue]** - [Impact]

### Proposed Improvements

#### Improvement 1: [Name]
- **What:** [Change description]
- **Why:** [Benefit]
- **Risk:** Low/Medium/High

#### Improvement 2: [Name]
...

### Implementation Order

1. [First change] - safest, enables others
2. [Second change]
...

[APPROVAL NEEDED]

### Verification

- [ ] All tests pass
- [ ] Behavior unchanged
- [ ] Performance acceptable
```

## Types of Enhancements

- **Refactor**: Restructure without changing behavior
- **Optimize**: Improve performance
- **Cleanup**: Remove dead code, improve naming
- **Modernize**: Update to newer patterns/APIs

## When to Use

- Technical debt reduction
- Performance optimization
- Code cleanup
- Pattern updates

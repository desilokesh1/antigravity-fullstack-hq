---
name: plan
description: Create detailed task breakdown and implementation plan. Use before starting complex work.
command: /plan
---

# Plan Workflow

## Purpose

Break down complex tasks into manageable steps with clear deliverables and checkpoints.

## Process

### Step 1: Define Scope

- What exactly needs to be built?
- What is out of scope?
- What are the acceptance criteria?

### Step 2: Identify Components

- Break into logical parts
- Identify dependencies
- Note reusable elements

### Step 3: Sequence Tasks

- Order by dependencies
- Identify parallel work
- Mark critical path

### Step 4: Estimate Effort

- Size each task (S/M/L)
- Identify risks
- Add buffer for unknowns

### Step 5: Create Plan

- Write step-by-step instructions
- Add approval checkpoints
- Define done criteria

## Output Format

```markdown
## Overview

[Brief description of what we're building]

## Scope

**In Scope:**
- ...

**Out of Scope:**
- ...

## Implementation Plan

### Phase 1: [Name]

#### Task 1.1: [Description]
- Deliverable: ...
- Estimate: S/M/L
- Dependencies: None

#### Task 1.2: [Description]
...

[APPROVAL CHECKPOINT]

### Phase 2: [Name]
...

## Risks

| Risk | Mitigation |
|------|------------|
| ... | ... |

## Success Criteria

- [ ] Criterion 1
- [ ] Criterion 2
```

## When to Use

- Starting a new feature
- Complex refactoring
- Multi-step implementations
- When clarity is needed

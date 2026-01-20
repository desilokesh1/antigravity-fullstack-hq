---
name: debug
description: Systematic debugging process for finding and fixing issues. Use when troubleshooting bugs.
command: /debug
---

# Debug Workflow

## Purpose

Systematically identify, analyze, and fix bugs with proper verification.

## Process

### Step 1: Reproduce

- Get exact steps to reproduce
- Identify environment details
- Note expected vs actual behavior

### Step 2: Isolate

- When did it start happening?
- What changed recently?
- Does it happen consistently?

### Step 3: Investigate

- Check error messages
- Review relevant logs
- Trace code execution
- Identify suspects

### Step 4: Hypothesize

- Form theory about cause
- Predict what fix should change
- Consider side effects

### Step 5: Fix

- Implement minimal fix
- Avoid unnecessary changes
- Document the fix

### Step 6: Verify

- Confirm original issue fixed
- Check for regressions
- Test edge cases

### Step 7: Prevent

- Add test for this case
- Consider similar bugs
- Update documentation if needed

## Output Format

```markdown
## Bug Report

**Symptom:** [What's happening]
**Expected:** [What should happen]
**Environment:** [Relevant details]

## Investigation

### Steps Taken
1. ...
2. ...

### Findings
- ...

## Root Cause

[Explanation of why it's happening]

## Fix

**File:** `path/to/file.ts`
**Change:** [Description]

## Verification

- [ ] Original issue fixed
- [ ] No regressions
- [ ] Test added

## Prevention

- [ ] Similar cases checked
```

## When to Use

- Bug reports
- Unexpected behavior
- Error investigation
- Performance issues

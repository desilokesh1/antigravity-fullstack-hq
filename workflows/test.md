---
name: test
description: Generate and organize tests for code. Use when adding test coverage.
command: /test
---

# Test Workflow

## Purpose

Systematically create meaningful tests that provide confidence in code quality.

## Process

### Step 1: Analyze

- What needs testing?
- What are the critical paths?
- What edge cases exist?

### Step 2: Categorize

- Unit tests (isolated logic)
- Integration tests (components working together)
- E2E tests (critical user flows)

### Step 3: Plan Tests

- List test cases
- Prioritize by importance
- Identify mocking needs

### Step 4: Implement

- Follow testing patterns
- Keep tests focused
- Use descriptive names

### Step 5: Verify

- Tests pass
- Coverage adequate
- No flaky tests

## Output Format

```markdown
## Testing: [Component/Function Name]

### Test Strategy

**Type:** Unit / Integration / E2E
**Framework:** Vitest / Jest / Playwright

### Test Cases

#### Happy Path
- [ ] [Test case 1]
- [ ] [Test case 2]

#### Edge Cases
- [ ] [Edge case 1]
- [ ] [Edge case 2]

#### Error Cases
- [ ] [Error case 1]

### Mocking Requirements

- [Dependency 1]: [Mock strategy]

### Implementation

[APPROVAL NEEDED]

#### Test File: `__tests__/component.test.ts`

```typescript
describe('ComponentName', () => {
  it('should ...', () => {
    // Test implementation
  })
})
```
```

## Testing Patterns

### Unit Test

```typescript
describe('calculateTotal', () => {
  it('should sum items correctly', () => {
    const result = calculateTotal([10, 20, 30])
    expect(result).toBe(60)
  })

  it('should return 0 for empty array', () => {
    expect(calculateTotal([])).toBe(0)
  })
})
```

### Component Test

```typescript
describe('UserCard', () => {
  it('should display user name', () => {
    render(<UserCard user={{ name: 'John' }} />)
    expect(screen.getByText('John')).toBeInTheDocument()
  })
})
```

## When to Use

- Adding test coverage
- Before refactoring
- After fixing bugs
- New feature development

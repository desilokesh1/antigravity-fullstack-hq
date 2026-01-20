---
name: prompt-engineering
description: Comprehensive prompt engineering framework for designing, optimizing, and iterating LLM prompts. Use when creating prompts, optimizing existing prompts, or improving AI instructions.
---

# Prompt Engineering

## Workflow

```
User Request
|
+-- "Create a prompt" --> EXPLORATION PHASE
+-- "Optimize this prompt" --> OPTIMIZATION PHASE
+-- "Fix this issue" --> ANALYSIS PHASE
```

## Phase 1: Exploration

Before creating any prompt, understand:

- What task will this prompt accomplish?
- Who will use it?
- What does success look like?
- What are the constraints?

## Phase 2: Analysis

### Task Classification

| Dimension | Options |
|-----------|---------|
| Complexity | Simple vs multi-step |
| Output | Creative vs analytical vs structured |
| Stakes | High vs experimental |

### Strategy Selection

| Task Type | Approach |
|-----------|----------|
| Simple | Direct instructions |
| Complex | Chain-of-thought |
| Creative | Role setting |
| Structured | Format specs + examples |

## Phase 3: Implementation

### Version 1 - Minimal
- Core instructions only
- Test basic functionality

### Version 2 - Enhanced
- Add examples
- Clarify ambiguities
- Add constraints

### Version 3+ - Optimized
- Refine wording
- Remove redundancy

## Key Techniques

### Role Setting

```
As an experienced code reviewer, analyze...
```

### Chain-of-Thought

```
Think step-by-step:
1. First, identify...
2. Then, analyze...
3. Finally, conclude...
```

### Few-Shot Learning

```
Example 1:
Input: "Great product"
Output: { "sentiment": "positive" }

Now analyze: "It was okay"
```

### Explicit Constraints

```
- Limit to 3 paragraphs
- Focus on technical aspects only
- Do not include pricing
```

## Prompt Template

```markdown
## Context
[Background information]

## Role (Optional)
You are a [ROLE] with expertise in [DOMAIN].

## Task
[Clear instruction]

## Constraints
- Constraint 1
- Constraint 2

## Output Format
[Format specification]

## Examples (Optional)
[Input/Output examples]
```

## Common Mistakes

| Mistake | Fix |
|---------|-----|
| Vague instructions | Be specific |
| No examples | Add 1-2 examples |
| Too many rules | Simplify |
| No format spec | Define output structure |

# Setup Guide

## Prerequisites

- [Google Antigravity IDE](https://antigravity.google) installed
- Git installed
- PowerShell (Windows) or Bash (Mac/Linux)

## Installation Methods

### Method 1: Quick Install (Recommended)

#### Windows

```powershell
# One-line install
irm https://raw.githubusercontent.com/YOUR_USERNAME/antigravity-fullstack-hq/main/install.ps1 | iex
```

#### Mac/Linux

```bash
# One-line install
curl -fsSL https://raw.githubusercontent.com/YOUR_USERNAME/antigravity-fullstack-hq/main/install.sh | bash
```

### Method 2: Manual Install

```bash
# Clone the repository
git clone https://github.com/YOUR_USERNAME/antigravity-fullstack-hq.git
cd antigravity-fullstack-hq

# Windows
.\install.ps1

# Mac/Linux
chmod +x install.sh
./install.sh
```

### Method 3: Selective Install

If you only want specific components:

```bash
# Clone first
git clone https://github.com/YOUR_USERNAME/antigravity-fullstack-hq.git
cd antigravity-fullstack-hq

# Copy only what you need
cp gemini/GEMINI.md ~/.gemini/
cp -r skills/nestjs-patterns ~/.gemini/antigravity/skills/
cp -r agents/database-specialist.md ~/.gemini/antigravity/agents/
```

## Post-Installation

### 1. Restart Antigravity

Close and reopen Antigravity IDE for changes to take effect.

### 2. Verify Installation

Test with a simple prompt:

```
Create a React component called UserCard
```

The agent should:
- Ask for approval before creating files
- Present a plan first
- Wait for your confirmation

### 3. Test Workflows

```
/brainstorm authentication approaches for a SaaS app
/plan Create a user management module
```

## Installation Options

### Windows (install.ps1)

```powershell
# Force overwrite existing files
.\install.ps1 -Force

# Skip GEMINI.md (keep your existing rules)
.\install.ps1 -SkipGemini
```

### Mac/Linux (install.sh)

```bash
# Force overwrite existing files
./install.sh --force

# Skip GEMINI.md (keep your existing rules)
./install.sh --skip-gemini
```

## File Locations

After installation, files are located at:

| Component | Location |
|-----------|----------|
| GEMINI.md | `~/.gemini/GEMINI.md` |
| Agents | `~/.gemini/antigravity/agents/` |
| Skills | `~/.gemini/antigravity/skills/` |
| Workflows | `~/.gemini/antigravity/workflows/` |

## Troubleshooting

### Agent not following rules

1. Ensure GEMINI.md exists at `~/.gemini/GEMINI.md`
2. Restart Antigravity
3. Start a new conversation

### Workflows not working

1. Check files exist in `~/.gemini/antigravity/workflows/`
2. Restart Antigravity
3. Use exact command: `/brainstorm`, `/plan`, etc.

### Skills not activating

1. Check files exist in `~/.gemini/antigravity/skills/`
2. Each skill should have a `SKILL.md` file
3. Restart Antigravity

## Uninstallation

To remove all installed files:

```bash
# Windows
Remove-Item -Recurse -Force "$env:USERPROFILE\.gemini\antigravity"

# Mac/Linux
rm -rf ~/.gemini/antigravity
```

To remove everything including GEMINI.md:

```bash
# Windows
Remove-Item -Recurse -Force "$env:USERPROFILE\.gemini"

# Mac/Linux
rm -rf ~/.gemini
```

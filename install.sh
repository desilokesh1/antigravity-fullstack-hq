#!/bin/bash
# install.sh
# Antigravity Full Stack HQ - Mac/Linux Installation Script

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Variables
GEMINI_HOME="$HOME/.gemini"
SKILLS_DIR="$GEMINI_HOME/antigravity/skills"
WORKFLOWS_DIR="$GEMINI_HOME/antigravity/workflows"
AGENTS_DIR="$GEMINI_HOME/antigravity/agents"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Parse arguments
FORCE=false
SKIP_GEMINI=false

while [[ "$#" -gt 0 ]]; do
    case $1 in
        -f|--force) FORCE=true ;;
        --skip-gemini) SKIP_GEMINI=true ;;
        *) echo "Unknown parameter: $1"; exit 1 ;;
    esac
    shift
done

echo ""
echo -e "${CYAN}================================================================${NC}"
echo -e "${CYAN}     ANTIGRAVITY FULL STACK HQ - INSTALLATION                  ${NC}"
echo -e "${CYAN}================================================================${NC}"
echo ""

# Pre-flight checks
echo -e "${YELLOW}> Pre-flight Checks${NC}"
echo "--------------------------------------------------"

if ! command -v git &> /dev/null; then
    echo -e "${RED}[ERROR] Git not found! Please install Git first.${NC}"
    exit 1
fi
echo -e "${GREEN}  [OK] Git found${NC}"

# Check existing installation
if [[ -f "$GEMINI_HOME/GEMINI.md" ]] && [[ "$FORCE" != true ]] && [[ "$SKIP_GEMINI" != true ]]; then
    echo ""
    echo -e "${YELLOW}  [WARNING] GEMINI.md already exists!${NC}"
    echo -e "${YELLOW}  Use --force to overwrite or --skip-gemini to keep existing.${NC}"
    read -p "  Overwrite? (y/N) " response
    if [[ "$response" != "y" && "$response" != "Y" ]]; then
        SKIP_GEMINI=true
    fi
fi

# Create directories
echo ""
echo -e "${YELLOW}> Creating Directories${NC}"
echo "--------------------------------------------------"

mkdir -p "$GEMINI_HOME"
mkdir -p "$SKILLS_DIR"
mkdir -p "$WORKFLOWS_DIR"
mkdir -p "$AGENTS_DIR"

echo -e "${GREEN}  [OK] ~/.gemini${NC}"
echo -e "${GREEN}  [OK] ~/.gemini/antigravity/skills${NC}"
echo -e "${GREEN}  [OK] ~/.gemini/antigravity/workflows${NC}"
echo -e "${GREEN}  [OK] ~/.gemini/antigravity/agents${NC}"

# Install GEMINI.md
echo ""
echo -e "${YELLOW}> Installing GEMINI.md${NC}"
echo "--------------------------------------------------"

if [[ "$SKIP_GEMINI" == true ]]; then
    echo -e "  [SKIP] GEMINI.md (keeping existing)"
else
    cp "$SCRIPT_DIR/gemini/GEMINI.md" "$GEMINI_HOME/GEMINI.md"
    echo -e "${GREEN}  [OK] GEMINI.md installed${NC}"
fi

# Install Agents
echo ""
echo -e "${YELLOW}> Installing Agents${NC}"
echo "--------------------------------------------------"

if [[ -d "$SCRIPT_DIR/agents" ]]; then
    for agent in "$SCRIPT_DIR/agents"/*.md; do
        if [[ -f "$agent" ]]; then
            cp "$agent" "$AGENTS_DIR/"
            echo -e "${GREEN}  [OK] $(basename "$agent")${NC}"
        fi
    done
fi

# Install Skills
echo ""
echo -e "${YELLOW}> Installing Skills${NC}"
echo "--------------------------------------------------"

if [[ -d "$SCRIPT_DIR/skills" ]]; then
    for skill in "$SCRIPT_DIR/skills"/*/; do
        if [[ -d "$skill" ]]; then
            skill_name=$(basename "$skill")
            cp -r "$skill" "$SKILLS_DIR/"
            echo -e "${GREEN}  [OK] $skill_name${NC}"
        fi
    done
fi

# Install Workflows
echo ""
echo -e "${YELLOW}> Installing Workflows${NC}"
echo "--------------------------------------------------"

if [[ -d "$SCRIPT_DIR/workflows" ]]; then
    for workflow in "$SCRIPT_DIR/workflows"/*.md; do
        if [[ -f "$workflow" ]]; then
            cp "$workflow" "$WORKFLOWS_DIR/"
            echo -e "${GREEN}  [OK] $(basename "$workflow")${NC}"
        fi
    done
fi

# Summary
echo ""
echo -e "${GREEN}================================================================${NC}"
echo -e "${GREEN}                 INSTALLATION COMPLETE!                        ${NC}"
echo -e "${GREEN}================================================================${NC}"
echo ""

agent_count=$(find "$AGENTS_DIR" -maxdepth 1 -name "*.md" 2>/dev/null | wc -l | tr -d ' ')
skill_count=$(find "$SKILLS_DIR" -maxdepth 1 -type d 2>/dev/null | wc -l | tr -d ' ')
skill_count=$((skill_count - 1)) # Subtract 1 for the directory itself
workflow_count=$(find "$WORKFLOWS_DIR" -maxdepth 1 -name "*.md" 2>/dev/null | wc -l | tr -d ' ')

echo -e "${CYAN}Installed:${NC}"
echo "  GEMINI.md  : $GEMINI_HOME/GEMINI.md"
echo "  Agents     : $agent_count"
echo "  Skills     : $skill_count"
echo "  Workflows  : $workflow_count"
echo ""
echo -e "${YELLOW}Next Steps:${NC}"
echo "  1. Restart Antigravity"
echo "  2. Test: 'Create a React component called UserCard'"
echo "  3. Agent should ask for approval before creating"
echo ""

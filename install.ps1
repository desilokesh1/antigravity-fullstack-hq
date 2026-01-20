# install.ps1
# Antigravity Full Stack HQ - Windows Installation Script

param(
    [switch]$Force,
    [switch]$SkipGemini
)

$ErrorActionPreference = "Stop"

Write-Host ""
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host "     ANTIGRAVITY FULL STACK HQ - INSTALLATION                  " -ForegroundColor Cyan
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host ""

# Variables
$GEMINI_HOME = "$env:USERPROFILE\.gemini"
$SKILLS_DIR = "$GEMINI_HOME\antigravity\skills"
$WORKFLOWS_DIR = "$GEMINI_HOME\antigravity\workflows"
$AGENTS_DIR = "$GEMINI_HOME\antigravity\agents"
$SCRIPT_DIR = Split-Path -Parent $MyInvocation.MyCommand.Path

# Helper functions
function Write-Step {
    param([string]$Message)
    Write-Host ""
    Write-Host "> $Message" -ForegroundColor Yellow
    Write-Host "--------------------------------------------------" -ForegroundColor DarkGray
}

function Write-Success {
    param([string]$Message)
    Write-Host "  [OK] $Message" -ForegroundColor Green
}

function Write-Skip {
    param([string]$Message)
    Write-Host "  [SKIP] $Message" -ForegroundColor DarkGray
}

# Pre-flight checks
Write-Step "Pre-flight Checks"

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "[ERROR] Git not found! Please install Git first." -ForegroundColor Red
    exit 1
}
Write-Success "Git found"

# Check existing installation
if ((Test-Path "$GEMINI_HOME\GEMINI.md") -and (-not $Force) -and (-not $SkipGemini)) {
    Write-Host ""
    Write-Host "  [WARNING] GEMINI.md already exists!" -ForegroundColor Yellow
    Write-Host "  Use -Force to overwrite or -SkipGemini to keep existing." -ForegroundColor Yellow
    $response = Read-Host "  Overwrite? (y/N)"
    if ($response -ne "y" -and $response -ne "Y") {
        $SkipGemini = $true
    }
}

# Create directories
Write-Step "Creating Directories"

$directories = @($GEMINI_HOME, $SKILLS_DIR, $WORKFLOWS_DIR, $AGENTS_DIR)
foreach ($dir in $directories) {
    New-Item -ItemType Directory -Force -Path $dir | Out-Null
    Write-Success $dir.Replace($env:USERPROFILE, "~")
}

# Install GEMINI.md
Write-Step "Installing GEMINI.md"

if ($SkipGemini) {
    Write-Skip "GEMINI.md (keeping existing)"
} else {
    Copy-Item "$SCRIPT_DIR\gemini\GEMINI.md" "$GEMINI_HOME\GEMINI.md" -Force
    Write-Success "GEMINI.md installed"
}

# Install Agents
Write-Step "Installing Agents"

$agentFiles = Get-ChildItem "$SCRIPT_DIR\agents" -Filter "*.md" -ErrorAction SilentlyContinue
foreach ($agent in $agentFiles) {
    Copy-Item $agent.FullName "$AGENTS_DIR\" -Force
    Write-Success $agent.Name
}

# Install Skills
Write-Step "Installing Skills"

$skillFolders = Get-ChildItem "$SCRIPT_DIR\skills" -Directory -ErrorAction SilentlyContinue
foreach ($skill in $skillFolders) {
    Copy-Item $skill.FullName "$SKILLS_DIR\" -Recurse -Force
    Write-Success $skill.Name
}

# Install Workflows
Write-Step "Installing Workflows"

$workflowFiles = Get-ChildItem "$SCRIPT_DIR\workflows" -Filter "*.md" -ErrorAction SilentlyContinue
foreach ($workflow in $workflowFiles) {
    Copy-Item $workflow.FullName "$WORKFLOWS_DIR\" -Force
    Write-Success $workflow.Name
}

# Summary
Write-Host ""
Write-Host "================================================================" -ForegroundColor Green
Write-Host "                 INSTALLATION COMPLETE!                        " -ForegroundColor Green
Write-Host "================================================================" -ForegroundColor Green
Write-Host ""

$agentCount = (Get-ChildItem "$AGENTS_DIR" -File -ErrorAction SilentlyContinue).Count
$skillCount = (Get-ChildItem "$SKILLS_DIR" -Directory -ErrorAction SilentlyContinue).Count
$workflowCount = (Get-ChildItem "$WORKFLOWS_DIR" -File -ErrorAction SilentlyContinue).Count

Write-Host "Installed:" -ForegroundColor Cyan
Write-Host "  GEMINI.md  : $GEMINI_HOME\GEMINI.md" -ForegroundColor White
Write-Host "  Agents     : $agentCount" -ForegroundColor White
Write-Host "  Skills     : $skillCount" -ForegroundColor White
Write-Host "  Workflows  : $workflowCount" -ForegroundColor White
Write-Host ""
Write-Host "Next Steps:" -ForegroundColor Yellow
Write-Host "  1. Restart Antigravity" -ForegroundColor White
Write-Host "  2. Test: 'Create a React component called UserCard'" -ForegroundColor White
Write-Host "  3. Agent should ask for approval before creating" -ForegroundColor White
Write-Host ""

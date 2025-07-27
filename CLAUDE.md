# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a syncscripts repository containing bash aliases and an installation script for synchronizing shell configurations across multiple computers. The repository provides a centralized way to manage and deploy consistent bash aliases across different systems.

## Core Components

### bash_aliases
The main aliases file (`/Users/amit/repos/syncscripts/bash_aliases`) contains categorized shell aliases:
- GhostTTY configuration shortcuts (edit-config)
- Claude AI assistant shortcuts (ask, claude-update)

**Note**: This is currently a minimal set focused on specific tools. The repository structure supports adding more categorized aliases like:
- Directory navigation shortcuts (ll, la, .., ..., etc.)
- Git command shortcuts (gs, ga, gc, gp, etc.)
- System utilities (grep with color, history, path display)
- Safety aliases (interactive rm, cp, mv)
- Docker shortcuts (dps, di, dex)
- Python shortcuts (py, pip, venv)
- Archive operations (mktar, untar, etc.)
- System monitoring (meminfo, psmem, cpuinfo)

### install_aliases.sh
Installation script that automatically adds the bash_aliases file to shell profiles:
- Detects OS type (macOS vs Linux) and configures appropriate shell files
- Supports both bash (.bashrc, .bash_profile) and zsh (.zshrc)
- Prevents duplicate installations by checking for existing source lines
- Creates shell profile files if they don't exist
- Sets up both syncscripts aliases and personal aliases ($HOME/.bash_aliases)
- Enhanced duplicate detection for both repo and personal alias sources

### .claude/
Claude Code integration directory containing:
- **settings.local.json** - Local Claude Code settings and configuration
- **commands/sync.md** - Custom `/sync` command for automated git workflows
- Enables seamless AI-assisted development and automated sync operations

## Common Development Tasks

### Installing Aliases
```bash
# Run the installation script
./install_aliases.sh

# Or manually source the aliases
source bash_aliases
```

### Testing Changes
After modifying `bash_aliases`:
```bash
# Reload the current shell session
source bash_aliases
# or use the provided alias
reload
```

### Using Claude Code Integration
The repository includes Claude Code integration for automated workflows:
```bash
# Use the /sync command in Claude Code to:
# - Update documentation (CLAUDE.md, README.md)
# - Create git commits with proper formatting
# - Push changes to the repository
```

### Architecture Notes

The system follows a simple two-file architecture:
1. **bash_aliases** - Pure bash alias definitions organized by category
2. **install_aliases.sh** - Cross-platform installation logic with OS detection

The installation script uses shell detection and file existence checks to ensure compatibility across different Unix-like systems. It handles the differences between macOS (which prefers .bash_profile) and Linux systems (which typically use .bashrc).

The aliases are designed to be safe and non-destructive, with interactive confirmations for potentially dangerous operations (rm, cp, mv) and useful defaults for common commands.

## Publishing and Release Instructions

### README.md Updates
When making changes that affect functionality or adding new features:

1. **Always update README.md** to reflect new aliases, features, or usage instructions
2. **Keep the feature list current** - update the "What's Included" section when adding new alias categories
3. **Update installation instructions** if the setup process changes
4. **Review the Quick Start guide** to ensure it remains accurate

### Before Creating PRs or Pushing Changes
- Ensure README.md accurately describes all current functionality
- Test the installation script on the target platform
- Verify all example commands in README.md work as documented
- Check that the alias count in README.md matches actual aliases (~50+ currently)

### Documentation Standards
- Keep README.md concise but comprehensive
- Use clear headings and code blocks for commands
- Include examples for new aliases or features
- Maintain the same tone and structure as existing documentation
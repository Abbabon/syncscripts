# SyncScripts

A simple command-line tool to sync bash aliases and shell configurations across multiple computers.

## Features

- **Cross-platform**: Works on macOS and Linux
- **Shell agnostic**: Supports both bash and zsh
- **Safe installation**: Prevents duplicate installations
- **Extensible aliases**: Starter set with structure for adding more aliases
- **Claude Code integration**: Automated workflows with `/sync` command

## Quick Start

1. Clone this repository:
   ```bash
   git clone <your-repo-url>
   cd syncscripts
   ```

2. Install the aliases:
   ```bash
   ./install_aliases.sh
   ```

3. Restart your terminal or source your profile:
   ```bash
   source ~/.bashrc  # or ~/.bash_profile on macOS
   ```

## What's Included

The `bash_aliases` file contains organized aliases for:

- **GhostTTY configuration**: `edit-config` - Opens GhostTTY config in Sublime Text
- **Claude AI assistant**: `ask` - Quick Claude prompt interface, `claude-update` - Update Claude Code

**Note**: This is currently a minimal starter set. The repository structure supports adding more aliases as needed.

## How It Works

The installation script:

1. Detects your operating system and shell
2. Locates the appropriate shell profile file (`.bashrc`, `.bash_profile`, or `.zshrc`)
3. Adds source lines to load both the repository aliases and personal aliases
4. Creates the profile file if it doesn't exist
5. Prevents duplicate installations with enhanced detection

## Customization

Edit the `bash_aliases` file to add your own aliases, or create a personal `~/.bash_aliases` file for machine-specific aliases. The changes will be available after sourcing your shell profile or restarting your terminal.

## Claude Code Integration

The repository includes Claude Code integration for streamlined development:

- **`.claude/` directory**: Contains Claude Code settings and custom commands
- **`/sync` command**: Automates documentation updates, git commits, and repository syncing
- **`syncscripts.code-workspace`**: VS Code workspace file for optimal development experience
- **Automated workflows**: Maintains consistent documentation and git history

Use the `/sync` command in Claude Code to automatically update documentation and sync changes to the repository.

## Syncing Across Computers

To sync your aliases across multiple computers:

1. Customize the `bash_aliases` file on one machine
2. Commit and push your changes
3. Pull the repository on other machines
4. Run `./install_aliases.sh` on each machine

## License

MIT License - feel free to use and modify as needed.
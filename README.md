# SyncScripts

A simple command-line tool to sync bash aliases and shell configurations across multiple computers.

## Features

- **Cross-platform**: Works on macOS and Linux
- **Shell agnostic**: Supports both bash and zsh
- **Safe installation**: Prevents duplicate installations
- **Comprehensive aliases**: 50+ useful aliases for development and system administration

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

- **Directory navigation**: `ll`, `la`, `..`, `...`
- **Git shortcuts**: `gs`, `ga`, `gc`, `gp`, `gl`, `glog`
- **System utilities**: `grep`, `df`, `du`, `mount`
- **Safety aliases**: `rm -i`, `cp -i`, `mv -i`
- **Docker commands**: `dps`, `di`, `dex`
- **Python shortcuts**: `py`, `pip`, `venv`
- **Process management**: `psg`, `myps`, `psmem`
- **Archive operations**: `mktar`, `untar`, `mkgz`
- **System monitoring**: `meminfo`, `cpuinfo`, `pscpu`

## How It Works

The installation script:

1. Detects your operating system and shell
2. Locates the appropriate shell profile file (`.bashrc`, `.bash_profile`, or `.zshrc`)
3. Adds a source line to load the aliases
4. Creates the profile file if it doesn't exist

## Customization

Edit the `bash_aliases` file to add your own aliases. The changes will be available after sourcing your shell profile or restarting your terminal.

## Syncing Across Computers

To sync your aliases across multiple computers:

1. Customize the `bash_aliases` file on one machine
2. Commit and push your changes
3. Pull the repository on other machines
4. Run `./install_aliases.sh` on each machine

## License

MIT License - feel free to use and modify as needed.
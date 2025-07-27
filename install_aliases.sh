#!/bin/bash

# Script to install bash aliases from syncscripts
# This script sources the bash_aliases file in the user's bash profile

set -e

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ALIASES_FILE="$SCRIPT_DIR/bash_aliases"

# Function to add source line to a file
add_source_line() {
    local file="$1"
    local repo_source_line="# Syncscripts aliases"
    local repo_source_command="source \"$ALIASES_FILE\""
    local personal_source_line="# Personal aliases"
    local personal_source_command="source \"\$HOME/.bash_aliases\""
    
    # Create the file if it doesn't exist
    if [[ ! -f "$file" ]]; then
        touch "$file"
        echo "Created $file"
    fi
    
    # Check if repo aliases are already sourced
    local repo_exists=false
    if grep -q "source.*$ALIASES_FILE" "$file" 2>/dev/null || grep -q "source.*syncscripts.*bash_aliases" "$file" 2>/dev/null; then
        echo "Syncscripts aliases already sourced in $file"
        repo_exists=true
    fi
    
    # Check if personal aliases are already sourced
    local personal_exists=false
    if grep -q "source.*\$HOME/\.bash_aliases" "$file" 2>/dev/null || grep -q "source \$HOME/\.bash_aliases" "$file" 2>/dev/null; then
        echo "Personal aliases already sourced in $file"
        personal_exists=true
    fi
    
    # Add repo aliases if not present
    if [[ "$repo_exists" == false ]]; then
        echo "" >> "$file"
        echo "$repo_source_line" >> "$file"
        echo "$repo_source_command" >> "$file"
        echo "Added syncscripts aliases source to $file"
    fi
    
    # Add personal aliases if not present
    if [[ "$personal_exists" == false ]]; then
        echo "" >> "$file"
        echo "$personal_source_line" >> "$file"
        echo "$personal_source_command" >> "$file"
        echo "Added personal aliases source to $file"
    fi
    
    # Return success if nothing was added
    if [[ "$repo_exists" == true && "$personal_exists" == true ]]; then
        return 0
    fi
}

# Function to detect and setup bash profile
setup_bash_profile() {
    local bash_files=(
        "$HOME/.bashrc"
        "$HOME/.bash_profile"
        "$HOME/.profile"
    )
    
    # On macOS, .bash_profile is typically used
    # On Linux, .bashrc is more common
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS - prefer .bash_profile, create if needed
        if [[ -f "$HOME/.bash_profile" ]]; then
            add_source_line "$HOME/.bash_profile"
        elif [[ -f "$HOME/.bashrc" ]]; then
            add_source_line "$HOME/.bashrc"
        else
            add_source_line "$HOME/.bash_profile"
        fi
    else
        # Linux/Unix - prefer .bashrc
        if [[ -f "$HOME/.bashrc" ]]; then
            add_source_line "$HOME/.bashrc"
        elif [[ -f "$HOME/.bash_profile" ]]; then
            add_source_line "$HOME/.bash_profile"
        else
            add_source_line "$HOME/.bashrc"
        fi
    fi
}

# Function to setup zsh profile (since many systems use zsh now)
setup_zsh_profile() {
    if [[ -n "$ZSH_VERSION" ]] || command -v zsh >/dev/null 2>&1; then
        local zsh_file="$HOME/.zshrc"
        if [[ -f "$zsh_file" ]] || [[ "$SHELL" == *"zsh"* ]]; then
            add_source_line "$zsh_file"
        fi
    fi
}

# Main execution
main() {
    echo "Installing syncscripts bash aliases..."
    echo "Aliases file: $ALIASES_FILE"
    
    # Check if aliases file exists
    if [[ ! -f "$ALIASES_FILE" ]]; then
        echo "Error: bash_aliases file not found at $ALIASES_FILE"
        exit 1
    fi
    
    # Setup for bash
    setup_bash_profile
    
    # Setup for zsh if available
    setup_zsh_profile
    
    echo ""
    echo "Installation complete!"
    echo "To use the aliases immediately, run:"
    echo "  source \"$ALIASES_FILE\""
    echo "  source \"\$HOME/.bash_aliases\"  # if you have personal aliases"
    echo "Or restart your terminal."
}

# Run main function
main "$@"
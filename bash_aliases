#!/bin/bash
# Common bash aliases for syncscripts
# This file contains useful aliases that can be synced across multiple computers

# GhostTTY configuration alias
alias edit-config='subl "/Users/mit/Library/Application Support/com.mitchellh.ghostty/config"'

# Claude AI assistant alias
alias ask='claude -p'
alias claude-update='cd ~/.claude/local && npm update @anthropic-ai/claude-code'

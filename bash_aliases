#!/bin/bash
# Common bash aliases for syncscripts
# This file contains useful aliases that can be synced across multiple computers

# GhostTTY configuration alias
alias edit-config='subl "/Users/mit/Library/Application Support/com.mitchellh.ghostty/config"'

# Claude AI assistant alias
alias ask='claude -p'
alias claude-update='cd ~/.claude/local && npm update @anthropic-ai/claude-code'

# Git aliases
alias git-filelog='git log --follow --pretty=format:"%h | %ad | %an | %s" --date=short --'
alias git-filemeta='git log --follow --pretty=format:"%h %ad %an %s" --date=short --'
alias git-sweep='git reset --hard HEAD && git clean -fd'

# Development Tools
alias mcp-inspector='npx @modelcontextprotocol/inspector'
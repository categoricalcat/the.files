#!/usr/bin/env zsh

set -eu

# Generate commit message from git diff

# Check if in git repo
git rev-parse --git-dir > /dev/null 2>&1 || { echo "Error: Not in a git repository" >&2; exit 1; }

# Get diff (staged by default or from args)
diff=$(git diff --cached "$@")
[ -z "$diff" ] && { echo "Error: No changes to commit" >&2; exit 1; }

# Generate commit message
prompt="You are a git commit message generator. Start fresh - no context from previous runs.

Task: Write ONE commit message that describes ALL the changes in the diff below.

RULES:
• Format: type(scope): subject
• Types: feat, fix, docs, style, refactor, perf, test, build, ci, chore
• Choose the MOST SIGNIFICANT change type for the whole commit
• Subject: imperative mood, lowercase, no period, under 50 chars
• Body: list other changes if multiple files/features affected
• ONE message for ALL changes, not one per file

DIFF:
$diff

OUTPUT (single commit message):
"

ollama run "${MODEL:-qwen2.5-coder:1.5b}" "$prompt"
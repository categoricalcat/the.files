# fzf configuration
if command -v fzf >/dev/null 2>&1; then
    # Basic fzf options
    export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
    
    # Use fd if available
    if command -v fd >/dev/null 2>&1; then
        export FZF_DEFAULT_COMMAND='fd --type f'
    fi
fi

# zoxide configuration
if command -v zoxide >/dev/null 2>&1; then
    eval "$(zoxide init zsh)"
fi
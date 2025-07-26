#! /usr/bin/env zsh

echo "福福的zsh配置"
echo "[uid] $(id -u)"
echo "[iam] $(whoami)"
echo "[pwd] $(pwd)"
echo "[home] $HOME"

echo "Stowing files..."
cd ~/the.files
stow -v -R -t ~ .
cd ~

# Warpify - enable Warp terminal features
# The ANSI OSC 1337 escape sequence notifies Warp that the shell is ready
# Check if we're in an interactive shell before sending the sequence
if [[ "$-" == *i* ]] && [[ "${TERM_PROGRAM}" == "WarpTerminal" ]] || [[ "${WARP_BOOTSTRAPPED}" ]]; then
  printf '\e]1337;RequestWarpPrompt\a'
fi

# History settings
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS       # Don't record duplicate commands
setopt SHARE_HISTORY          # Share history between sessions

# Directory navigation
setopt AUTO_CD                # Type directory name to cd
setopt AUTO_PUSHD            # Push directories onto stack
setopt PUSHD_IGNORE_DUPS     # Don't push duplicates

# Completion
autoload -Uz compinit
compinit
zstyle ':completion:*' completer _complete _ignored  # Include ignored files
zstyle ':completion:*' menu select  # Interactive completion menu

# Prompt - simple and functional
PROMPT='%F{green}%n@%m%f:%F{blue}%~%f$ '

# aliases
alias ll='ls -alh'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
alias grep='grep --color=auto'

# Environment variables
export EDITOR='emacs'           # Default editor
export PATH="$HOME/.local/bin:$PATH"  # Add local bin to PATH
ZSH_THEME="spaceship"

# Key bindings
bindkey -e                    # Emacs key bindings
bindkey '^[[A' history-search-backward  # Up arrow
bindkey '^[[B' history-search-forward   # Down arrow 

# NPM Global
mkdir -p ~/.npm-global
npm config set prefix '~/.npm-global'
export PATH="$HOME/.npm-global/bin:$PATH"  # Add npm global bin to PATH

# alias sourcing .zshrc
alias zshrc='source ~/.zshrc'

echo "hello, gently, from self :3"
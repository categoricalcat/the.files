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

# Set theme before sourcing oh-my-zsh
ZSH_THEME="spaceship"

# Oh My Zsh plugins
plugins=(
  docker
  git
  sudo
  zsh-autosuggestions
  history-substring-search
  zsh-syntax-highlighting
)

# Source oh-my-zsh (managed by NixOS)
source "$ZSH/oh-my-zsh.sh"


# Note: Oh My Zsh is managed by NixOS configuration (nixos/users.nix)
# Do not manually source oh-my-zsh.sh here

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

# Additional completion settings (works with or without oh-my-zsh)
autoload -Uz compinit
compinit
zstyle ':completion:*' completer _complete _ignored  # Include ignored files
zstyle ':completion:*' menu select  # Interactive completion menu

# Configure auto-suggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#666666"  # Gray color for suggestions
ZSH_AUTOSUGGEST_STRATEGY=(history completion)  # Use both history and completion
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20            # Max size of buffer to trigger suggestions
bindkey '^ ' autosuggest-accept                # Ctrl+Space to accept suggestion
bindkey '^]' autosuggest-execute               # Ctrl+] to accept and execute

# Configure history-substring-search key bindings
# These work whether using Oh My Zsh plugin or standalone
bindkey '^[[A' history-substring-search-up     # Up arrow
bindkey '^[[B' history-substring-search-down   # Down arrow
bindkey '^P' history-substring-search-up       # Ctrl+P
bindkey '^N' history-substring-search-down     # Ctrl+N

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

# Key bindings
bindkey -e                    # Emacs key bindings

# NPM Global
mkdir -p ~/.npm-global
npm config set prefix '~/.npm-global'
export PATH="$HOME/.npm-global/bin:$PATH"  # Add npm global bin to PATH

# alias sourcing .zshrc
alias zshrc='source ~/.zshrc'

echo "hello, gently, from self :3"
if [[ -n "$SSH_CONNECTION" ]]; then
  fastfetch
fi
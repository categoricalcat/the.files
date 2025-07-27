#! /usr/bin/env zsh

echo "福福的zsh配置"
echo "[uid] $(id -u)"
echo "[iam] $(whoami)"
echo "[pwd] $(pwd)"

echo "Stowing files..."
cd ~/the.files
stow -v -R -t ~ .
cd ~

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

# Additional completion settings
autoload -Uz compinit
compinit
zstyle ':completion:*' completer _complete _ignored  # Include ignored files
zstyle ':completion:*' menu select  # Interactive completion menu

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#666666"  # Gray color for suggestions
ZSH_AUTOSUGGEST_STRATEGY=(history completion)  # Use both history and completion
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20            # Max size of buffer to trigger suggestions

# Key bindings
bindkey -e                    # Emacs key bindings
bindkey '^ ' autosuggest-accept                # Ctrl+Space to accept suggestion
bindkey '^]' autosuggest-execute               # Ctrl+] to accept and execute

# Git aliases (previously from oh-my-zsh git plugin)
alias ga='git add'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gcam='git commit -a -m'
alias gcb='git checkout -b'
alias gco='git checkout'
alias gd='git diff'
alias gf='git fetch'
alias gl='git pull'
alias glog='git log --oneline --decorate --graph'
alias gp='git push'
alias gst='git status'
alias gb='git branch'
alias gm='git merge'

# Directory shortcuts
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'

# Sudo shortcuts (press ESC twice to add sudo to current command)
sudo-command-line() {
    [[ -z $BUFFER ]] && zle up-history
    if [[ $BUFFER == sudo\ * ]]; then
        LBUFFER="${LBUFFER#sudo }"
    elif [[ $BUFFER == $EDITOR\ * ]]; then
        LBUFFER="${LBUFFER#$EDITOR }"
        LBUFFER="sudoedit $LBUFFER"
    elif [[ $BUFFER == sudoedit\ * ]]; then
        LBUFFER="${LBUFFER#sudoedit }"
        LBUFFER="$EDITOR $LBUFFER"
    else
        LBUFFER="sudo $LBUFFER"
    fi
}
zle -N sudo-command-line
bindkey "\e\e" sudo-command-line

# Docker aliases (previously from oh-my-zsh docker plugin)
alias dps='docker ps'
alias dpsa='docker ps -a'
alias dimg='docker images'
alias dex='docker exec -it'
alias dlog='docker logs'
alias dstop='docker stop'
alias drm='docker rm'
alias drmi='docker rmi'

# Other useful aliases
alias ll='ls -alh'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias grep='grep --color=auto'

# Environment variables
export EDITOR='emacs'           # Default editor
export PATH="$HOME/.local/bin:$PATH"  # Add local bin to PATH

# NPM Global
mkdir -p ~/.npm-global
npm config set prefix '~/.npm-global' 2>/dev/null
export PATH="$HOME/.npm-global/bin:$PATH"  # Add npm global bin to PATH

# alias sourcing .zshrc
alias zshrc='source ~/.zshrc'
alias query='~/the.files/query.sh'

# Warpify - enable Warp terminal features
# The ANSI OSC 1337 escape sequence notifies Warp that the shell is ready
# Check if we're in an interactive shell before sending the sequence
if [[ "$-" == *i* ]] && [[ "${TERM_PROGRAM}" == "WarpTerminal" ]] || [[ "${WARP_BOOTSTRAPPED}" ]]; then
  printf '\e]1337;RequestWarpPrompt\a'
fi

echo "hello, gently, from self :3"
if [[ -n "$SSH_CONNECTION" ]]; then
  fastfetch
fi

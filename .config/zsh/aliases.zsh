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

# Custom aliases
alias zshrc='source ~/.zshrc'
alias query='~/the.files/query.sh' 
alias nix-switch="sudo nixos-rebuild switch"
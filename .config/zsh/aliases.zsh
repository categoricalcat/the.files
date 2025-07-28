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

# Podman aliases
alias pps='podman ps'
alias ppsa='podman ps -a'
alias pimg='podman images'
alias pex='podman exec -it'
alias plog='podman logs'
alias pstop='podman stop'
alias prm='podman rm'
alias prmi='podman rmi'
alias prun='podman run'
alias pbuild='podman build'
alias ppull='podman pull'
alias ppush='podman push'
alias ptop='podman top'
alias pstats='podman stats'
alias pinspect='podman inspect'

# Podman compose aliases
alias pc='podman-compose'
alias pcu='podman-compose up'
alias pcud='podman-compose up -d'
alias pcd='podman-compose down'
alias pcl='podman-compose logs'
alias pclf='podman-compose logs -f'
alias pcps='podman-compose ps'
alias pcr='podman-compose restart'

# Podman system commands
alias pprune='podman system prune'
alias pinfo='podman info'
alias pversion='podman version'

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
alias nix-dr="sudo nixos-rebuild dry-run"
alias gh-pr="gh pr create -a @me --fill-verbose -B $1"
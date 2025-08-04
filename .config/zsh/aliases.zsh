# Git aliases - Now using git aliases directly in ~/.gitconfig
# Common shortcuts still available for muscle memory
alias g='git'
alias gst='git status'
alias glog='git log --oneline --decorate --graph'

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
nix-switch() {
  local host="${1:-fufuwuqi}"
  sudo nixos-rebuild switch --flake "/etc/nixos#${host}" --upgrade
}
alias nix-dr="sudo nixos-rebuild dry-run"
alias gh-pr="gh pr create -a @me --fill-verbose -B $1"
alias gen-commit="~/the.files/git-commit-msg.sh"
alias usb-ssh="~/the.files/usb-ssh.sh"
alias ffsh="ssh ssh.fufu.land || ssh fufud"
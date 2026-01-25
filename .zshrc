#! /usr/bin/env zsh
#
# 福福的zsh配置
#

# Removed 'set -e -o' - this was causing SSH sessions to close on any error
# setopt xtrace

vecho() {
  if [[ -n ${VECHO:-} ]]; then
    echo "$@"
  fi
}

echo "福福的zsh配置"
echo "[uid] $(id -u)"
echo "[iam] $(whoami)"
echo "[pwd] $(pwd)"
echo "[host] $(hostname)"

# Exit if not an interactive shell.
[ -z "$PS1" ] && return

if [[ "$TERM" == "dumb" ]]; then
  unsetopt zle
  unsetopt prompt_cr
  unsetopt prompt_subst

  PS1='$ ' 
  return
fi

vecho "stowing files"
cd ~/the.files
stow --adopt -R -t ~ .

if [[ $(whoami) == "fufud" ]]; then
  vecho "linking nixos"
  stow -R -t /etc/nixos nixos
fi

cd - > /dev/null # return to og

vecho "setting direnv"
eval "$(direnv hook zsh)"

vecho "setting starship"
eval "$(starship init zsh)"

if [ -s "$HOME/the.files/scm_breeze/scm_breeze.sh" ]; then
  vecho "sourcing scm_breeze"
  source "$HOME/the.files/scm_breeze/scm_breeze.sh"
fi

for config in ~/the.files/.config/zsh/*.zsh; do
    vecho "Sourcing $config"
    source "$config"
done

export TERM=xterm-256color

echo "hello, gently, from self :3"
if [[ -n "${SSH_CONNECTION:-}" ]]; then
  fastfetch
fi

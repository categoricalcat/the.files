#! /usr/bin/env zsh
#
# 福福的zsh配置
#

# Removed 'set -e -o' - this was causing SSH sessions to close on any error
# setopt xtrace

echo "福福的zsh配置"
echo "[uid] $(id -u)"
echo "[iam] $(whoami)"
echo "[pwd] $(pwd)"

# Exit if not an interactive shell.
[ -z "$PS1" ] && return

echo "stowing files"
cd ~/the.files
stow --adopt -R -t ~ .

if [[ $(whoami) == "fufud" ]]; then
  echo "linking nixos"
  stow -R -t /etc/nixos nixos
fi

cd - # return to og

echo "setting direnv"
eval "$(direnv hook zsh)"

# if terminal is not dumb, then set starship
if [[ $TERM != "dumb" ]]; then
  echo "setting starship"
  eval "$(starship init zsh)"
fi

echo "setting scm_breeze"
source "$HOME/the.files/scm_breeze/scm_breeze.sh"

for config in ~/the.files/.config/zsh/*.zsh; do
    echo "Sourcing $config"
    source "$config"
done

echo "hello, gently, from self :3"
if [[ -n "${SSH_CONNECTION:-}" ]]; then
  fastfetch
fi

[ -s "/home/fufud/.scm_breeze/scm_breeze.sh" ] && source "/home/fufud/.scm_breeze/scm_breeze.sh"

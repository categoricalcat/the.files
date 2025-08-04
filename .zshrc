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

echo "stowing files"
cd ~/the.files
stow --adopt -v -R -t ~ .
cd -

echo "setting direnv"
eval "$(direnv hook zsh)"

echo "setting starship"
eval "$(starship init zsh)"

for config in ~/the.files/.config/zsh/*.zsh; do
    echo "Sourcing $config"
    source "$config"
done

echo "hello, gently, from self :3"
if [[ -n "${SSH_CONNECTION:-}" ]]; then
  fastfetch
fi

#! /usr/bin/env zsh
#
# 福福的zsh配置
# 

set -eo pipefail
# setopt xtrace


echo "福福的zsh配置"
echo "[uid] $(id -u)"
echo "[iam] $(whoami)"
echo "[pwd] $(pwd)"

echo "Stowing files..."
cd ~/the.files
stow -v -R -t ~ .
cd ~

echo "setting direnv"
eval "$(direnv hook zsh)"

echo "setting starship"
# Temporarily disable nounset for starship init due to widgets array access
eval "$(starship init zsh)"

# Source modular configuration files
for config in ~/the.files/.config/zsh/*.zsh; do
    echo "Sourcing $config"
    source "$config"
done


# Warpify - enable Warp terminal features
# The ANSI OSC 1337 escape sequence notifies Warp that the shell is ready
# Check if we're in an interactive shell before sending the sequence
if [[ "$-" == *i* ]] && [[ "${TERM_PROGRAM:-}" == "WarpTerminal" ]] || [[ "${WARP_BOOTSTRAPPED:-}" ]]; then
  printf '\e]1337;RequestWarpPrompt\a'
fi

echo "hello, gently, from self :3"
if [[ -n "${SSH_CONNECTION:-}" ]]; then
  fastfetch
fi

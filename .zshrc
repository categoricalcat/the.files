#! /usr/bin/env zsh
#
# 福福的zsh配置
# 

# Initialize STARSHIP variables to prevent unset parameter errors with strict mode
export STARSHIP_CMD_STATUS=${STARSHIP_CMD_STATUS:-0}
export STARSHIP_CMD_DURATION=${STARSHIP_CMD_DURATION:-0}
export STARSHIP_PIPE_STATUS=${STARSHIP_PIPE_STATUS:-}
export STARSHIP_SHELL=${STARSHIP_SHELL:-zsh}

set -euo pipefail
# setopt xtrace


echo "福福的zsh配置"
echo "[uid] $(id -u)"
echo "[iam] $(whoami)"
echo "[pwd] $(pwd)"

echo "Stowing files..."
cd ~/the.files
stow -v -R -t ~ .
cd ~

# direnv
eval "$(direnv hook zsh)"

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

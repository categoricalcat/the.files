#!/usr/bin/env zsh

nixswitch() {
  local host="${2:-$HOST}"
  local cmd="${1:-dry-build}"
  local remote="${3:-fufud.vpn}"

  if [ -e "flake.nix" ]; then
      local flake_folder="."
  else
      local flake_folder="$HOME/the.files/nixos"
  fi

  echo "running from $flake_folder"

  local rebuild_args=(
    "$cmd"
    --flake "$HOME/the.files/nixos#${host}"
    --upgrade
    --build-host "$remote"
    --show-trace
    --print-build-logs
  )

  echo "nixos-rebuild ${rebuild_args[@]}"
  echo "proceed?"
  read -n 1

  if ! sudo nixos-rebuild "${rebuild_args[@]}"; then
    echo "\nbruh moment" >&2
    return 1
  fi
}

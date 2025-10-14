#!/bin/bash

# A minimal script to enable or disable a 100G swap file.
#
# Usage:
#   sudo ./tempswap.sh on
#   sudo ./tempswap.sh off

# --- Configuration ---
SWAP_FILE="/swapfile100g"
SIZE="100G"
# ---------------------

# Must be run as root
if [ "$(id -u)" -ne 0 ]; then
  echo "This script must be run as root. Please use sudo." >&2
  exit 1
fi

# Function to enable the swap file
enable_swap() {
  if swapon --show | grep -q "$SWAP_FILE"; then
    echo "Swap file '$SWAP_FILE' is already on."
    exit 0
  fi

  echo "Enabling ${SIZE} swap file..."
  fallocate -l "$SIZE" "$SWAP_FILE" || dd if=/dev/zero of="$SWAP_FILE" bs=1G count=100 status=none
  chmod 600 "$SWAP_FILE"
  mkswap "$SWAP_FILE" > /dev/null
  swapon "$SWAP_FILE"

  if ! grep -qF "$SWAP_FILE" /etc/fstab; then
    echo "$SWAP_FILE none swap sw 0 0" >> /etc/fstab
  fi

  echo "Swap enabled successfully."
  swapon --show
}

# Function to disable the swap file
disable_swap() {
  if ! swapon --show | grep -q "$SWAP_FILE"; then
    echo "Swap file '$SWAP_FILE' is not active."
    exit 0
  fi

  echo "Disabling swap: $SWAP_FILE"
  swapoff "$SWAP_FILE"
  sed -i.bak "\#^${SWAP_FILE}#d" /etc/fstab
  rm -f "$SWAP_FILE"

  echo "Swap disabled and file removed successfully."
  swapon --show
}

# --- Main Logic ---
case "$1" in
  on|enable)
    enable_swap
    ;;
  off|disable)
    disable_swap
    ;;
  *)
    echo "Usage: $0 {on|enable|off|disable}"
    exit 1
    ;;
esac

exit 0


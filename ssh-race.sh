#! /usr/bin/env bash

HOSTS=("fufud.local" "fufud.vpn")
PIPE=$(mktemp -u)
mkfifo "$PIPE"
trap 'rm -f "$PIPE"' EXIT
for host in "${HOSTS[@]}"; do
  (ssh -o ConnectTimeout=5 -o BatchMode=yes "$host" 'echo ok' &>/dev/null && echo "$host" >"$PIPE") &
  PIDS+=($!)
done
read -t 10 winner <"$PIPE"
kill "${PIDS[@]}" &>/dev/null
if [ -n "$winner" ]; then
  ssh "$winner"
else
  exit 1
fi

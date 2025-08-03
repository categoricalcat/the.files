#!/usr/bin/env bash
# Show USB network interfaces for SSH connections

# Show USB interfaces with IPs
echo "USB Network Interfaces:"
ip -br addr show | grep -E "(usb|enp.*s.*u)" | while read -r line; do
    IFACE=$(echo "$line" | awk '{print $1}')
    IP=$(echo "$line" | awk '{print $3}' | cut -d'/' -f1)
    [[ -n "$IP" ]] && echo "  $IFACE: $IP (ssh -p 24212 user@$IP)"
done || echo "  No USB interfaces found"

# Show SSH status
echo -e "\nSSH Status:"
ss -tlnp 2>/dev/null | grep -q :24212 && echo "  Listening on port 24212" || echo "  Not running"
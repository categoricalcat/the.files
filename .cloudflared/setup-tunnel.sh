#!/usr/bin/env bash
# Minimal cloudflared tunnel setup

tunnel_name="${1:-fufuland-tunnel}"

# Login if needed
cloudflared tunnel list &> /dev/null || cloudflared tunnel login

# Check if tunnel exists, create if not
if cloudflared tunnel list | grep -q "$tunnel_name"; then
    echo "Tunnel '$tunnel_name' already exists"
    tunnel_id=$(cloudflared tunnel list | grep "$tunnel_name" | awk '{print $1}')
else
    echo "Creating tunnel '$tunnel_name'..."
    cloudflared tunnel create "$tunnel_name"
    tunnel_id=$(cloudflared tunnel list | grep "$tunnel_name" | awk '{print $1}')
fi

echo "Tunnel ID: $tunnel_id"

# Setup DNS route for fufu.land
echo "Creating DNS route for fufu.land..."
cloudflared tunnel route dns "$tunnel_name" fufu.land || echo "Route may already exist"
cloudflared tunnel route dns "$tunnel_name" "*.fufu.land" || echo "Wildcard route may already exist"

echo

# Update config with tunnel ID
config_file="$HOME/the.files/.cloudflared/config.yml"

if [[ -f "$config_file" ]]; then
    # Check if tunnel: line exists
    if grep -q "^tunnel:" "$config_file"; then
        # Replace the first tunnel: line
        sed -i "s/^tunnel:.*/tunnel: $tunnel_id/" "$config_file"
    else
        # Add tunnel: line at the beginning (after any empty lines)
        sed -i "1s/^/tunnel: $tunnel_id\n/" "$config_file"
    fi
    echo "Set tunnel ID in config.yml"
else
    echo "Error: config.yml not found at $config_file"
    exit 1
fi

echo
echo "DNS routes configured for fufu.land and *.fufu.land"

# Start/restart cloudflared service
echo
if systemctl is-enabled cloudflared &> /dev/null; then
    echo "Restarting cloudflared service..."
    sudo systemctl restart cloudflared
    sudo systemctl status cloudflared --no-pager | head -n 3
elif systemctl --user is-enabled cloudflared &> /dev/null; then
    echo "Restarting cloudflared user service..."
    systemctl --user restart cloudflared
    systemctl --user status cloudflared --no-pager | head -n 3
else
    echo "No cloudflared service found."
    echo "To install as system service: sudo cloudflared service install"
    echo "To install as user service: cloudflared service install --user"
    echo
    echo "After installing, the service will start automatically."
fi
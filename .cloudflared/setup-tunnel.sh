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
if cloudflared tunnel route dns list | grep -q "fufu.land"; then
    echo "DNS route for fufu.land already exists"
else
    echo "Creating DNS route for fufu.land..."
    cloudflared tunnel route dns "$tunnel_name" fufu.land
    cloudflared tunnel route dns "$tunnel_name" "*.fufu.land"
fi

echo

# Update config with tunnel ID
config_file="$HOME/.cloudflared/config.yml"
if [[ -f "$config_file" ]]; then
    # First, remove any existing tunnel line (commented or not)
    sed -i "/^#*\s*tunnel:/d" "$config_file"
    
    # Then add the new tunnel ID after the comment
    sed -i "/# Tunnel credentials will be stored/a\\tunnel: $tunnel_id" "$config_file"
    
    echo "Set tunnel ID in config.yml"
else
    echo "Warning: config.yml not found at $config_file"
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
    echo "Starting cloudflared tunnel..."
    echo "Run as service: sudo cloudflared service install"
    echo "Or run directly: cloudflared tunnel run $tunnel_name"
    # Run in background for immediate use
    cloudflared tunnel run "$tunnel_name" &
    echo "Tunnel started in background (PID: $!)"
fi
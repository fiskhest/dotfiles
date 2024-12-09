# this is how its done with a proper vpn client such as tailscale...
if [ "$(tailscale status --json | jq -r '.BackendState')" = "Running" ]; then
    echo -n "󰳌"
fi

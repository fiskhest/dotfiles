# this is how its done with a proper vpn client such as tailscale...
#if [ "$(tailscale status --json | jq -r '.BackendState')" = "Running" ]; then

# and this if how we do it with bash nmcli parsing
if nmcli conn show --active | rg -q Relex-GP-VPN; then
    echo -n "󰳌"
fi

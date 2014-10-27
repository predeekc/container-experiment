#!/bin/bash

# Get information for the services box from the ssh-config
sshconfig=$(vagrant ssh-config | sed -n '/Host service-/,/^$/p')
ssh-add $(echo "$sshconfig" | sed -n "s/\s*IdentityFile\s*//p")
port=$(echo "$sshconfig" | sed -n "s/\s*Port\s*//p")
hostname=$(echo "$sshconfig" | sed -n "s/\s*HostName\s*//p")

export FLEETCTL_TUNNEL="$hostname:$port"

# Remove the existing units
fleetctl stop $(fleetctl list-units -fields=unit -no-legend)
fleetctl destroy $(fleetctl list-units -fields=unit -no-legend)
fleetctl destroy $(fleetctl list-unit-files -fields=unit -no-legend)

# Start the containers
fleetctl submit ../web/web@.service ../web/web-sidekick@.service ../load-balancer/load-balancer.service
fleetctl start web@{8012..8015}.service web-sidekick@{8012..8015}.service load-balancer.service
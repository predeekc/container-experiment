#!/bin/bash

sshconfig=$(vagrant ssh-config | sed -n '/Host service-/,/^$/p')

# add the ssh private key used by Vagrant
echo "Adding SSH private key"
ssh-add $(echo "$sshconfig" | sed -n "s/\s*IdentityFile\s*//p")

#setup the FLEETCTL_TUNNEL 
port=$(echo "$sshconfig" | sed -n "s/\s*Port\s*//p")
hostname=$(echo "$sshconfig" | sed -n "s/\s*HostName\s*//p")

export FLEETCTL_TUNNEL="$hostname:$port"
alias fleetclusterctl="fleetctl --tunnel '$hostname:$port'"
echo "Added FLEETCTL_TUNNEL variable with value $FLEETCTL_TUNNEL" 
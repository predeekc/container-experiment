#!/bin/bash

#get the current version of fleetctl
version=$(vagrant ssh -c 'fleetctl --version' core-01 | sed -n "s/fleetctl version //p" | tr -d '\r')
echo $version
file="fleet-v${version}-linux-amd64.tar.gz"
folder="fleet-v${version}-linux-amd64"
url="https://github.com/coreos/fleet/releases/download/v${version}/fleet-v${version}-linux-amd64.tar.gz"

wget $url

sudo rm -f /bin/fleetctl
tar -xOzf $file "${folder}/fleetctl" | sudo tee /bin/fleetctl > /dev/null
sudo chmod +x /bin/fleetctl

rm $file

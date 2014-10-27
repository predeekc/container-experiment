#container-experiment
====================

This is a simple CoreOS Cluster created using Vagrant.  The cluster contains:
 - A private Docker Registry - 172.17.8.210
 - A set of service machines - 172.17.8.21n
 - A set of worker machines  - 172.17.8.21n

## Creating the cluster

Run vagrant up in the ./cluster folder
Run build.sh in the ./ folder
  May take a while for the registry to come online
Run register-units.sh in the ./cluster folder
  Registers and starts the units using fleetctl

Monitor the progress of the units startup
  TODO: Add instructions for downloading fleetctl
  Run . ./setup-fleetctl.sh to configure fleetctl on your local machine
  Run fleetctl list-units to see the progress

Once all the units are running, run load-test.sh in the ./scripts folder to repeatedly hit the load balancer.  The IP of the targetd machine should be displayed

If you run vagrant halt worker-01 you should see the units on worker-01 me moved to other worker machines with no disrultion to the load-test.sh scrips
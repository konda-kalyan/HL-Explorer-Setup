#!/bin/bash -eu

#set -ev

ENV_LOCATION=$PWD/.env
echo $ENV_LOCATION
source $ENV_LOCATION

#copy artifacts to Worker nodes
scp -r channel-artifacts crypto-config ubuntu@$WORKER_NODE1_HOSTNAME:~/HLF-Multi-Host-Docker-Swarm/network
scp -r channel-artifacts crypto-config ubuntu@$WORKER_NODE2_HOSTNAME:~/HLF-Multi-Host-Docker-Swarm/network

#On Workder nodes, copy artifacts to command dir (/var/mynetwork/)
ssh ubuntu@$WORKER_NODE1_HOSTNAME 'cd ~/HLF-Multi-Host-Docker-Swarm/network; ./copy_crypto.sh'
ssh ubuntu@$WORKER_NODE2_HOSTNAME 'cd ~/HLF-Multi-Host-Docker-Swarm/network; ./copy_crypto.sh'

# copy chaincodes as well
scp -r /var/mynetwork/chaincode/* ubuntu@$WORKER_NODE1_HOSTNAME:~/HLF-Multi-Host-Docker-Swarm/chaincodes/
scp -r /var/mynetwork/chaincode/* ubuntu@$WORKER_NODE2_HOSTNAME:~/HLF-Multi-Host-Docker-Swarm/chaincodes/
ssh ubuntu@$WORKER_NODE1_HOSTNAME 'cd ~/HLF-Multi-Host-Docker-Swarm/chaincodes; sudo rm -rf /var/mynetwork/chaincode/*; sudo cp -r * /var/mynetwork/chaincode'
ssh ubuntu@$WORKER_NODE2_HOSTNAME 'cd ~/HLF-Multi-Host-Docker-Swarm/chaincodes; sudo rm -rf /var/mynetwork/chaincode/*; sudo cp -r * /var/mynetwork/chaincode'

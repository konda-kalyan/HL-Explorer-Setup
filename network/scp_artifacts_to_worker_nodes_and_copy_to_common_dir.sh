#!/bin/bash -eu

#set -ev

ENV_LOCATION=$PWD/.env
echo $ENV_LOCATION
source $ENV_LOCATION

#copy artifacts to Worker nodes
scp -r channel-artifacts crypto-config ubuntu@$WORKER_NODE1_HOSTNAME:~/HL-Explorer-Setup/network
scp -r channel-artifacts crypto-config ubuntu@$WORKER_NODE2_HOSTNAME:~/HL-Explorer-Setup/network

#On Workder nodes, copy artifacts to command dir (/var/mynetwork/)
ssh ubuntu@$WORKER_NODE1_HOSTNAME 'cd ~/HL-Explorer-Setup/network; ./copy_crypto.sh'
ssh ubuntu@$WORKER_NODE2_HOSTNAME 'cd ~/HL-Explorer-Setup/network; ./copy_crypto.sh'

# copy chaincodes as well
scp -r /var/mynetwork/chaincode/* ubuntu@$WORKER_NODE1_HOSTNAME:~/HL-Explorer-Setup/chaincodes/
scp -r /var/mynetwork/chaincode/* ubuntu@$WORKER_NODE2_HOSTNAME:~/HL-Explorer-Setup/chaincodes/
ssh ubuntu@$WORKER_NODE1_HOSTNAME 'cd ~/HL-Explorer-Setup/chaincodes; sudo rm -rf /var/mynetwork/chaincode/*; sudo cp -r * /var/mynetwork/chaincode'
ssh ubuntu@$WORKER_NODE2_HOSTNAME 'cd ~/HL-Explorer-Setup/chaincodes; sudo rm -rf /var/mynetwork/chaincode/*; sudo cp -r * /var/mynetwork/chaincode'

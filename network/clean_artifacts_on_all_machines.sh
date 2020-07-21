#!/bin/bash

#set -ev

ENV_LOCATION=$PWD/.env
echo $ENV_LOCATION
source $ENV_LOCATION

# ORG1
rm -rf channel-artifacts
rm -rf crypto-config

# ORG2
ssh ubuntu@$WORKER_NODE1_HOSTNAME 'cd ~/HL-Explorer-Setup/network; rm -rf channel-artifacts; rm -rf crypto-config; rm -rf ~/HL-Explorer-Setup/chaincodes/*'

# ORG3
ssh ubuntu@$WORKER_NODE2_HOSTNAME 'cd ~/HL-Explorer-Setup/network; rm -rf channel-artifacts; rm -rf crypto-config; rm -rf ~/HL-Explorer-Setup/chaincodes/*'

sudo rm -rf mkdir /var/mynetwork/*

sudo mkdir -p /var/mynetwork/chaincode
sudo mkdir -p /var/mynetwork/certs
sudo mkdir -p /var/mynetwork/bin

sudo cp -R crypto-config /var/mynetwork/certs/
sudo cp -R channel-artifacts /var/mynetwork/certs/
sudo cp -R ../chaincodes/* /var/mynetwork/chaincode/
sudo cp -R bin/* /var/mynetwork/bin/

#!/bin/sh

# Install zcash binary
yaourt -S zcash
zcutil-fetch-params
echo "Zcash installed"

# Setup configuration
mkdir -p ~/.zcash
echo "addnode=mainnet.z.cash" >~/.zcash/zcash.conf
echo "rpcuser=username" >>~/.zcash/zcash.conf
echo "rpcpassword=`head -c 32 /dev/urandom | base64`" >>~/.zcash/zcash.conf
echo "Zcash configuration complete"

# Enable CPU mining
echo 'gen=1' >> ~/.zcash/zcash.conf
echo "genproclimit=$(nproc)" >> ~/.zcash/zcash.conf
echo 'equihashsolver=tromp' >> ~/.zcash/zcash.conf

# Start Zcash
zcashd

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

# Install nheqminer
yaourt -S boost
mkdir -p ~/Code/zcash
cd ~/Code/zcash
git clone --recursive https://github.com/kost/nheqminer.git
cd nheqminer/nheqminer
mkdir build
cd build
cmake -DXENON=2 ..
make
echo "nheqminer compiled"

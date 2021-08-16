#!/bin/bash

set -xe

# For syncing locally encrypted files with dropbox, check scripts/dbe
sudo apt install ecryptfs-utils
mkdir -p $HOME/decrypted
chmod 0700 $HOME/decrypted

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 1C61A2656FB57B7E4DE0F4C1FC918B335044912E

# TODO: there is no hirsute distro, use 19.10 == disco
sudo bash -c 'echo "deb https://linux.dropbox.com/ubuntu disco main" >> /etc/apt/sources.list.d/dropbox.list' 

sudo apt install -y dropbox

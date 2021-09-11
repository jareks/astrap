#!/bin/bash

set -xe

sudo bash -c "echo 'deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib' > /etc/apt/sources.list.d/virtualbox.list"
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -

sudo apt update
sudo apt install -y virtualbox

# Requires accepting license terms
sudo wget 'https://download.virtualbox.org/virtualbox/6.1.26/Oracle_VM_VirtualBox_Extension_Pack-6.1.26.vbox-extpack' -P ~/software
echo "Run virtualbox, go to Tools > Preferences > Extensions > Add and select Oracle_VM_VirtualBox_Extension_Pack from ~/software"

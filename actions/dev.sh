#!/bin/bash

set -xe

sudo apt update
sudo apt install -y build-essential git silversearcher-ag curl htop watchman

# Node.js LTS (v14.x):
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs

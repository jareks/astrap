#!/bin/bash

set -xe

sudo apt update
sudo apt install -y build-essential git silversearcher-ag curl htop watchman sysstat postgresql-client-13 python3-pip jq universal-ctags

# Node.js LTS (v14.x) and yarn:
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt update
sudo apt install -y nodejs yarn direnv


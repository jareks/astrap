#!/bin/bash

set -xe

sudo apt update
sudo apt install -y build-essential git silversearcher-ag curl htop watchman sysstat postgresql-client-14 python3-pip jq

# Node.js LTS (v14.x) and yarn:
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo tee /etc/apt/trusted.gpg.d/yarn.gpg

echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt update
sudo apt install -y nodejs yarn direnv


#!/bin/bash 

set -xe

sudo apt install keypass2

mkdir -p ~/software
wget https://mega.nz/linux/MEGAsync/xUbuntu_21.04/amd64/megasync-xUbuntu_21.04_amd64.deb -P ~/software
sudo apt install -y ~/software/megasync-xUbuntu_21.04_amd64.deb


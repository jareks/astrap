#!/bin/bash 

set -xe

sudo apt install keypass2

mkdir -p ~/software
wget https://mega.nz/linux/MEGAsync/xUbuntu_21.04/amd64/megasync-xUbuntu_21.04_amd64.deb -P ~/software
sudo apt install -y ~/software/megasync-xUbuntu_21.04_amd64.deb


# Signal
wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
cat signal-desktop-keyring.gpg | sudo tee -a /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' |\
  sudo tee -a /etc/apt/sources.list.d/signal-xenial.list
sudo apt update && sudo apt install signal-desktop

#!/bin/bash

set -xe

mkdir -p ~/software
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P ~/software
sudo dpkg -i ~/software/google-chrome-stable_current_amd64.deb

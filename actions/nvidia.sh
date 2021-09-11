#!/bin/bash

set -xe

sudo apt update
sudo apt install nvidia-driver-470

# If you have problems after installing nvidia drivers consider:
# /etc/gdm3/custom.conf
# WaylandEnable=false

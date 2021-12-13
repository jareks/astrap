#!/bin/bash

set -xe

sudo apt update
sudo apt install nvidia-driver-470

# If you have problems after installing nvidia drivers consider disabling Wayland
# Even if you don't use nvidia screen sharing might not work with Wayland and some apps:
# /etc/gdm3/custom.conf
# WaylandEnable=false

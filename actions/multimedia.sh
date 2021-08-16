#!/bin/bash

set -xe

# pavucontrol is for configuring audio inputs/outputs, very useful
# pulseeffects is for tweaking sound - great for equalizing headphones
sudo apt install -y vlc pavucontrol pulseeffects
sudo snap install spotify

# Use those commands to figure out your current and optimal audio quality
# pacmd list-sinks
# 

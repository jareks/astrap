#!/bin/bash

set -xe

sudo apt install g810-led
sudo cp $(pwd)/../etc/g810-led/{profile,reboot} /etc/g810-led

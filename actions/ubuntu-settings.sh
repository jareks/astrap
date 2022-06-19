#!/bin/bash

set -xe

# In 21.04 it's important to use gsettings, not dconf

# Disallow remote content in Unity Lenses
gsettings set com.canonical.Unity.Lenses remote-content-search 'none'

# Swap caps-lock and escape
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:swapescape']"

# Auto-hide launcher
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false

# Holding keyboard key is lame, but we all have our bad days
gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 45

# Disable alert sound
gsettings set org.gnome.desktop.sound event-sounds false


# Cleanup unwanted packages
sudo apt remove thunderbird -y

# Configuring gnome extentions
sudo apt-get install chrome-gnome-shell gnome-shell-extensions gnome-tweaks

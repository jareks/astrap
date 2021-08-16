#!/bin/bash

set -xe

# vim-gtk3 for gvim support, wmctrl for gvim window manipulation
sudo apt install -y vim-gtk3 wmctrl

# https://github.com/junegunn/vim-plug - A minimalist Vim plugin manager.
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall > /dev/null

ln -s $(pwd)/../dotfiles/.vimrc ~/.vimrc
ln -s $(pwd)/../dotfiles/.gvimrc ~/.gvimrc

#!/bin/bash

set -xe

touch $HOME/.bashext
echo "source $HOME/.bashext" >> $HOME/.bashrc

# GIT
ln -s $(pwd)/../dotfiles/.gitconfig ~/.gitconfig
ln -s $(pwd)/../dotfiles/.gitignore_global ~/.gitignore_global

ln -s $(pwd)/../scripts ~/scripts

# https://github.com/cykerway/complete-alias required to bash completition work with alias
mkdir -p ~/.bash_completion.d/
curl https://raw.githubusercontent.com/cykerway/complete-alias/master/complete_alias > ~/.bash_completion.d/complete_alias

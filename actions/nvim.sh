#!/bin/bash

set -xe

# for neovim 0.5 we need unstale as of 2021-09
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim

mkdir -p ~/.config/nvim/
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

ln -s $PWD/../dotfiles/nvim/init.vim ~/.config/nvim

# TODO: run in neovim

# :CocInstall coc-prettier coc-tsserver coc-eslint @yaegassy/coc-tailwindcss3
# :CocInstall coc-pyright
# :CocConfig
# {
#   "coc.preferences.formatOnSaveFiletypes": ["typescript", "typescriptreact"]
# }

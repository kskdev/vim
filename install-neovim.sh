#!/bin/sh
# Standalone installer for Unixs

mkdir -p ~/.config/nvim
cp ./vimrc ~/.config/nvim/init.vim
# cp ./dein.toml ~/.config/nvim/dein.toml
cp ./deinLSP.toml ~/.config/nvim/dein.toml


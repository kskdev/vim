#!/bin/sh
# Standalone installer for Unixs

# この辺にjedi-vimがインストールできるかどうかなどのチェックコマンドを突っ込む予定

mkdir -p ~/.config/nvim
cp ./vimrc ~/.config/nvim/init.vim
cp ./dein.toml ~/.config/nvim/dein.toml


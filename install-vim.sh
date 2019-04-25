#!/bin/sh
# Standalone installer for Unixs

# この辺にjedi-vimがインストールできるかどうかなどのチェックコマンドを突っ込む予定

cp ./vimrc ~/.vimrc
mkdir -p ~/.vim
cp ./dein.toml ~/.vim/dein.toml


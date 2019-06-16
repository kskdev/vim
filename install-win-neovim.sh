#!/bin/sh
# Standalone installer for Windows

# ハマった時に参考になったページ
# https://qiita.com/hadayan0/items/de9031d5e8ad43baba3d

TARGET_DIR="C:/Users/${USERNAME}/AppData/Local/nvim"
TARGET_VIMRC="C:/Users/${USERNAME}/AppData/Local/nvim/init.vim"
SOURCE_VIMRC="./vimrc"
SOURCE_DEIN="./dein.toml"
TARGET_DEIN="C:/Users/${USERNAME}/AppData/Local/nvim/dein.toml"

mkdir -p ${TARGET_DIR}
cp ${SOURCE_VIMRC} ${TARGET_VIMRC}
cp ${SOURCE_DEIN} ${TARGET_DEIN}



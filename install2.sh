#!/bin/sh

# MacOS

SOURCE_VIMRC="./vimrc"
SOURCE_DEIN="./Plugins"
TARGET_DIR="${HOME}/.config/nvim"
TARGET_VIMRC="${HOME}/.config/nvim/init.vim"
TARGET_DEIN="${HOME}/.config/nvim/"

mkdir -p ${TARGET_DIR}
cp ${SOURCE_VIMRC} ${TARGET_VIMRC}
cp -r ${SOURCE_DEIN} ${TARGET_DEIN}
cp "./cheatsheet.md" ${TARGET_DIR}"/cheatsheet.md"

nvim -e -c ":silent! call dein#install() | :q"
nvim -e -c ":silent! UpdateRemotePlugins | :q"

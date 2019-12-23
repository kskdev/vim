#!/bin/sh

# For Neovim

case ${OSTYPE} in
    darwin*)
        # MacOS
        SOURCE_VIMRC="./vimrc"
        SOURCE_DEIN="./Plugins"
        TARGET_DIR="${HOME}/.config/nvim"
        TARGET_VIMRC="${HOME}/.config/nvim/init.vim"
        TARGET_DEIN="${HOME}/.config/nvim/"

        mkdir -p ${TARGET_DIR}
        cp ${SOURCE_VIMRC} ${TARGET_VIMRC}
        cp -r ${SOURCE_DEIN} ${TARGET_DEIN}

        nvim -e -c ":silent! call dein#install() | :q"
        nvim -e -c ":Defx | :silent! UpdateRemotePlugins | :q"
        ;;
    linux*)
        # Linux
        SOURCE_VIMRC="./vimrc"
        SOURCE_DEIN="./Plugins"
        TARGET_DIR="${HOME}/.config/nvim"
        TARGET_VIMRC="${HOME}/.config/nvim/init.vim"
        TARGET_DEIN="${HOME}/.config/nvim/"

        mkdir -p ${TARGET_DIR}
        cp ${SOURCE_VIMRC} ${TARGET_VIMRC}
        cp -r ${SOURCE_DEIN} ${TARGET_DEIN}

        nvim -e -c ":silent! call dein#install() | :q!"
        nvim -e -c ":Defx | :silent! UpdateRemotePlugins | :q"
        ;;
esac


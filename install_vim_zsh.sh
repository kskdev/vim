#!/bin/sh

# For Neovim

case ${OSTYPE} in
    darwin*)
        # MacOS
        SOURCE_VIMRC="./vimrc"
        SOURCE_DEIN="./Plugins"
        TARGET_DIR="${HOME}/.vim/"
        TARGET_VIMRC="${HOME}/.vimrc"
        TARGET_DEIN="${HOME}/.vim/dein/"

        mkdir -p ${TARGET_DEIN}
        cp ${SOURCE_VIMRC} ${TARGET_VIMRC}
        cp -r ${SOURCE_DEIN} ${TARGET_DEIN}

        # vim -e -c ":silent! call dein#install() | :q"
        # vim -e -c ":Defx | :silent! UpdateRemotePlugins | :q"
        ;;
    linux*)
        # Linux
        SOURCE_VIMRC="./vimrc"
        SOURCE_DEIN="./Plugins"
        TARGET_DIR="${HOME}/.vim/"
        TARGET_VIMRC="${HOME}/.vimrc"
        TARGET_DEIN="${HOME}/.vim/dein/"

        mkdir -p ${TARGET_DEIN}
        cp ${SOURCE_VIMRC} ${TARGET_VIMRC}
        cp -r ${SOURCE_DEIN} ${TARGET_DEIN}

        # nvim -e -c ":silent! call dein#install() | :q!"
        # nvim -e -c ":Defx | :silent! UpdateRemotePlugins | :q"
        ;;
esac


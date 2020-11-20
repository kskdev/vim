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

        SOURCE_FZF="./bins/fzf_bin/fzf-0.23.0-darwin_amd64/fzf"
        SOURCE_RIP="./bins/rg/ripgrep-12.1.1-x86_64-apple-darwin/rg"
        TARGET_FZF="${HOME}/.config/nvim/repos/github.com/junegunn/fzf/bin/"
        cp ${SOURCE_FZF} ${TARGET_FZF}
        cp ${SOURCE_RIP} ${TARGET_FZF}
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

        SOURCE_FZF="./bins/fzf_bin/fzf-0.23.0-linux_amd64/fzf"
        SOURCE_RIP="./bins/rg/ripgrep-12.1.1-x86_64-unknown-linux-musl/rg"
        TARGET_FZF="${HOME}/.config/nvim/repos/github.com/junegunn/fzf/bin/"
        cp ${SOURCE_FZF} ${TARGET_FZF}
        cp ${SOURCE_RIP} ${TARGET_FZF}
        ;;
esac


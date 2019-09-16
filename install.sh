#!/bin/sh

# For Neovim

if [ "$(uname)" == "Darwin" ]; then
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

elif [ "$(expr substr $(uname -s) 1 5)" == "MINGW" ]; then
    # Windows (MinGW series???)
    SOURCE_VIMRC="./vimrc"
    SOURCE_DEIN="./Plugins"
    TARGET_DIR="C:/Users/${USERNAME}/AppData/Local/nvim"
    TARGET_VIMRC="C:/Users/${USERNAME}/AppData/Local/nvim/init.vim"
    TARGET_DEIN="C:/Users/${USERNAME}/AppData/Local/nvim/"

    mkdir -p ${TARGET_DIR}
    cp ${SOURCE_VIMRC} ${TARGET_VIMRC}
    cp -r ${SOURCE_DEIN} ${TARGET_DEIN}
    cp "./cheatsheet.md" ${TARGET_DIR}"/cheatsheet.md"

    nvim -e -c ":silent! call dein#install() | :q"
    nvim -e -c ":silent! UpdateRemotePlugins | :q"

elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # Linux
    SOURCE_VIMRC="./vimrc"
    SOURCE_DEIN="./Plugins"
    TARGET_DIR="${HOME}/.config/nvim"
    TARGET_VIMRC="${HOME}/.config/nvim/init.vim"
    TARGET_DEIN="${HOME}/.config/nvim/"

    mkdir -p ${TARGET_DIR}
    cp ${SOURCE_VIMRC} ${TARGET_VIMRC}
    cp -r ${SOURCE_DEIN} ${TARGET_DEIN}
    cp "./cheatsheet.md" ${TARGET_DIR}"/cheatsheet.md"

    nvim -e -c ":silent! call dein#install() | :q!"
    nvim -e -c ":silent! UpdateRemotePlugins | :q!"
else
    echo "Unsupported..."
fi


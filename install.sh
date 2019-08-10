#!/bin/sh

# For Neovim

if [ "$(uname)" == "Darwin" ]; then
    # MacOS
    TARGET_DIR="${HOME}/.config/nvim"
    TARGET_VIMRC="${HOME}/.config/nvim/init.vim"
    SOURCE_VIMRC="./vimrc"
    SOURCE_DEIN="./dein.toml"
    TARGET_DEIN="${HOME}/.config/nvim/dein.toml"

    mkdir -p ${TARGET_DIR}
    cp ${SOURCE_VIMRC} ${TARGET_VIMRC}
    cp ${SOURCE_DEIN} ${TARGET_DEIN}
    # cp "./web2" ${TARGET_DIR}"/words"
    cp "./cheatsheet.md" ${TARGET_DIR}"/cheatsheet.md"

elif [ "$(expr substr $(uname -s) 1 5)" == "MINGW" ]; then
    # Windows (MinGW series???)
    TARGET_DIR="C:/Users/${USERNAME}/AppData/Local/nvim"
    TARGET_VIMRC="C:/Users/${USERNAME}/AppData/Local/nvim/init.vim"
    SOURCE_VIMRC="./vimrc"
    SOURCE_DEIN="./dein.toml"
    TARGET_DEIN="C:/Users/${USERNAME}/AppData/Local/nvim/dein.toml"

    mkdir -p ${TARGET_DIR}
    cp ${SOURCE_VIMRC} ${TARGET_VIMRC}
    cp ${SOURCE_DEIN} ${TARGET_DEIN}
    cp "./cheatsheet.md" ${TARGET_DIR}"/cheatsheet.md"

elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # Linux
    TARGET_DIR="${HOME}/.config/nvim"
    TARGET_VIMRC="${HOME}/.config/nvim/init.vim"
    SOURCE_VIMRC="./vimrc"
    SOURCE_DEIN="./dein.toml"
    TARGET_DEIN="${HOME}/.config/nvim/dein.toml"

    mkdir -p ${TARGET_DIR}
    cp ${SOURCE_VIMRC} ${TARGET_VIMRC}
    cp ${SOURCE_DEIN} ${TARGET_DEIN}
    cp "./cheatsheet.md" ${TARGET_DIR}"/cheatsheet.md"
else
    echo "Unsupported..."
fi


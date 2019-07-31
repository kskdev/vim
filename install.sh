#!/bin/sh

if [ "$(uname)" == "Darwin" ]; then
    # MacOS
    TARGET_DIR="${HOME}/.config/nvim"
    TARGET_VIMRC="${HOME}/.config/nvim/init.vim"
    SOURCE_VIMRC="./vimrc"
    SOURCE_DEIN="./dein.toml"
    TARGET_DEIN="${HOME}/.config/nvim/dein.toml"

    mkdir -p ${TARGET_DIR}
    ln ${SOURCE_VIMRC} ${TARGET_VIMRC}
    ln ${SOURCE_DEIN} ${TARGET_DEIN}


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

elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # Linux
    TARGET_DIR="${HOME}/.config/nvim"
    TARGET_VIMRC="${HOME}/.config/nvim/init.vim"
    SOURCE_VIMRC="./vimrc"
    SOURCE_DEIN="./dein.toml"
    TARGET_DEIN="${HOME}/.config/nvim/dein.toml"

    mkdir -p ${TARGET_DIR}
    ln ${SOURCE_VIMRC} ${TARGET_VIMRC}
    ln ${SOURCE_DEIN} ${TARGET_DEIN}

else
    echo "Unsupported..."
fi


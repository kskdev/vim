#!/bin/sh
# Standalone installer for Unixs
# Referred :  https://github.com/shoma2da/neobundle_installer

# Set Absolute path
INSTALL_ROOT=~/.vim/dein

case $INSTALL_ROOT in
  /*) PLUGIN_DIR=$INSTALL_ROOT;;
  *) PLUGIN_DIR=$PWD/$INSTALL_ROOT;;
esac

INSTALL_DIR="${PLUGIN_DIR}/repos/github.com/Shougo/dein.vim"

# check git command
type git || {
  echo 'Please install git or update your path to include the git executable!'
  exit 1
}

# make plugin dir and fetch dein
if ! [ -e "$INSTALL_DIR" ]; then
  mkdir -p "$PLUGIN_DIR"
  git clone https://github.com/Shougo/dein.vim "$INSTALL_DIR"
fi

echo "Complete setup dein!"


cp ./vimrc ~/.vimrc

# vim7.4$B$N%5%]!<%H$r$7$J$/$J$C$?$i$7$$$N$G!$0J2<$N(B2$B9T$N=hM}$,I,MW(B
cd ~/.vim/dein/repos/github.com/Shougo/dein.vim
git checkout 1.0

cd ~
vim



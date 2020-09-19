#!/bin/bash

# Script for installing vim on systems where you don't have root access.
# vim will be installed in $HOME/opt/vim.

# exit on error
set -e

# check whether already installed
if [ -z $FORCE ]; then
    whichvim=$(type vim 2>> /dev/null || echo)
    if [[ ! -z $whichvim ]]; then
        echo already exists
        exit
    fi
fi

VERSION=8.2.0430

# create our directories
mkdir -p $HOME/vim_tmp $HOME/opt
cd $HOME/vim_tmp

# download source files for vim
REL=https://github.com/vim/vim/archive
FILENAME=v${VERSION}
curl -LO ${REL}/${FILENAME}.tar.gz

# extract files, configure, and compile
DIRNAME=vim-${VERSION}
tar xvzf ${FILENAME}.tar.gz
cd ${DIRNAME}

# configure & build
make configure
./configure --prefix=$HOME/opt/$DIRNAME && make all
make install
cd ..

# link
cd $HOME/opt
ln -s $DIRNAME vim

# cleanup
rm -rf $HOME/vim_tmp

echo "$HOME/opt/vim/bin/vim is now available. You can optionally add $HOME/opt/vim/bin to your PATH."

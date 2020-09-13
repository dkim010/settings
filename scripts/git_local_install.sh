#!/bin/bash

# Script for installing git on systems where you don't have root access.
# git will be installed in $HOME/opt/git.

# exit on error
set -e

VERSION=2.20.1

# create our directories
mkdir -p $HOME/git_tmp $HOME/opt
cd $HOME/git_tmp

# download source files for git
REL=https://github.com/git/git/archive
FILENAME=v${VERSION}
curl -LO ${REL}/${FILENAME}.tar.gz

# extract files, configure, and compile
DIRNAME=git-${VERSION}
tar xvzf ${FILENAME}.tar.gz
cd ${DIRNAME}

# configure & build
make configure
./configure --prefix=$HOME/opt/$DIRNAME && make all
make install
cd ..

# link
cd $HOME/opt
ln -s $DIRNAME git

# cleanup
rm -rf $HOME/git_tmp

echo "$HOME/opt/git/bin/git is now available. You can optionally add $HOME/opt/git/bin to your PATH."

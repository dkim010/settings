#!/bin/bash

# Script for installing git on systems where you don't have root access.
# git will be installed in $HOME/opt/git.

# exit on error
set -e

GIT_VERSION=2.20.1

# create our directories
mkdir -p $HOME/git_tmp $HOME/opt
cd $HOME/git_tmp

# download source files for git
REL=https://github.com/git/git/archive
GIT_FILENAME=v${GIT_VERSION}
curl -LO ${REL}/${GIT_FILENAME}.tar.gz

# extract files, configure, and compile
GIT_DIRNAME=git-${GIT_VERSION}
tar xvzf ${GIT_FILENAME}.tar.gz
cd ${GIT_DIRNAME}
make configure
./configure --prefix=$HOME/opt/$GIT_DIRNAME && make all
make install
cd ..

# link
cd $HOME/opt
ln -s $GIT_DIRNAME git

# cleanup
rm -rf $HOME/git_tmp

echo "$HOME/opt/git/bin/git is now available. You can optionally add $HOME/opt/git/bin to your PATH."

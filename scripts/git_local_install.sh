#!/bin/bash

# Script for installing git on systems where you don't have root access.
# git will be installed in $HOME/local/bin.

# exit on error
set -e

GIT_VERSION=2.11.0

# create our directories
mkdir -p $HOME/local/bin $HOME/git_tmp
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
./configure --prefix=$HOME/local && make all
make install
cd ..

# cleanup
rm -rf $HOME/git_tmp

echo "$HOME/local/bin/git is now available. You can optionally add $HOME/local/bin to your PATH."

#!/bin/bash

# Script for installing redis on systems where you don't have root access.
# redis will be installed in $HOME/local/bin.
# It's assumed that wget and a C/C++ compiler are installed.

# exit on error
set -e

# create our directories
mkdir -p $HOME/local/bin $HOME/redis_tmp
cd $HOME/redis_tmp

#############
# reids #
#############
wget wget http://download.redis.io/releases/redis-stable.tar.gz
tar xf redis-stable.tar.gz
cd redis-stable
./configure --prefi=$HOME/local
PREFIX=$HOME/local make
PREFIX=$HOME/local make test
PREFIX=$HOME/local make install
cd ..

# cleanup
rm -rf $HOME/redis_tmp

echo "$HOME/local/bin/redis is now available. You can optionally add $HOME/local/bin to your PATH."

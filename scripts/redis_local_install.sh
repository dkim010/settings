#!/bin/bash

# Script for installing redis on systems where you don't have root access.
# redis will be installed in $HOME/local/bin.
# It's assumed that wget and a C/C++ compiler are installed.

# exit on error
set -e

# create our directories
DST=$HOME/opt/redis
mkdir -p $DST $HOME/redis_tmp

#############
# reids #
#############
cd $HOME/redis_tmp
wget http://download.redis.io/releases/redis-stable.tar.gz
tar xf redis-stable.tar.gz
cd redis-stable
PREFIX=$DST make
PREFIX=$DST make test
PREFIX=$DST make install
cd ..

# cleanup
rm -rf $HOME/redis_tmp

echo "$DST is now available. You can optionally add $DST to your PATH."

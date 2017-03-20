#!/bin/bash

# Script for installing memcached on systems where you don't have root access.
# memcached will be installed in $HOME/local/bin.
# It's assumed that wget and a C/C++ compiler are installed.

# exit on error
set -e

MEMCACHED_VERSION=1.4.36

# create our directories
mkdir -p $HOME/local/bin $HOME/memcached_tmp
cd $HOME/memcached_tmp

############
# libevent #
############
wget https://github.com/downloads/libevent/libevent/libevent-2.0.19-stable.tar.gz
tar xvzf libevent-2.0.19-stable.tar.gz
cd libevent-2.0.19-stable
./configure --prefix=$HOME/local --disable-shared
make
make install
cd ..

#############
# memcached #
#############
wget -O memcached-${MEMCACHED_VERSION}.tar.gz \
    https://memcached.org/files/memcached-${MEMCACHED_VERSION}.tar.gz
tar xvzf memcached-${MEMCACHED_VERSION}.tar.gz
cd memcached-${MEMCACHED_VERSION}
./configure CFLAGS="-I$HOME/local/include" LDFLAGS="-L$HOME/local/lib -L$HOME/local/include" \
    --enable-64bit \
    --enable-threads \
    --prefix=$HOME/local
CPPFLAGS="-I$HOME/local/include" LDFLAGS="-static -L$HOME/local/include -L$HOME/local/lib" make
CPPFLAGS="-I$HOME/local/include" LDFLAGS="-static -L$HOME/local/include -L$HOME/local/lib" make install
cd ..

# cleanup
rm -rf $HOME/memcached_tmp

echo "$HOME/local/bin/memcached is now available. You can optionally add $HOME/local/bin to your PATH."

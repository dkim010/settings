#!/bin/bash

# Script for installing node&npm on systems where you don't have root access.
# node&npm will be installed in $HOME/local/bin.

# exit on error
set -e

## node
NODE_VERSION=6.9.1

# create our directories
mkdir -p $HOME/local/bin $HOME/node_tmp
cd $HOME/node_tmp

# download source files for node
REL=http://nodejs.org/dist
NODE_FILENAME=node-v${NODE_VERSION}
URL=${REL}/v${NODE_VERSION}/${NODE_FILENAME}.tar.gz
#curl -LO $URL

# extract files, configure, and compile
#tar xvzf ${NODE_FILENAME}.tar.gz
cd ${NODE_FILENAME}
./configure --prefix=$HOME/local && make install
cd ..

# cleanup
rm -rf $HOME/node_tmp

## 

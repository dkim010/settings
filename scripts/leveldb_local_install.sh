#!/bin/bash

# Script for installing leveldb on systems where you don't have root access.
# git will be installed in $HOME/opt/leveldb.

# exit on error
set -e

LEVELDB_VERSION=1.20

# create our directories
mkdir -p $HOME/opt
cd $HOME/opt

# download source files for git
REL=https://github.com/google/leveldb/archive
LEVELDB_FILENAME=v${LEVELDB_VERSION}.tar.gz
curl -LO $REL/$LEVELDB_FILENAME

# extract files, configure, and compile
LEVELDB_DIRNAME=leveldb-$LEVELDB_VERSION
tar xvzf ${LEVELDB_FILENAME}
cd ${LEVELDB_DIRNAME}
make
cd ..
ln -sf $LEVELDB_DIRNAME leveldb

echo "------------------- $HOME/opt/leveldb is now available.-----------------"
echo "Insert the leveldb dirs(out-shared, include) to LD_LIBRARY_PATH, LIBRARY_PATH, C_INCLUDE_PATH, CPLUS_INCLUDE_PATH."
echo "example)"
echo "export LD_LIBRARY_PATH=\$HOME/opt/leveldb/out-shared:\$LD_LIBRARY_PATH"
echo "export LIBRARY_PATH=\$HOME/opt/leveldb/out-shared:\$LIBRARY_PATH"
echo "export C_INCLUDE_PATH=\$HOME/opt/leveldb/include:\$C_INCLUDE_PATH"
echo "export CPLUS_INCLUDE_PATH=\$HOME/opt/leveldb/include:\$CPLUS_INCLUDE_PATH"

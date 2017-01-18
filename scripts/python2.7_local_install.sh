#!/bin/bash

# Script for installing python2.7 on systems where you don't have root access.
# Python2.7 will be installed in $HOME/.local/bin.

# exit on error
set -e

VERSION=2.7.12
PYTHON_TMP=$HOME/python${VERSION}_tmp
mkdir -p $PYTHON_TMP
cd $PYTHON_TMP

curl -LO http://www.python.org/ftp/python/${VERSION}/Python-${VERSION}.tgz
tar zxfv Python-${VERSION}.tgz
find $PYTHON_TMP/ -type d | xargs chmod 0755
cd Python-${VERSION}

./configure --prefix=$HOME/local
make
make install
cd $HOME

rm -rf $PYTHON_TMP

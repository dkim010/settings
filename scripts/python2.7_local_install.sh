#!/bin/bash

# Script for installing python2.7 on systems where you don't have root access.
# Python2.7 will be installed in $HOME/.local/bin.

# exit on error
set -e

PYTHON_TMP=$HOME/python2.7_tmp
mkdir -p $PYTHON_TMP
cd $PYTHON_TMP

curl -LO http://www.python.org/ftp/python/2.7.2/Python-2.7.2.tgz
tar zxfv Python-2.7.2.tgz
find $PYTHON_TMP/ -type d | xargs chmod 0755
cd Python-2.7.2

./configure --prefix=$HOME/local
make
make install
cd $HOME

rm -rf $PYTHON_TMP

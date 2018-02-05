#!/bin/bash -e

VERSION=0.11.3

mkdir -p $HOME/opt
cd $HOME/opt

REL=https://github.com/edenhill/librdkafka/archive
FILENAME=v${VERSION}.tar.gz
wget $REL/$FILENAME
tar xf $FILENAME

cd $HOME/opt/librdkafka-$VERSION
./configure --prefix=$HOME/opt/librdkafka
make
make install

echo '$HOME/opt/librdkafka is now available.'
echo 'You can optionally add $HOME/opt/librdkafka to your .bash_profile.'
echo 'E.g.,'
echo 'export LIBRARY_PATH=$HOME/opt/librdkafka/lib:$LIBRARY_PATH'
echo 'export LD_LIBRARY_PATH=$HOME/opt/librdkafka/lib:$LD_LIBRARY_PATH'
echo 'export C_INCLUDE_PATH=$HOME/opt/librdkafka/include:$C_INCLUDE_PATH'
echo 'export CPLUS_INCLUDE_PATH=$HOME/opt/librdkafka/include:$CPLUS_INCLUDE_PATH'


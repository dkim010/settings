#!/bin/bash

# exit on error
set -e


VERSION=20170722
REPO=http://ftp.gnu.org/gnu/parallel
ARCHIVE=parallel-${VERSION}.tar.bz2

mkdir -p $HOME/opt
cd $HOME/opt

curl -LO $REPO/$ARCHIVE
tar xf $ARCHIVE
ln -s parallel-$VERSION parallel

cd parallel-$VERSION
./configure --prefix=$HOME/opt/parallel-$VERSION && make && make install

echo "$HOME/opt/parallel/bin/parallel is now available."
echo "You can optionally add \$HOME/opt/parallel/bin to your PATH."

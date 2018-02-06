#!/bin/bash -e

# yum -y install pcre-devel

VERSION=3.0.12

mkdir -p $HOME/opt
cd $HOME/opt

REL=http://downloads.sourceforge.net/project/swig/swig/swig-$VERSION
FILENAME=swig-${VERSION}.tar.gz
wget $REL/$FILENAME
tar xf $FILENAME

cd $HOME/opt/swig-$VERSION
./configure --prefix=$HOME/opt/swig
make
make install

echo '$HOME/opt/swig is now available.'
echo 'You can optionally add $HOME/opt/swig/bin to your PATH.'
echo 'E.g.,'
echo 'export PATH=$HOME/opt/swig/bin:$PATH'

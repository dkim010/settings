#!/bin/bash

# exit on error
set -e



VERSION=2.5.0
REPO=https://downloads.sourceforge.net/project/scons/scons-local/${VERSION}
ARCHIVE=scons-local-${VERSION}.tar.gz

DST=$HOME/opt/scons
TMP_DST=$HOME/opt/scons-${VERSION}

mkdir -p $TMP_DST
ln -s $TMP_DST $DST

cd $TMP_DST
curl -LO $REPO/$ARCHIVE
tar xf $ARCHIVE

mkdir -p $HOME/bin
ln -s $DST/scons.py $HOME/bin/scons

echo "------------------- \$HOME/bin/scons is now available.-----------------"
echo "Insert the bin dirs to PATH."
echo "example)"
echo "export PATH=\$HOME/bin:\$PATH"
echo

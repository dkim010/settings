#!/bin/bash

# exit on error
set -e

VERSION=3.3.0
OS=linux-x86_64
REPO=https://github.com/google/protobuf/releases/download/v${VERSION}
ARCHIVE=protoc-${VERSION}-${OS}.zip

DST=$HOME/opt/protoc
TMP_DST=$HOME/opt/protoc-$VERSION
mkdir -p $TMP_DST
ln -s $TMP_DST $DST
cd $TMP_DST
curl -LO $REPO/$ARCHIVE
unzip $ARCHIVE

echo "------------------- $DST/bin is now available.-----------------"
echo "Insert the protoc dirs to PATH."
echo "example)"
echo "export PATH=\$HOME/opt/protoc/bin:\$PATH"
echo "export PROTOC_INCLUDE=\$HOME/opt/protoc/include"
echo

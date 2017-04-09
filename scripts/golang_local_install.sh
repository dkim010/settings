#!/bin/bash -e

VERSION=1.8.1
GOLANG=go${VERSION}.linux-amd64

mkdir -p $HOME/opt
cd $HOME/opt
wget https://storage.googleapis.com/golang/${GOLANG}.tar.gz
tar xf ${GOLANG}.tar.gz

echo "go installed in $HOME/opt/go"


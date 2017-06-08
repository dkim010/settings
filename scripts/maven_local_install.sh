#!/bin/bash

# exit on error
set -e

REPO=http://apache.mirror.cdnetworks.com/maven/maven-3/3.3.9/binaries
TAR=apache-maven-3.3.9-bin.tar.gz

mkdir -p $HOME/opt
cd $HOME/opt

curl -LO $REPO/$TAR
tar xf $TAR

DIRNAME=${TAR%-bin*}
ln -s $DIRNAME maven

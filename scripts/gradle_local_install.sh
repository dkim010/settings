#!/bin/bash

# exit on error
set -e

VERSION=5.2.1
REPO=https://services.gradle.org/distributions
ARCHIVE=gradle-${VERSION}-bin.zip

mkdir -p $HOME/opt
cd $HOME/opt

curl -LO $REPO/$ARCHIVE
unzip $ARCHIVE

DIRNAME=${ARCHIVE%-bin*}
ln -s $DIRNAME gradle

#!/bin/bash

# exit on error
set -e

# https://prestodb.io/docs/current/installation/cli.html

VERSION=0.214
REPO=https://repo1.maven.org/maven2/com/facebook/presto/presto-cli/$VERSION
ARCHIVE=presto-cli-${VERSION}-executable.jar

mkdir -p $HOME/opt/presto/bin
cd $HOME/opt/presto/bin

curl -LO $REPO/$ARCHIVE
chmod +x $ARCHIVE
ln -s $ARCHIVE presto

echo 'e.g., export PATH=$PATH:$HOME/opt/presto/bin'

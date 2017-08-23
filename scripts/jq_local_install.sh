#!/bin/bash

# exit on error
set -e

# https://github.com/stedolan/jq/releases
# https://stedolan.github.io/jq/

VERSION=1.5
BIN_URL=https://github.com/stedolan/jq/releases/download/jq-${VERSION}/jq-linux64
mkdir -p $HOME/bin
cd $HOME/bin
curl -L $BIN_URL -o jq
chmod a+x jq

echo '$HOME/bin/jq is available'

#!/bin/bash

# Prepare
## https://github.com/jupyter/nbviewer#local-installation
## sudo yum install libmemcached-devel openssl-devel pandoc libevent-devel
## pip install nbviewer

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
python -m nbviewer \
    --localfiles=$HOME/dev/repo/jupyter \
    --no-cache \
    --port=10081

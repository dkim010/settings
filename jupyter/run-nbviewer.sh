#!/bin/bash

# Prepare
## https://github.com/jupyter/nbviewer#local-installation
## irteamsu $ sudo yum install libmemcached-devel openssl-devel pandoc libevent-devel
## irteam $ pip install nbviewer

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
python -m nbviewer --localfiles=$HOME/dev/repo/jupyter --no-cache

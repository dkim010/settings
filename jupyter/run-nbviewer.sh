#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
python -m nbviewer --localfiles=$HOME/dev/repo/jupyter --no-cache

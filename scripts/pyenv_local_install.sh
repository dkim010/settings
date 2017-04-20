#!/bin/bash
# exit on error
set -e

PYENV=https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer
curl -L $PYENV | bash

pyenv install 2.7.13
pyenv install 3.6.1

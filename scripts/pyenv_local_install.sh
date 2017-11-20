#!/bin/bash
# exit on error
set -e

PYENV=https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer
curl -L $PYENV | bash

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

CONFIGURE_OPTS=--enable-shared pyenv install 2.7.13
CONFIGURE_OPTS=--enable-shared pyenv install 3.6.1

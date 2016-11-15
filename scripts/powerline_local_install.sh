#!/bin/bash

# Requirements: python>2.7 pip
# Script for installing powerline on systems where you don't have root access.
# Powerline will be installed in $HOME/.local/bin via pip.

# exit on error
set -e

## powerline has many versions
### powerline (https://github.com/powerline/powerline)
### powerline-shell (https://github.com/banga/powerline-shell)
### vim-airline (https://github.com/vim-airline/vim-airline)
### vim-powerline (https://github.com/Lokaltog/vim-powerline)
### tmux-powerline (https://github.com/erikw/tmux-powerline)

############################################################
PIP_ROOT=`pip show powerline-status | grep Location | sed -e "s/.* //"`
if [ ${#PIP_ROOT} -eq 0 ]; then
    pip install --user powerline-status

    PL_SH=$PIP_ROOT/powerline/bindings/bash/powerline.sh

    if [[ $OSTYPE == *'darwin'* ]]; then # mac
        echo -e ". $PL_SH\n" >> ~/.profile
    elif [[ $OSTYPE == *'linux'* ]]; then # linux
        echo -e ". $PL_SH\n" >> ~/.bash_profile
    fi
fi

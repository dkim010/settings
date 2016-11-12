#!/bin/bash

# Requirements: python>2.7 pip
# Script for installing htop on systems where you don't have root access.
# Powerline will be installed in $HOME/.local/bin via pip.

# exit on error
set -e

## powerline has many versions
### powerline (https://github.com/powerline/powerline)
### powerline-shell (https://github.com/banga/powerline-shell)
### vim-airline (https://github.com/vim-airline/vim-airline)
### vim-powerline (https://github.com/Lokaltog/vim-powerline)
### tmux-powerline (https://github.com/erikw/tmux-powerline)

POWERLINE=1
POWERLINE_SHELL=0

############################################################
## powerline: https://github.com/powerline/powerline
if [ $POWERLINE -eq 1 ]; then
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

    PLF_HOME=~/opt/powerline-fonts
    if [ ! -d $PLF_HOME ]; then
        mkdir -p ~/opt; cd ~/opt
        git clone https://github.com/powerline/fonts.git powerline-fonts
        $PLF_HOME/install.sh
    fi
fi

############################################################
## powerline-shell: https://github.com/banga/powerline-shell
if [ $POWERLINE_SHELL -eq 1 ]; then
    PLS_HOME=~/opt/powerline-shell/
    echo 'Installing powerline-shell...'
    if [ ! -d $PLS_HOME ]; then
        mkdir -p ~/opt
        cd ~/opt
        git clone https://github.com/banga/powerline-shell.git
    fi

    cd $PLS_HOME
    ./install.py

    mkdir -p ~/bin/
    ln -s $PLS_HOME/powerline-shell.py ~/bin/
    PL_CMD='function _update_ps1() {\n
        PS1="$(~/powerline-shell.py $? 2> /dev/null)"\n
    }\n
    if [ "$TERM" != "linux" ]; then\n
        PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"\n
    fi\n'

    if [[ $OSTYPE == *'darwin'* ]]; then # mac
        echo -e $PL_CMD >> ~/.profile
    elif [[ $OSTYPE == *'linux'* ]]; then # linux
        echo -e $PL_CMD >> ~/.bash_profile
    fi
fi

## vim-airline
#git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline

## tmux-powerline

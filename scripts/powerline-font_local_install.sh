#!/bin/bash

# Requirements: python>2.7 pip
# Script for installing htop on systems where you don't have root access.
# Powerline will be installed in $HOME/.local/bin via pip.

# exit on error
set -e


############################################################
PLF_HOME=~/opt/powerline-fonts
if [ ! -d $PLF_HOME ]; then
    mkdir -p ~/opt; cd ~/opt
    git clone https://github.com/powerline/fonts.git powerline-fonts
    $PLF_HOME/install.sh
fi

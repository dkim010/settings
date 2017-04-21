#!/bin/bash
## Requirements: Before installation, you should check your $HOME.

set -e

## execute runs
./mkln.sh

# PATH
export PATH=$HOME/.local/bin:$HOME/local/bin:$HOME/bin:$PATH

## install local packages
cd ~/settings/scripts/
./pyenv_local_install.sh
./tmux_local_install.sh
./htop_local_install.sh
./git_local_install.sh

## end
cd ~/; ls -al
echo "completed"

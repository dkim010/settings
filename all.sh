#!/bin/bash
## Requirements: Before installation, you should check your $HOME.

set -e

## execute runs
./mkln.sh

## install local packages
cd ~/settings/scripts/
./python2.7_local_install.sh
./pip_local_install.sh
./tmux_local_install.sh
./htop_local_install.sh
./git_local_install.sh

## end
cd ~/; ls -al
echo "completed"

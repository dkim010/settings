
# MacPorts Installer addition on 2015-10-14_at_18:53:07: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

##
alias ll='ls -al'
export PATH=~/bin/:/opt/local/bin/:$PATH:/Users/Naver/Library/Android/sdk/platform-tools:~/.vim/bundle/vim-erlang-tags/bin

## color
source ~/.colors
PS1='${debian_chroot:+($debian_chroot)}\[\033[00;36m\]\u\[\033[00;33m\]@\[\033[00;32m\]\h\[\033[00;33m\]:\[\033[00;36m\]\w\[\033[00m\]\$ '
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

## nvm
export NVM_DIR="/Users/Naver/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

## gradle
export GRADLE_HOME="/Users/Naver/opt/gradle/gradle-2.6/bin"
export PATH=$PATH:$GRADLE_HOME

## python path
PORT_PYTHONPATH=/opt/local/Library/Frameworks/Python.framework/Versions/2.7
#PIP_PYTHONPATH=/Library/Frameworks/Python.framework/Versions/2.7
PYTHONPATH=$PORT_PYTHONPATH
export PATH=$PATH:$PYTHONPATH

## mysql
MYSQL_PATH=/opt/local/lib/mysql56/bin
export PATH=$PATH:$MYSQL_PATH

## python (to include nrfutil)
PYTHON_BIN=/opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin/
export PATH=$PATH:$PYTHON_BIN

## nrf
NRFJPROG=/Users/Naver/opt/nRF5x-Command-Line-Tools_8_3_0/nrfjprog
MERGEHEX=/Users/Naver/opt/nRF5x-Command-Line-Tools_8_3_0/mergehex
export PATH=$MERGEHEX:$NRFJPROG:$PATH


#!/bin/bash
#################################################
#### author: Dongwon Kim <dkim010@gmail.com>
#### created at 2016.05.01
#################################################

USER_HOME=~/.

### conf files
FILES='.vim .vimrc .tmux.conf .gitconfig .pythonrc'
for f in $FILES; do
    ln -s $PWD/$f $USER_HOME/
done

### scripts
mkdir -p $USER_HOME/bin
FILES='gfind nfind xfind ofind atx uenv adb_conn run_www'
for f in $FILES; do
    ln -s $PWD/bin/$f $USER_HOME/bin/$f
done

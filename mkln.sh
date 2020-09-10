#!/bin/bash
#################################################
#### author: Dongwon Kim <dkim010@gmail.com>
#### created at 2016.05.01
#################################################

USER_HOME=~/.

### conf files
FILES='.vim .vimrc .tmux.conf .gitconfig .pythonrc .screenrc'
for f in $FILES; do
    ln -fs $PWD/$f $USER_HOME/
done

### scripts
mkdir -p $USER_HOME/bin
FILES='gfind nfind xfind ofind atx otx uenv adb_conn run_www gzwc dclean'
for f in $FILES; do
    ln -fs $PWD/bin/$f $USER_HOME/bin/$f
done

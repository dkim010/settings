#!/bin/bash
#################################################
#### author: Dongwon Kim <dkim010@gmail.com>
#### created at 2016.05.01
#################################################

### conf files
FILES='.vimrc .tmux.conf .gitconfig'
for f in $FILES; do
    ln -s $PWD/$f ~/$f
done

### scripts
mkdir -p ~/bin
FILES='gfind nfind xfind ofind atx uenv adb_conn'
for f in $FILES; do
    ln -s $PWD/bin/$f ~/bin/$f
done

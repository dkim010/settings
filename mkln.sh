#!/bin/bash
#################################################
#### author: Dongwon Kim <dkim010@gmail.com>
#### created at 2016.05.01
#################################################

### vimrc
ln -s $PWD/.vimrc ~/

### find scripts
mkdir -p ~/bin
FILES='gfind nfind xfind ofind'
for f in $FILES; do
    ln -s $PWD/bin/$f ~/bin/$f
done

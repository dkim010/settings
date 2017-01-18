#!/bin/bash

set -e

AUTOCONF_VERSION=2.69
AUTOMAKE_VERSION=1.15
LIBTOOL_VERSION=2.4.6

function install(){
    rel=$1
    filename=$2
    wget -O ${filename}.tar.gz ${rel}/${filename}.tar.gz
    tar xvzf ${filename}.tar.gz
    cd ${filename}
    ./configure --prefix=$HOME/local && make
    make install
    cd ..
}

# create our directories
mkdir -p $HOME/local/bin $HOME/autotools_tmp
cd $HOME/autotools_tmp

install http://ftp.gnu.org/gnu/autoconf autoconf-${AUTOCONF_VERSION}
install http://ftp.gnu.org/gnu/automake automake-${AUTOMAKE_VERSION}
install http://ftp.gnu.org/gnu/libtool libtool-${LIBTOOL_VERSION}

# clean up
#rm $HOME/autotools_tmp

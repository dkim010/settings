#!/bin/bash

# exit on error
set -e

VERSION=2.4.25
TARGET=httpd-$VERSION
DST=$HOME/opt/$TARGET-bin
WWW=$HOME/www

function download(){
    cd $HOME/opt
    curl -LO http://mirror.navercorp.com/apache//httpd/${TARGET}.tar.bz2
    tar xf ${TARGET}.tar.bz2
}

function install(){
    cd $TARGET
    ./configure \
        --prefix=$DST
    make
    make install
}

download
install

# WWW directory
mkdir -p $WWW
cp $DST/htdocs/index.html $WWW/

# Configuration
cd $DST/conf
sed -e "s/User daemon/User $LOGIN/" \
    -e "s/Group daemon/Group $LOGIN/" \
    -e "s/Listen 80/Listen 8080/" \
    original/httpd.conf > httpd.conf

echo "------------------- $DST/bin/apachectl is now available.-----------------"
echo "Insert the httpd-bin dirs to PATH."
echo "example)"
echo "export \$HTTPD=$DST/bin"
echo "export \$PATH=\$HTTPD:\$PATH"
echo "------------------- Configuration -----------------"
echo 'You can change the belows'
echo '* DocumentRoot ...'
echo '* Directory <...>'

#!/bin/bash

# exit on error
set -e

VERSION=2.4.25
TARGET=httpd-$VERSION
DST=$HOME/opt/$TARGET-bin

function download(){
    cd $HOME/opt
    curl -LO http://mirror.navercorp.com/apache//httpd/${TARGET}.tar.bz2
    tar xf ${TARGET}.tar.bz2

    curl -LO http://apache.mirror.cdnetworks.com//apr/apr-1.6.2.tar.gz
    curl -LO http://apache.mirror.cdnetworks.com//apr/apr-util-1.6.0.tar.gz
}

function install(){
    cd $TARGET

    # install apr
    cd srclib
    tar xf ../../apr-1.6.2.tar.gz
    mv apr-1.6.2 apr
    # install apr-util
    tar xf ../../apr-util-1.6.0.tar.gz
    mv apr-util-1.6.0 apr-util
    # pcre -> yum install pcre-devel

    cd ..
    ./configure \
        --with-included-apr \
        --prefix=$DST
    make
    make install
}

download
install

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

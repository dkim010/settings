#!/bin/bash -e

# check swig and python version
# python2.x -> swig 2.0.0
# python3.x -> swig 3.0.12
PYVERSION=`python --version 2>&1 | cut -f2 -d ' ' | cut -f1 -d '.'`
SWIG="$(type -p swig)" || echo -n
if [ -z $SWIG ]; then # if not exist
    if [ $PYVERSION == '2' ]; then
        echo 'You should install the swig-2.0.0 to use Python2.x'
    elif [ $PYVERSION == '3' ]; then
        echo 'You should install the swig-3.0.12 to use Python3.x'
    fi
    exit -1
else
    SWIGVERSION=`swig -version | grep 'SWIG Version' | cut -f3 -d ' '`
    if [ $PYVERSION == '2' -a $SWIGVERSION == '3.0.12' ]; then
        echo 'You should install the swig-2.0.0 to use Python2.x'
        exit
    elif [ $PYVERSION == '3' -a $SWIGVERSION == '2.0.0' ]; then
        echo 'You should install the swig-3.0.12 to use Python3.x'
        exit
    fi
fi

mkdir -p $HOME/opt
cd $HOME/opt
if [ ! -d faiss ]; then
    git clone https://github.com/facebookresearch/faiss
    cd faiss
    git checkout df2edbe3abff9c7cd394022a15f6b86999939b51 # 2018-02-06
else
    cd faiss
fi

PYENV="$(type -p pyenv)" || echo -n
if [ ! -z $PYENV ] && [ ! -f .python-version ]; then
    echo 'Set the pyenv version of the '$HOME'/opt/faiss'
    echo 'After that, re-run this script.'
    echo 'E.g.,'
    echo '$ pyenv local 3.6.1'
    exit -1
fi

# configure makefile
ORIGIN=$HOME/opt/faiss/example_makefiles/makefile.inc.Linux
NEW=$HOME/opt/faiss/makefile.inc
sed -e "s/PYTHONCFLAGS=/PYTHONCFLAGS:=/" \
    < $ORIGIN > $NEW

# PYTHONCFLAGS
PYTHON_BASE_CFLAGS=`python-config --includes`
echo $PYTHON_BASE_CFLAGS
SITE_PACKAGES_PATH=`python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())"`
NUMPY_CFLAGS=-I$SITE_PACKAGES_PATH/numpy/core/include
echo $NUMPY_CFLAGS
PYTHONCFLAGS="$PYTHON_BASE_CFLAGS $NUMPY_CFLAGS"

# build faiss-cpu
#make PYTHONCFLAGS="$PYTHONCFLAGS" -j8 clean
make PYTHONCFLAGS="$PYTHONCFLAGS" -j8
make PYTHONCFLAGS="$PYTHONCFLAGS" -j8 py

# build faiss-gpu
#cd gpu
#make PYTHONCFLAGS="$PYTHONCFLAGS" -j8
#make PYTHONCFLAGS="$PYTHONCFLAGS" -j8 py

# info
echo 
echo 'Build complete'
echo 'Insert the faiss path into PYTHONPATH'
echo 'E.g.,'
echo 'export PYTHONPATH=$HOME/opt/faiss:$PYTHONPATH'

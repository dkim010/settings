## source default profile
DIR=$(dirname "${BASH_SOURCE[0]}")
source $DIR/settings/.profile
if [ -f $HOME/.user ]; then
    export USER=$USER-`cat $HOME/.user`
fi

export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

## path
export PATH=$DIR/.local/bin:$DIR/local/bin:$DIR/bin:$DIR/../../local/bin:$PATH
#export LIBRARY_PATH=$HOME/.local/lib:$LIBRARY_PATH
#export LD_LIBRARY_PATH=$HOME/.local/lib:$LD_LIBRARY_PATH
#export C_INCLUDE_PATH=$HOME/.local/include:$C_INCLUDE_PATH
#export CPLUS_INCLUDE_PATH=$HOME/.local/include:$CPLUS_INCLUDE_PATH

## apache
#export PATH=$DIR/opt/ant/bin:$PATH ## apache ant
#export PATH=$DIR/opt/maven/bin:$PATH ## apache maven
#export PATH=$DIR/opt/httpd-2.4.25-bin/bin:$PATH ## apache httpd

## protobuf
#export PATH=$DIR/opt/protobuf/bin:$PATH ## google protocol buffer 2.5.0
#export PATH=$DIR/opt/protobuf-c/bin:$PATH ## protobuf-c
#export PATH=$DIR/opt/uncrustify/bin:$PATH ## uncrustify

## protoc
export PATH=$HOME/opt/protoc/bin:$PATH
export PROTOC_INCLUDE=$HOME/opt/protoc/include

## presto
export PATH=$HOME/opt/presto/bin:$PATH

## go
#export GOROOT=$DIR/opt/go
#export PATH=$DIR/opt/go/bin:$PATH ## go

## parallel
#export PATH=$HOME/opt/parallel/bin:$PATH

## gradle
#export PATH=$DIR/opt/gradle/bin:$PATH

## Hadoop
### p3pack
#export P3PACK=$DIR/opt/p3pack
### c3pack
#export C3PACK=$HOME/opt/c3pack

## python
export PYTHONSTARTUP=$HOME/.pythonrc
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

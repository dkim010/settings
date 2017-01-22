DIR=$(dirname "${BASH_SOURCE[0]}")
export PATH=$HOME/.local/bin:$HOME/local/bin:$HOME/bin:$PATH

## when profiled user
PARENT=$DIR/../../
export PATH=$PARNET/local/bin:$PATH

## source default profile
export USER=$USER-dwkim
. $DIR/settings/.profile

#export PATH=$DIR/opt/ant/bin:$PATH ## apache ant
#export PATH=$DIR/opt/maven/bin:$PATH ## apache maven
#
#export PATH=$DIR/opt/protobuf/bin:$PATH ## google protocol buffer 2.5.0
#export PATH=$DIR/opt/protobuf-c/bin:$PATH ## protobuf-c
#export PATH=$DIR/opt/uncrustify/bin:$PATH ## uncrustify

#export P3PACK=$DIR/opt/p3pack
#. $P3PACK/source.me.bash ## hadoop

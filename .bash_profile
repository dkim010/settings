## source default profile
DIR=$(dirname "${BASH_SOURCE[0]}")
source $DIR/settings/.profile
export USER=$USER-dwkim

## path
export PATH=$DIR/.local/bin:$DIR/local/bin:$DIR/bin:$DIR/../../local/bin:$PATH

#export PATH=$DIR/opt/ant/bin:$PATH ## apache ant
#export PATH=$DIR/opt/maven/bin:$PATH ## apache maven
#
#export PATH=$DIR/opt/protobuf/bin:$PATH ## google protocol buffer 2.5.0
#export PATH=$DIR/opt/protobuf-c/bin:$PATH ## protobuf-c
#export PATH=$DIR/opt/uncrustify/bin:$PATH ## uncrustify

#export P3PACK=$DIR/opt/p3pack
#source $P3PACK/source.me.bash ## hadoop

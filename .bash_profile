export PATH=$HOME/.local/bin:$HOME/local/bin:$HOME/bin:$PATH

## when profiled user
PARENT=$HOME/../../
export PATH=$PARNET/local/bin:$PATH

## source default profile
. ~/settings/.profile

## dircolors (modified STICKY_OTHER_WRITABLE)
## after `$ dircolors -p > ~/.dircolors`
#eval $(dircolors ~/.dircolors)
#
#export PATH=$HOME/opt/ant/bin:$PATH ## apache ant
#export PATH=$HOME/opt/maven/bin:$PATH ## apache maven
#
#export PATH=$HOME/opt/protobuf/bin:$PATH ## google protocol buffer 2.5.0
#export PATH=$HOME/opt/protobuf-c/bin:$PATH ## protobuf-c
#export PATH=$HOME/opt/uncrustify/bin:$PATH ## uncrustify
#
#. $HOME/opt/p3pack/source.me.bash ## hadoop

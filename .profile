## dwkim custom bashrc
PS1='${debian_chroot:+($debian_chroot)}\[\033[00;36m\]\u\[\033[00;33m\]@\[\033[00;32m\]\h\[\033[00;33m\]:\[\033[00;36m\]\w\[\033[00m\]\$ '

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export LS_COLORS="di=1;34;40:ln=1;35;40:so=1;31;40:pi=1;33;40:ex=1;32;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:"
export GREP_OPTIONS='--color=auto'

# PATH
#[[ ":$PATH:" != *":*/dwkim/:"* ]] && \
#    export PATH=$PATH:~/bin

alias l='ls'
alias ll='ls -alh'

if [[ $OSTYPE == *'linux'* ]]; then # linux
alias ls='ls --color'
fi

if [[ $OSTYPE == *'darwin'* ]]; then
## mac fs
alias lh='ll | hh'
alias hh='iconv -c -f UTF-8-MAC -t UTF-8'
## bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi
fi

## python
alias python='python2.7'

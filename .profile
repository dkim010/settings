## dwkim custom bashrc
PS1='${debian_chroot:+($debian_chroot)}\[\033[00;36m\]\u\[\033[00;33m\]@\[\033[00;32m\]\h\[\033[00;33m\]:\[\033[00;36m\]\w\[\033[00m\]\$ '

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export GREP_OPTIONS='--color=auto'

alias ls='ls -vGF'
alias ll='ls -alvGF'

# PATH
BIN=~/bin
export PATH=$PATH:$BIN

if [[ $OSTYPE == *'darwin'* ]]; then # mac
alias hgrep='iconv -c -f UTF-8-MAC -t UTF-8 | grep '
fi

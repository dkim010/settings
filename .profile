## custom bashrc
SETTING_PATH=$(dirname "${BASH_SOURCE[0]}")

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export LS_COLORS="di=1;34;40:ln=1;35;40:so=1;31;40:pi=1;33;40:ex=1;32;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=34;43:"
export EDITOR=vim

if [[ $OSTYPE == *'linux'* ]]; then # linux
    alias ls='ls --group-directories-first --color=auto --ignore="*.pyc" --ignore="__pycache__"'
    alias l='ls'
    alias ll='ls -alh'
    alias la='ls -al'
fi

if [[ $OSTYPE == *'darwin'* ]]; then
    ## mac fs
    alias ls='gls --group-directories-first --color=auto --ignore="*.pyc" --ignore="__pycache__"'
    alias l='ls'
    alias ll='ls -alh'
    alias la='ls -al'
    alias lh='ll | hh'
    alias hh='iconv -c -f UTF-8-MAC -t UTF-8'
    ## bash-completion
    brew_prefix=$(brew --prefix)
    [[ -r "$brew_prefix/etc/profile.d/bash_completion.sh" ]] &&
        . $brew_prefix/etc/profile.d/bash_completion.sh
fi

## PS
#source $SETTING_PATH/.git-prompt.sh
#source $SETTING_PATH/.git-completion.bash
PS1='`if [ $? = 0 ]; then echo "\[\033[01;32m\]✔"; else echo "\[\033[01;31m\]✘"; fi` \[\033[01;30m\]$USER\[\033[01;34m\] \w\[\033[35m\]$(__git_ps1 " %s") \[\033[01;31m\]>\[\033[00m\] '

## screen-256color && tmux window name
##export PROMPT_COMMAND=''

## tmux autocomplete
_atx() {
    local USER_NAME=$USER
    local TMUX_SOCKET_NAME=${USER_NAME}_sock
    local TMUX_SESSIONS=$(tmux -L $TMUX_SOCKET_NAME ls -F '#S' | xargs)
    local cur=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=( $(compgen -W "$TMUX_SESSIONS" -- $cur) )
}
complete -F _atx atx

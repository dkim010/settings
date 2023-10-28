# custom bashrc
DIR=$(dirname "${BASH_SOURCE[0]}")

export BASH_SILENCE_DEPRECATION_WARNING=1
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export LS_COLORS="di=1;34;40:ln=1;35;40:so=1;31;40:pi=1;33;40:ex=1;32;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=34;43:"
export EDITOR=vim
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# aliases
alias _ls='ls'
if [[ "${OSTYPE}" == *'darwin'* ]]; then
    # mac fs
    alias _ls='gls'
    alias hh='iconv -c -f UTF-8-MAC -t UTF-8'
fi
alias ls='_ls --group-directories-first --color=auto --ignore="*.pyc" --ignore="__pycache__"'
alias l='ls'
alias ll='ls -alh'
alias la='ls -al'
alias lh='ll | hh'

# paths
[[ -d ${HOME}/local/bin ]] && export PATH="${HOME}/local/bin:${PATH}"
[[ -d ${HOME}/.local/bin ]] && export PATH="${HOME}/.local/bin:${PATH}"
[[ -d ${HOME}/bin ]] && export PATH="${HOME}/bin:${PATH}"
[[ -d ${HOME}/local/lib ]] && \
    export LIBRARY_PATH="${HOME}/local/lib:${LIBRARY_PATH}" && \
    export LD_LIBRARY_PATH="${HOME}/local/lib:${LIBRARY_PATH}"
[[ -d ${HOME}/local/include ]] && \
    export C_INCLUDE_PATH="${HOME}/local/include:${C_INCLUDE_PATH}" && \
    export CPLUS_INCLUDE_PATH="${HOME}/local/include:${CPLUS_INCLUDE_PATH}"

# brew
[[ -f /opt/homebrew/bin/brew ]] && eval "$(/opt/homebrew/bin/brew shellenv)"
[[ -f /usr/local/bin/brew ]] && eval "$(/usr/local/bin/brew shellenv)"

# completions
#[[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]] && \
#    . "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
for completion in brew git-completion.bash git-prompt.sh kubectl; do
    [[ -r "${HOMEBREW_PREFIX}/etc/bash_completion.d/${completion}" ]] && \
        . "${HOMEBREW_PREFIX}/etc/bash_completion.d/${completion}"
done

# PS
[[ -f ${HOME}/.user ]] && export USER=$USER-$(cat "${HOME}/.user")
PS1_PYENV='`if [[ $(command -v pyenv 2> /dev/null) ]]; then echo "($(pyenv version-name)) "; else echo ""; fi`'
PS1_RESULT='`if [ $? = 0 ]; then echo "\[\033[01;32m\]✔"; else echo "\[\033[01;31m\]✘"; fi` '
PS1_USER='\[\033[01;30m\]$USER\[\033[01;34m\] '
PS1_GIT='\w\[\033[35m\]$(__git_ps1 " %s") '
PS1="${PS1_PYENV}${PS1_RESULT}${PS1_USER}${PS1_GIT}"'\[\033[01;31m\]>\[\033[00m\] '

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

# python
export PYTHONSTARTUP=$HOME/.pythonrc
if [ "$(command -v pyenv)" ]; then
    export PATH="$HOME/.pyenv/bin:$PATH"
    eval "$(pyenv init - --no-rehash bash)"
    # eval "$(pyenv virtualenv-init - bash | sed s/precmd/precwd/g)"
fi

# rust
if [[ -r "${HOME}/.cargo/env" ]]; then
    . "${HOME}/.cargo/env"
    export RUSTUP_HOME="${HOME}/.rustup"
    export CARGO_HOME="${HOME}/.cargo"
    export PATH="${CARGO_HOME}/bin:${PATH}"
fi

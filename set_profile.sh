## command: . set_profile.sh
PROFILE_SCRIPT=$(cat <<- EOF
unset profile
function profile() {
    PROFILE_PATH_HOME=\${HOME}/users
    if [ \$1 == '--help' ]; then
        echo "Change User's profile"
        echo "Usage : profile [user_id]"
        return ;
    fi

    if [ \$# -ge 1 ]; then
        PROFILE_USERID=\$1
    else
        echo "Error: Insert user ID"
        return ;
    fi

    if [ ! -z \$PHOME ]; then
        echo "Error: Already executed profiling"
        return ;
    fi

    if [ -d "\${PROFILE_PATH_HOME}/\${PROFILE_USERID}" ]; then
        export PHOME="\$HOME"
        export HOME="\${PROFILE_PATH_HOME}/\${PROFILE_USERID}"
        if [ -f "\${PROFILE_PATH_HOME}/\${PROFILE_USERID}/.bash_profile" ]; then
            source "\${PROFILE_PATH_HOME}/\${PROFILE_USERID}/.bash_profile"
        fi
        if [ -f "\${PROFILE_PATH_HOME}/\${PROFILE_USERID}/.bashrc" ]; then
            source "\${PROFILE_PATH_HOME}/\${PROFILE_USERID}/.bashrc"
        fi
        cd \$HOME
    else
        echo "Error: Cannot find user ID '\${PROFILE_USERID}' '\${PROFILE_PATH_HOME}'"
    fi

# profile autogen
_profile() {
    local AVAILABLE_USERS=\$(ls \$HOME/users | xargs)
    local cur=\${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=( \$(compgen -W "\$AVAILABLE_USERS" -- \$cur) )
}
complete -F _profile profile
}
EOF
)

PROFILE_IF=$(cat <<- EOF
if [ -f ~/func_profile ]; then
    . ~/func_profile
fi
EOF
)

if [ ! -z $INIT_PROFILE ]; then
    if [ ! -f ~/func_profile ]; then
        echo -e "$PROFILE_SCRIPT" > ~/func_profile
        echo -e "$PROFILE_IF" >> ~/.bashrc
    fi
elif [ -z $1 ]; then
    echo 'insert userid after make the dir users/${USERID}'
else
    USERID=$1
    ## profile setting
    if [ ! -f ~/func_profile ]; then
        echo -e "$PROFILE_SCRIPT" > ~/func_profile
        echo -e "$PROFILE_IF" >> ~/.bashrc
    fi
    ## profile
    . ~/.bashrc
    ## create .user
    if [ ! -f $HOME/users/$USERID/.user ]; then
        echo $USERID > $HOME/users/$USERID/.user
    fi
    profile $USERID
fi

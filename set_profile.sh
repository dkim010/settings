## command: . set_profile.sh

if [ -z $1 ]; then
    echo 'insert username after make the dir users/${USER_NAME}'
else
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    USER_NAME=$1

    ## profile setting
    if [ ! -f ~/func_profile ]; then
        cp ${DIR}/scripts/func_profile ~/
        echo "if [ -f ~/func_profile ]; then
        . ~/func_profile
        fi" >> ~/.bashrc
    fi

    ## profile
    . ~/.bashrc

    echo $USER_NAME > $DIR/.user
    profile $1
    ln -s $DIR/.user $HOME/.user
fi

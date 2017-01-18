## command: . set_profile.sh

## profile setting
if [ ! -f ~/func_profile ]; then
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    cp ${DIR}/scripts/func_profile ~/
    echo "if [ -f ~/func_profile ]; then
        . ~/func_profile
    fi" >> ~/.bashrc
fi

echo ". ~/settings/.profile" >> ~/.bash_profile

## profile
. ~/.bashrc
profile dwkim

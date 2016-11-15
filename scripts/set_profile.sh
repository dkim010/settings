## command: . set_profile.sh

## profile setting
if [ ! -f ~/func_profile ]; then
    cp settings/scripts/func_profile ~/
    echo "if [ -f ~/func_profile ]; then
        . ~/func_profile
    fi" >> ~/.bashrc
fi

echo ". ~/settings/.profile" > .bash_profile

## profile
. ~/.bashrc
profile dwkim

## command: . set_profile.sh

## create dirs
mkdir -p /home1/irteam/users/dwkim
## git clone
cd ~/home1/irteam/users/dwkim
git clone https://github.com/dkim010/settings.git

## profile setting
if [ ! -f /home1/irteam/func_profile ]; then
    cp settings/scripts/func_profile ~/
    echo "if [ -f /home1/irteam/func_profile ]; then
        . /home1/irteam/func_profile
    fi" >> ~/.bashrc
fi

echo ". ~/settings/.profile" > .bash_profile

## profile
. ~/.bashrc
profile dwkim

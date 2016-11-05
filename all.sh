## command: . all.sh

## create dirs
mkdir -p /home1/irteam/users/dwkim

## git clone
cd /home1/irteam/users/dwkim
git clone https://github.com/dkim010/settings.git

## profile setting
cp settings/scripts/func_profile ~/
echo "if [ -f /home1/irteam/func_profile ]; then
    . /home1/irteam/func_profile
fi" >> ~/.bashrc
echo ". ~/settings/.profile" > .bash_profile

## profile
. ~/.bashrc
profile dwkim

## execute runs
cd ~/settings
./mkln.sh

## install local packages
cd ~/settings/scripts/
./htop_local_install.sh
./pip_local_install.sh
./tmux_local_install.sh

## end
cd ~/; ls -al
echo "completed"

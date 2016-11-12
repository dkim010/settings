## command: . all.sh
## Requirements: Before installation, you should check your $HOME.

## git clone
cd ~/
git clone https://github.com/dkim010/settings.git

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

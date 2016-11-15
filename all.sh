## command: . all.sh
## Requirements: Before installation, you should check your $HOME.

## execute runs
cd ~/settings
./set_profile.sh
./mkln.sh

## install local packages
cd ~/settings/scripts/
./htop_local_install.sh
./pip_local_install.sh
./tmux_local_install.sh
./powerline_local_install.sh

## end
cd ~/; ls -al
echo "completed"

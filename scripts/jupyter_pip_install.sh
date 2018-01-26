#!/bin/bash

JUPYTER_HOME=$HOME/.jupyter

if [ ! -d $JUPYTER_HOME ]; then
    echo 'Before jupyter install, make the env via pyenv'
    echo
    echo '$ mkdir \$HOME/.jupyter; cd \$HOME/.jupyter; pyenv local tf;'
    exit
fi

cd $JUPYTER_HOME
pip install jupyter
jupyter notebook --generate-config

pip install jupyterthemes
# dark theme
#jt -t onedork -fs 10 -f dejavu -cellw 1240 -lineh 140
# white theme
#jt -t grade3 -fs 9 -f dejavu -cellw 1200 -lineh 120
# dark theme
jt -t chesterish -fs 9 -f dejavu -cellw 1200 -lineh 120 -T

echo 'Installation for jupyter & themes is complete'
echo 'Setup jupyter config (\$HOME/.jupyter/jupyter_notebook_config.py)'

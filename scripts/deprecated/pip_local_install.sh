wget https://bootstrap.pypa.io/get-pip.py
~/local/bin/python2.7 -u get-pip.py -I --user
rm get-pip.py

~/.local/bin/pip2.7 install --user -I numpy pandas scikit-learn matplotlib readline

wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py --user
rm get-pip.py
pip install --user -I numpy pandas scikit-learn matplotlib readline
## echo "export PATH=/home1/irteam/.local/bin:$PATH" >> ~/.bashrc

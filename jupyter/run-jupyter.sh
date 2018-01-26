#!/bin/bash
#jt -t grade3 -fs 9 -f dejavu -cellw 1200 -lineh 120
jt -t chesterish -fs 9 -f dejavu -cellw 1200 -lineh 120 -T

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CUDA_VISIBLE_DEVICES=$JUPYTER_GPU jupyter notebook --config $DIR/jupyter_notebook_config.py

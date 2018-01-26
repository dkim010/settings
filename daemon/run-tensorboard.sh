#!/bin/bash -e

TB_DEPOT=$HOME/dev/depot/tensorboard
mkdir -p $TB_DEPOT
tensorboard \
    --logdir=$TB_DEPOT \
    --port 10082

#!/bin/bash
for slave in `cat slaves`
do
        ./ssh-host-reg.exp $slave
done

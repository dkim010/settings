#!/bin/bash
PWD=$(cd `dirname $0` ; pwd)
for slave in `egrep -v "^#" $PWD/slaves`
do
        echo "ssh $slave " $"${@// /\\ }" "..." 1>&2
        ssh $slave $"${@// /\\ }" \
        2>&1 | sed "s/^/$slave: /" &
done

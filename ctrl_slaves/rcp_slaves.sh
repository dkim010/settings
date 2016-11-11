#!/bin/bash
PWD=$(cd `dirname $0` ; pwd)
if [[ $2 == "" ]]
then
        echo "Usage: $PWD/$0 [source_path] [user_name] [destination_path]"
        exit 1
fi
if [[ $3 == "" ]]
then
        user_name=$(/usr/bin/whoami)
        echo "user_name = $user_name"
else
        user_name=$2
fi
for slave in `egrep -v "^#" $PWD/slaves`
do
        echo "rcp to $slave ..."
        rcp -r $1 ${user_name}@$slave:$3 &
done

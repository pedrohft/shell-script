#!/bin/bash
TIME=5

if [ $# -eq 0 ]
then
    echo "Please, send a proccess as argument."
    echo "./process-monitor.sh <process>"
    exit 1
fi

while true
do 
    if ps aux | grep $1 | grep -v grep | grep -v $0 > /dev/null
    then 
        sleep $TIME
    else
        echo "Attemption! The process $1 is not executing!"
        sleep $TIME
    fi
done

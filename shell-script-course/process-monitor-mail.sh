#!/bin/bash
TIME=10

EMAIL=fakemail@linux.com

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
        echo "Attemption! The process $1 is not executing!" | mail -s "[$0] Process Monitoring $1" $EMAIL
        sleep $TIME
    fi
done

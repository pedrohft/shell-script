#!/bin/bash
# Send an alert when a file system reaches out x% of the use

EMAIL=fakemail@linux.com
LIMIT=15
AQR_TEMP=/tmp/partition-monitor.tmp
LOG=/var/log/scripts/($basename $0).log

for loop in $(df -h | grep sda | tr -s " " | tr -s ' ' ':')
do
    USE=$(echo $loop | cut -d ":" -f5 | tr -d "%")
    if [ $USE -ge $LIMIT ]
    then
        PARTITION=$echo( $loop | cut -d ":" -f6)

        # Create and send email
        echo "Attemption! Partition $PARTITION is higher in limits than configured" >> $AQR_TEMP
        echo >> $AQR_TEMP
        echo "Limit = $LIMIT%" >> $AQR_TEMP
        echo >> $AQR_TEMP
        df -h $PARTITION >> $AQR_TEMP

        mail -s "[$0] - Verify partition $PARTITION" $EMAIL < $AQR_TEMP

        # Create log
        echo "$(date "+%d-%m-%Y %H:%M") - Partition $PARTITION - Use $USE%" >> $LOG
        rm -f $AQR_TEMP
    fi
done
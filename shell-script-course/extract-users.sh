#!/bin/bash

# Common UIDS used by users
MIN_UID=$(grep "^UID_MIN" /etc/login.defs | tr -s "\t" | cut -f2)
MAX_UID=$(grep "^UID_MAX" /etc/login.defs | tr -s "\t" | cut -f2)

OLDIFS=$IFS
IFS=$'\n'

# Creating output header
echo -e "USER\t\tUID\t\tDIR HOME\t\tNAME OR DESCRIPTION"

for i in $(cat /etc/passwd)
do 
    USERID=$(echo $i | cut -d ":" -f3)
    if [ $USERID -ge $MIN_UID -a $USERID -le $MAX_UID ]
    then
        USER=$(echo $i | cut -d ":" -f1)
        USERDESC=$(echo $i | cut -d ":" -f5 | tr -d ',')
        echo -e "$USER\t\t$USERID\t\t$USERHOME\t\t$USERDESC"
    fi
done 
IFS=$OLDIFS
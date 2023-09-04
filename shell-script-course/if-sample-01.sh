#!/bin/bash

HOUR=$(date +%H)
MIN=$(date +%M)

# define period
if [ $HOUR -ge 06 -a $HOUR -lt 12 ]
then
    echo "Good Morning"
elif [ $HOUR -ge 12 -a $HOUR -lt 18 ]
then 
    echo "Good Afternoon"
else
    echo "Good night"
fi

# define AMPM
if [ $HOUR -ge 12 ]
then
    AMPM=PM
    # hour reduce
    if [ $HOUR -gt 12 ]
    then 
        HOUR=$(expr $HOUR - 12)
    fi
else
    AMPM=AM
fi

echo
echo "Current hour is: $HOUR:$MIN $AMPM"
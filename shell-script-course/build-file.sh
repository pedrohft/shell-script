#!/bin/bash

read -p "Provide the file name: " FILE
read -p "Provide a group of characters: " WORD
read -p "Provide the total file size in bytes: " SIZE

cat /dev/null > $FILE

SHOWED_PORC=0

until [ $SIZE -le $(stat --printf=%s "$FILE") ]
do
    echo -n $WORD >> $FILE
    CURRENT_SIZE=$(stat --printf=%s "$FILE")

    CURRENT_PORC=$(expr $CURRENT_SIZE \* 100 / $SIZE)

    if [ $(expr $CURRENT_PORC % 10) -eq 0 -a $SHOWED_PORC -ne $CURRENT_PORC ]
    then
        echo "Finished: $CURRENT_PORC% - File Size: $CURRENT_SIZE"
        SHOWED_PORC=$CURRENT_PORC
    fi
done
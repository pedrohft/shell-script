#!/bin/bash

read -p "Input the value 1: " VALUE1
read -p "Input the value 2: " VALUE2

if [ ! $VALUE1 ] || [ ! $VALUE2 ]
then
    echo "None of the values can be null"
    exit 1
fi

echo
echo "Choose an option:"
echo "1 = Sum"
echo "2 = Sub"
echo "3 = Mult"
echo "4 = Div"
echo "5 = Exit"
echo 
read -p "Option: " OPT

echo

case $OPT in
    1)
        OPER="+"
        ;;
    2) 
        OPER="-"
        ;;
    3)
        if [ $VALUE1 -eq 0 -o $VALUE2 -eq 0 ]
        then
            echo "A value 0 could not be used in a multiplication"
            exit 1
        fi
        OPER="*"
        ;;
    4)
        if [ $VALUE1 -eq 0 -o $VALUE2 -eq 0 ]
        then
            echo "A value 0 could not be used in a division"
            exit 1
        fi

        if [ $(expr $VALUE1 % $VALUE2) -ne 0 ]
        then
            echo "Division with rest = $(expr $VALUE1 % $VALUE2)"
        else
            echo "Exact division"
        fi
        echo
        OPER="/"
        ;;
    Q)
        echo "Exiting..."
        exit
        ;;
    *)
        echo "Ivalid option"
        exit 1
        ;;
esac
echo "$VALUE1 $OPER $VALUE2 = $(expr $VALUE1 "$OPER" $VALUE2)"

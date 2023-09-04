#!/bin/bash

# search for .mp4, .mp3, .jpg arquives

for user in /home/*
do
    MP4COUNT=0
    MP3COUNT=0
    JPGCOUNT=0
    OLDIFS=$IFS
    IFS=$'\n'
    for files in $(find $user -name '*.jpg' -o -name '.*mp4' -o -name '*.mp3')
    do
        case $files in
                *.mp4)
                    MP4COUNT=$(expr $MP4COUNT + 1)
                    ;;
                *.mp3)
                    MP3COUNT=$(expr $MP3COUNT + 1)
                    ;;
                *.jpg)
                    JPGCOUNT=$(expr $JPGCOUNT + 1)
                    ;;
        esac
    done 

echo "USER: $(basename $user)"
echo "Arquives JPG: $JPGCOUNT"
echo "Arquives MP3: $MP3COUNT"
echo "Arquives MP4: $MP4COUNT"
done
IFS=$OLDIFS
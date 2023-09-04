#!bin/bash

DIRDEST=$HOME/backup

if [! -d $DIRDEST ]
then
    echo "Creating directory $DIRDEST..."
    mkdir -p $DIRDEST
fi

# verify if another backup exist past last seven days
DAYS7=$(find $DIRDEST -ctime -7 -name backup_home\*tgz)

if [ "$DAYS7" ]
then 
    echo "Has being created a backup at directory $HOME in the last 7 days."
    echo -n "Which go ahead? (N/s): "
    read -n1 CONT
    echo
    if [ "$CONT" = N -o "$CONT" = n -o "$CONT" = "" ]
    then
        echo "Backup aborted"
        exit 1
    elif [ "$CONT" = S -o "$CONT" = s]
    then
        echo "A new backup will be created for this same week"
    else
        echo "Ivalid option"
        exit 2
    fi
fi

echo "Creating backup"
ARQ="backup_home_$(date +%Y%m%d%H%M).tgz"
tar zcvpf $DIRDEST/$ARQ --absolute-names --exclude="$HOME/Google Drive" --exclude=$HOME/videos --exclude="$DIRDEST" "$HOME"/* > /dev/null

echo
echo "The backup with name \""$ARQ\"" has been created in $DIRDEST"
echo
echo "Finished backup"
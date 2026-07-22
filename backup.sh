#!/bin/bash

read -p "Insert Folder Path: " SOURCE
DESTINATION="$HOME/backup"
DATE=$(date +"%Y-%m-%d_%H-%M")

FOLDER_NAME=$(basename "$SOURCE")
BACKUP_NAME="$FOLDER_NAME-$DATE.tar.gz"

if [ ! -d "$SOURCE" ]; then
	echo "Folder not found"
	exit 1
fi


if [ ! -d "$DESTINATION" ]; then
	mkdir -p "$DESTINATION"
	echo "folder $DESTINATION has been created"
else
	echo "folder $DESTINATION already created!"
fi

echo ""
echo "Folder Source:"
echo $FOLDER_NAME

echo ""
echo "Backup Location:"
echo $DESTINATION

echo ""
echo "Backup Name:"
echo $BACKUP_NAME

if tar -czf "$DESTINATION/$BACKUP_NAME" "$SOURCE"; then
	echo ""
	echo "-+-Backup Done-+-"
	echo ""
else
	echo "Backup Failed"
	echo ""
fi

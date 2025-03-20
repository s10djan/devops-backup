#!/bin/bash

# Define Variables
BACKUP_DIR="./backup"
FILE_TO_BACKUP="config.txt"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="$BACKUP_DIR/config_$TIMESTAMP.txt"

# Ensure Backup Directory Exists
mkdir -p $BACKUP_DIR

# Copy File with Timestamp
cp $FILE_TO_BACKUP $BACKUP_FILE

# Commit and Push Changes
git add .
git commit -m "Backup: $FILE_TO_BACKUP at $TIMESTAMP"
git push origin main

# Log the Backup
echo "Backup created at $TIMESTAMP" >> backup.log

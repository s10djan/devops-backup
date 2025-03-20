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
/usr/local/bin/git add .
/usr/local/bin/git commit -m "Backup: $(date +'%Y%m%d_%H%M%S')"
/usr/local/bin/git push origin main



# Log the Backup
echo "Backup created at $TIMESTAMP" >> backup.log
#!/bin/bash

echo "Cron job running at: $(date)" >> /home/kfdjan30/backup_cron.log

# Copy file
cp /home/kfdjan30/devops-backup/config.txt /home/kfdjan30/devops-backup/backup/config_$(date +%Y%m%d_%H%M%S).txt
#!/bin/bash
LOCK_FILE="/tmp/backup.lock"

# Prevent multiple backups from running at the same time
if [ -f "$LOCK_FILE" ]; then
    echo "Backup already running. Exiting."
    exit 1
fi

touch "$LOCK_FILE"
trap 'rm -f "$LOCK_FILE"' EXIT  # Remove lock file on exit

# Backup logic
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="backup/config_${TIMESTAMP}.txt"

cp config.txt "$BACKUP_FILE"

# Use full path to Git
/usr/local/bin/git add .
/usr/local/bin/git commit -m "Backup: config.txt at $TIMESTAMP"
/usr/local/bin/git push origin main


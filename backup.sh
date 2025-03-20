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
#!/bin/bash

echo "Cron job running at: $(date)" >> /home/kfdjan30/backup_cron.log

# Copy file
cp /home/kfdjan30/devops-backup/config.txt /home/kfdjan30/devops-backup/backup/config_$(date +%Y%m%d_%H%M%S).txt

# Git backup
/usr/local/bin/git -C /home/kfdjan30/devops-backup add .
/usr/local/bin/git -C /home/kfdjan30/devops-backup commit -m "Backup: config.txt at $(date +%Y%m%d_%H%M%S)"
/usr/local/bin/git -C /home/kfdjan30/devops-backup push origin main

echo "Backup completed at: $(date)" >> /home/kfdjan30/backup_cron.log
#!/bin/bash

# Define variables
BACKUP_DIR="backup_$(date +'%Y-%m-%d_%H-%M-%S')"
mkdir -p "$BACKUP_DIR"

# Copy files to backup directory
cp config.txt "$BACKUP_DIR/"

# Commit changes to Git
git add .
git commit -m "Automated backup on $(date +'%Y-%m-%d %H:%M:%S')"
git push origin main

# Log the backup
echo "Backup completed at $(date)" >> backup.log

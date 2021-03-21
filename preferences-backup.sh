#!/bin/bash
CLOUD=
TARGET=
BACKUPS=pms-backups.tar
BACKUP=plex-media-server-*.tar.xz

## TO DO
## Implement in crontab on cycle 30 3 1 * *
#### Occurs on the first of every month.
## Put in correct, absolute paths and directory names
## Consider a way to limit the accural of $BACKUPS' size
## Save full file paths
## tar: lzma compression failed: lzma_code() call returned status 11 when using -P in tar

# Update pms-backup.tar to include old backup, and delete the old backup, if prior operation successful.
if [ -f $BACKUPS -a -f $BACKUP ];
then
	tar -rf $BACKUPS $BACKUP && rm $BACKUP
else
	tar -cf pms-backups.tar -T /dev/null
fi

# Create a new backup and save it to the cloud.
tar -cJf $CLOUD/plex-media-server-`date +\%Y-\%m-\%d-%H:%M:%S`.tar.xz test-dir
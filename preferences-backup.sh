#!/bin/bash
BACKUPS=pms-backups.tar
BACKUP=plex-media-server-*.tar.xz

## TO DO
## Put in correct, absolute paths and directory names
## Consider a way to limit the accural of $BACKUPS' size
## Upload $BACKUP to the cloud

# Update pms-backup.tar to include old backup, and delete the old backup, if prior operation successful.
if [ -f $BACKUPS -a -f $BACKUP ];
then
	tar -rf $BACKUPS $BACKUP && rm $BACKUP
else
	tar -cf pms-backups.tar -T /dev/null
fi

# Create a new backup.
tar -cJf plex-media-server-`date +\%Y-\%m-\%d-%H:%M:%S`.tar.xz test-dir

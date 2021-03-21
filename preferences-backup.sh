#!/bin/bash
CLOUD=
TARGET=
BACKUPS=pms-backups.tar
BACKUP=plex-media-server-*.tar.xz

# Update pms-backup.tar to include old backup, and delete the old backup, if prior operation successful.
if [ -f $BACKUPS -a -f $BACKUP ];
then
	tar -rf $BACKUPS $BACKUP && rm $BACKUP
else
	tar -cf pms-backups.tar -T /dev/null
fi

# Create a new backup and save it to the cloud.
tar -cJf $CLOUD/plex-media-server-`date +\%Y-\%m-\%d-%H:%M:%S`.tar.xz test-dir
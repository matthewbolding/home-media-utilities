#!/bin/bash
DEV=
DIR=/plex
FILE=disk-checks-`date +\%Y-\%m-\%d-%H:%M:%S`.log

echo "System Diagnostics started at `date +\%Y-\%m-\%d-%H:%M:%S`\n" >> $FILE

systemctl stop plexmediaserver && echo "Plex Media Server stopped...\n" >> $FILE
umount $DEV && echo "$DEV unmounted from $DIR\n" >> $FILE

# How long will this process take? What if it take *too* long?
fsck -CVy $DEV >> $FILE

mount $DEV $DIR && echo "$DEV mounted to $DIR\n" >> $FILE
systemctl start plexmediaserver && echo "Plex Media Server restarted...\n" >> $FILE

echo "System Diagnostics completed at `date +\%Y-\%m-\%d-%H:%M:%S`\n\n\n" >> $FILE
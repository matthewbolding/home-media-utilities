#!/bin/bash
DEV=
DIR=/plex
FILE=disk-checks-`date +\%Y-\%m-\%d-%H:%M:%S`.log

systemctl stop plexmediaserver; systemctl status plexmediaserver >> $FILE
umount $DEV; lsblk | grep $DEV >> $FILE
fsck -CVy $DEV >> $FILE && mount $DEV $DIR; lsblk | grep $DEV >> $FILE
systemctl start plexmediaserver; systemctl status plexmediaserver >> $FILE
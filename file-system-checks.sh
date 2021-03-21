#!/bin/bash
DEV=
DIR=/plex

systemctl stop plexmediaserver
umount $DEV
fsck -CVy $DEV > disk-checks-`date +\%Y-\%m-\%d-%H:%M:%S`.log
mount $DEV $DIR
systemctl start plexmediaserver
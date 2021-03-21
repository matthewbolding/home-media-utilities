#!/bin/bash
DIR=/plex

umount $DIR
fsck -CVy $DIR >> disk-checks.log
#!/bin/bash
DIR=/plex

## TO DO
## Implement in crontab on cycle 45 3 * * 0 
#### Occurs 03:45 every Sunday.

umount $DIR
fsck -CVy $DIR >> disk-checks.log
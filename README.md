# pms-backups

## preferences-backup.sh

### TO DO 
TO DO
Implement in crontab on cycle 30 3 1 * * (Occurs on the first of every month.)
Put in correct, absolute paths and directory names
Consider a way to limit the accural of $BACKUPS' size
Save full file paths (tar: lzma compression failed: lzma_code() call returned status 11 when using -P in tar)

## file-system-checks.sh

### TO DO
Implement in crontab on cycle 45 3 * * 0 (Occurs 03:45 every Sunday.)
Stop plexmediaservice before umount and fsck
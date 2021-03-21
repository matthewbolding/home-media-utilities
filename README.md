# pms-backups

## preferences-backup.sh

### Purpose
The purpose of `preferences-backup.sh` is backing up Plex's preferences and then managing those backups.

On the first day of each month, the entire folder is backed up and compresses. The library itself rarely gets updated with new content, so the preferences and configurations of Plex should not change much from month to month, hence the extended duration between backups.

### TO DO 
* Implement in crontab on cycle 30 3 1 * * (Occurs on the first of every month.)
* Put in correct, absolute paths and directory names
* Consider a way to limit the accural of $BACKUPS' size
* Reconsider cloud storage because of slow internet

## file-system-checks.sh

### Purpose
The purpose of `file-system-checks.sh` is to check the integrity of the filesystem on which Plex's movies are stored. This is done in part becasue Home-Media, the host system, seldom restarts, hence limiting the number of automatic file system checks.

Every Sunday, the entire Plex library is scanned to ensure that no files or sectors have lost their integrity.

### TO DO
* Implement in crontab on cycle 45 3 * * 0 (Occurs 03:45 every Sunday.)
* Consider using e2fsck
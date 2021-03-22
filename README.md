# pms-backups

## Big To Do List
* Periodically restart computer
* Periodically reload plexmediaserver service using `systemctl`
* Consider utilizing C to streamline disparate shell scripts to a system service

## preferences-backup.sh

### Purpose
The purpose of `preferences-backup.sh` is backing up Plex's preferences and then managing those backups.

On the first day of each month, the entire folder is backed up and compressed. The library itself, composed of ripped movies and television shows, rarely gets updated with new content, so the preferences and configurations of Plex should not change much from month to month, hence the extended duration between backups. The backup's scope includes, but is not limited to, posters, chapter images, and movie and television show metadata.

Note that the `Transcode` subdirectory is not included in backups, since files stored here are typically not configuation files and merely transcoded media ready to be set to Plex clients and synced content. `plex-media-server-*.tar.xz` will already be a large file---no need to increase its size.

Although the script is set to run every month, after a ingesting content or a majory system event occuring, running the script *might* be in the user's best interest.

### TO DO 
* Implement in crontab on cycle 30 3 1 * * (Occurs at 03:30 on the first of every month.)
* Put in correct, absolute paths and directory names
* Consider a way to limit the accural of $BACKUPS' size
* Reconsider cloud storage because of slow internet
* Exclude transcode folder

## file-system-checks.sh

### Purpose
The purpose of `file-system-checks.sh` is to check the integrity of the filesystem on which Plex's movies are stored. This is done in part becasue Home-Media, the host system, seldom restarts, hence limiting the number of automatic file system checks.

Every Sunday, the entire Plex library is scanned to ensure that no files or sectors have lost their integrity.

### TO DO
* Implement in crontab on cycle 45 3 * * 0 (Occurs 03:45 every Sunday.)
* Consider acting on outcome of file checking program
* Consider using `e2fsck`
## rsync

Important:
```
rsync dir1/ dir2
```
This copies the files inside dir1 without creating a new dir1 directory in dir2.
```
rysnc dir1 dir2/
```
This copies the entire directory and places it into dir2/

| Arguments: | Description                                                    |
|----|------------------------------------------------------------------------|
| -a | Copies everything including symbolic links                             |
| -n | Dry run for testing                                                    |
| -v | Verbose                                                                |
| -z | compresses files for network transfer.  Allows faster network speeds.  |
| -P | stands for progress and partial.  It only transfers changed files.     |
| --delete | This will sync any files that have been deleted from dir1 and will delete them on dir2 as well. |
| --backup | It is used in conjunction with the --backup-dir option, which specifies the directory where the backup files should be stored. rsync -a --delete --backup --backup-dir=/path/to/backups /path/to/source destination |


## Mount
```
<UUID> <TARGET> <TYPE> <OPTION> <FIELD> <FIELD>
```

Example:
```
UUID=acab18c0-db67-4a61-852e-76238cf61db6 /mountpoint btrfs defaults 0 0
```

You can get the UUID with the `blkid` command;

FIRST 0 = Filesystem dump. Typically 0.

second 0 - Filesystem check order upon boot. 0 for no check, 1 for root directory, and 2 for check.

Options:

auto - file system will mount automatically at boot, or when the command ‘mount -a’ is issued.

noauto - the filesystem is mounted only when you tell it to.

exec - allow the execution binaries that are on that partition (default).

noexec - do not allow binaries to be executed on the filesystem.

ro - mount the filesystem read only.

rw - mount the filesystem read-write.

sync - I/O should be done synchronously.

async - I/O should be done asynchronously.

flush - specific option for FAT to flush data more often, thus making copy dialogs or progress bars to stays up until things are on the disk.

user - permit any user to mount the filesystem (implies noexec,nosuid,nodev unless overridden).

nouser - only allow root to mount the filesystem (default).

defaults - default mount settings (equivalent to rw,suid,dev,exec,auto,nouser,async).

suid - allow the operation of suid, and sgid bits. They are mostly used to allow users on a computer system to execute binary executables with temporarily elevated privileges in order to perform a specific task.

nosuid - block the operation of suid, and sgid bits.

noatime - do not update inode access times on the filesystem. Can help performance.

nodiratime - do not update directory inode access times on the filesystem. Can help performance. You do not need to enable this flag if you have already enabled noatime.

relatime - update inode access times relative to modify or change time. Access time is only updated if the previous access time was earlier than the current modify or change time (similar to noatime, but doesn’t break mutt or other applications that need to know if a file has been read since the last time it was modified). Can help performance.

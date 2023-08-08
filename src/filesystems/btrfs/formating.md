### Formatting
In order to format the filesystem for a single partition simply using:

```
mkfs.btrfs /dev/XXX
```


When using raid you must specify:

```
mkfs.btrfs -m <RAID-TYPE> -d <RAID-TYPE> /dev/XXX /dev/XXX
```

-m: specify how the metadata will be stored.

-d: specify how the data will be stored.


For example: If you want to create a two disk set in raid1, do the following:
```
mkfs.btrfs -m raid1 -d raid1 /dev/sda /dev/sdb
```
# BTRFS

## Formatting
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

## Mounting and Compression
Compression:

btrfs uses multiple compression methods.

ZLIB -- slower, higher compression ratio (uses zlib level 3 setting, you can see the zlib level difference between 1 and 6 in zlib sources). Level from 1-9.

LZO -- faster compression and decompression than zlib, worse compression ratio, designed to be fast

ZSTD -- (since v4.14) compression comparable to zlib with higher compression/decompression speeds and different ratio levels (details)  Level from 1 - 15.

To mount a btrfs filesystem with compression use:

```
sudo mount /dev/XXX <TARGET> -o compress=($TYPE)
```

To force compression use:

```
sudo mount /dev/XXX <TARGET> -o compress-force=($TYPE)
```

Example:

```
sudo mount /dev/sda mountfolder -compress=zstd:10
```

Using compression with fstab:
```
<UUID> <MOUNT_POINT> btrfs default,auto,compress=($TYPE) 0 0
```

## Defragment
To defragment your volumes you can:
```
sudo btrfs fi defragment <OPTIONS> <TARGET>
```

This will defragment all files in the root. Example:
```
sudo btrfs filesystem defragment /
```

You can use the defragment command to compress all the uncompressed files on the volume.

```
sudo btrfs fi defragment -rfc<COMPRESSION_TYPE> <TARGET>
```
where:

-r will recursively defragment files.
-f will force
-c compression type

An example for defragmenting and compressing the root:
```
sudo btrfs fi defragment -rfclzo /
```

## Scrub
Running scrub will check the filesystem for errors and can be ran with:

```
sudo btrfs scrub start <TARGET>
```

To check the status of a scrub run:

```
sudo btrfs scrub status <TARGET>
```

Examples:

```
sudo btrfs scrub start /
```

```
sudo btrfs scrub status /
```

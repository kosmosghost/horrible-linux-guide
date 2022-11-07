---
title: The Unofficial Linux Guide
---

-   [Filesystems](#filesystems)
    -   [BTRFS](#btrfs)
        -   [Formatting](#formatting)
        -   [Defragment](#defragment)
        -   [Mounting and Compression](#mounting-and-compression)
        -   [Scrub](#scrub)
    -   [EXT4](#ext4)
        -   [Defragment](#defragment-1)
        -   [Filesystem check](#filesystem-check)
    -   [RAMFS](#ramfs)
        -   [Mount a ramdisk using RamFS](#mount-a-ramdisk-using-ramfs)
-   [Security](#security)
    -   [Cryptsetup](#cryptsetup)
    -   [CHMOD](#chmod)
-   [Tools](#tools)
    -   [Pandoc](#pandoc)
        -   [Converting](#converting)
        -   [HTML Templates](#html-templates)
    -   [Wget](#wget)
    -   [Apt-Cacher-NG](#apt-cacher-ng)
-   [Containers](#containers)
-   [Devices](#devices)
    -   [Loop Devices](#loop-devices)
-   [File Manipulation](#file-manipulation)
    -   [find](#find)
    -   [rsync](#rsync)
-   [Shell](#shell)
    -   [Detach processes from shell](#detach-processes-from-shell)

# Filesystems

## BTRFS

### Formatting

In order to format the filesystem for a single partition simply using:

    mkfs.btrfs /dev/XXX

When using raid you must specify:

    mkfs.btrfs -m <RAID-TYPE> -d <RAID-TYPE> /dev/XXX /dev/XXX

-m: specify how the metadata will be stored.

-d: specify how the data will be stored.

For example: If you want to create a two disk set in raid1, do the
following:

    mkfs.btrfs -m raid1 -d raid1 /dev/sda /dev/sdb

### Defragment

To defragment your volumes you can:

    sudo btrfs fi defragment <OPTIONS> <TARGET>

This will defragment all files in the root. Example:

    sudo btrfs filesystem defragment /

You can use the defragment command to compress all the uncompressed
files on the volume.

    sudo btrfs fi defragment -rfc<COMPRESSION_TYPE> <TARGET>

where:

-r will recursively defragment files. -f will force -c compression type

An example for defragmenting and compressing the root:

    sudo btrfs fi defragment -rfclzo /

### Mounting and Compression

Compression:

btrfs uses multiple compression methods.

ZLIB -- slower, higher compression ratio (uses zlib level 3 setting, you
can see the zlib level difference between 1 and 6 in zlib sources).
Level from 1-9.

LZO -- faster compression and decompression than zlib, worse compression
ratio, designed to be fast

ZSTD -- (since v4.14) compression comparable to zlib with higher
compression/decompression speeds and different ratio levels (details)
Level from 1 - 15.

To mount a btrfs filesystem with compression use:

    sudo mount /dev/XXX <TARGET> -o compress=($TYPE)

To force compression use:

    sudo mount /dev/XXX <TARGET> -o compress-force=($TYPE)

Example:

    sudo mount /dev/sda mountfolder -compress=zstd:10

Using compression with fstab:

    <UUID> <MOUNT_POINT> btrfs default,auto,compress=($TYPE) 0 0

### Scrub

Running scrub will check the filesystem for errors and can be ran with:

    sudo btrfs scrub start <TARGET>

To check the status of a scrub run:

    sudo btrfs scrub status <TARGET>

Examples:

    sudo btrfs scrub start /

    sudo btrfs scrub status /

## EXT4

### Defragment

To defrag an EXT4 volume:

    e4defrag <TARGET>

example:

    e4defrag /

### Filesystem check

To check ext4 integredy:

    e2fsck <TARGET>

## RAMFS

### Mount a ramdisk using RamFS

RamFS You can use RamFS to create a ramdisk on your computer using the
mount command:

    mount -t ramfs -o size=<SIZE> ramfs <PATH>

example:

    mount -t ramfs -o size=1g ramfs /ramdisk

# Security

## Cryptsetup

## CHMOD

7 read, write and execute rwx 111

6 read and write rw- 110

5 read and execute r-x 101

4 read only r-- 100

3 write and execute -wx 011

2 write only -w- 010

1 execute only --x 001

0 none --- 000

# Tools

## Pandoc

### Converting

To generate an html file from a markdown:

    pandoc -s input.md -o output.html

To generate a markdown from an html:

    pandoc -s -r html <WEBSITE> -o <OUTPUT>

Example:

    pandoc -s -r html https://en.wikipedia.org/wiki/Pandoc -o pandoc.txt

Adding in `-t gfm-raw_html` can clean up the text file making it easier
to read. Example:

    pandoc -s -t gfm-raw_html -r html https://en.wikipedia.org/wiki/Pandoc -o pandoc.txt

### HTML Templates

To create an HTML template with pandoc first use:

    pandoc -D html > <TEMPLATE_NAME>

Example:

    pandoc-D html > template.html

You can then open and edit template.html and make your changes.

Then use the template with a markdown file to generate a html file.

    pandoc -s --template template.html input.md -o output.html

## Wget

## Apt-Cacher-NG

# Containers

# Devices

## Loop Devices

# File Manipulation

## find

## rsync

Important:

    rsync dir1/ dir2

This copies the files inside dir1 without creating a new dir1 directory
in dir2.

    rysnc dir1 dir2/

This copies the entire directory and places it into dir2/

Arguments:

-a Copies everything including symbolic links

-n Dry run for testing

-v Verbose

-z compresses files for network transfer. Allows faster network speeds.

-P stands for progress and partial. It only transfers changed files.

--delete This will sync any files that have been deleted from dir1 and
will delete them on dir2 as well.

--backup It is used in conjunction with the --backup-dir option, which
specifies the directory where the backup files should be stored. rsync
-a --delete --backup --backup-dir=/path/to/backups /path/to/source
destination

# Shell

## Detach processes from shell

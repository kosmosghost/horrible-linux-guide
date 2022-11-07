---
title: The Unofficial Linux Guide
---

-   [Users, Groups, and Modify](#users-groups-and-modify)
    -   [Users and Modify](#users-and-modify)
    -   [New](#new)
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
-   [FSTAB](#fstab)
    -   [Mount](#mount)
    -   [Bind](#bind)
-   [Security](#security)
    -   [Cryptsetup](#cryptsetup)
        -   [Create a LUKS encrypted
            volume](#create-a-luks-encrypted-volume)
        -   [Open a LUKS encrypted
            volume](#open-a-luks-encrypted-volume)
        -   [Mount a LUKS encrypted
            volume](#mount-a-luks-encrypted-volume)
        -   [Close a LUKS encrypted
            volume](#close-a-luks-encrypted-volume)
        -   [Modify a LUKS encrypted
            volume](#modify-a-luks-encrypted-volume)
    -   [CHMOD](#chmod)
    -   [Adding a self-signed
        certificate](#adding-a-self-signed-certificate)
        -   [Fedora](#fedora)
        -   [Ubuntu](#ubuntu)
-   [Tools](#tools)
    -   [Pandoc](#pandoc)
        -   [Converting](#converting)
        -   [HTML Templates](#html-templates)
    -   [Wget](#wget)
    -   [Apt-Cacher-NG](#apt-cacher-ng)
        -   [Installation](#installation)
        -   [Use](#use)
-   [Containers](#containers)
-   [Devices](#devices)
    -   [Loop Devices](#loop-devices)
        -   [Create a loop device](#create-a-loop-device)
        -   [Partition a loop device](#partition-a-loop-device)
-   [File Manipulation](#file-manipulation)
    -   [find](#find)
    -   [rsync](#rsync)
-   [Shell](#shell)
    -   [Detach processes from shell](#detach-processes-from-shell)
        -   [disown](#disown)
        -   [nohup](#nohup)

# Users, Groups, and Modify

## Users and Modify

To create a new user use the useradd command:

    useradd <USERNAME>

And to modify the user use the usermod command:

    usermod <MODIFY> <USER>

For example, to add a user to a group use the following command:

    usermod -a -G sudo,wheel <USERNAME>

## New

To create a homedirectory while creating the user add the -m option:

    useradd -m <USERNAME>

To create a custom home directory use:

    useradd -m -d <DIRECTORY> <USERNAME>

To create a new user and add to a primary group at creation use:

    useradd -g <GROUP> <USERNAME>

A user may belong to many secondary groups. Seperate each group name
with an apostrophe. To create a new user and add to a secondary group at
creation use:

    useradd -G <GROUP,GROUP> <USERNAME>

To create a new user using a specific shell use the -s option.

    useradd -s /bin/bash <USERNAME>

To create a new user and add descriptive comment use the -c option:

    useradd -c "COMMENT" <USERNAME>

To create a new user and add an expiration date to the account use:

    useradd -e <DATE> <USERNAME>

Example:

    useradd -e 2021-01-01 user

To create a system user use the -r option:

    useradd -r <USERNAME>

To add a user to a specific group use the command:

    usermod -a -G <GROUP> <USER>

To disable a specific user from being able to login use:

    usermod -s /sbin/nologin <USER>

To force a user to change their password use:

    usermod -l <USERNAME>

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

# FSTAB

## Mount

    <UUID> <TARGET> <TYPE> <OPTION> <FIELD> <FIELD>

Example:

    UUID=acab18c0-db67-4a61-852e-76238cf61db6 /mountpoint btrfs defaults 0 0

You can get the UUID with the `blkid` command;

FIRST 0 = Filesystem dump. Typically 0.

second 0 - Filesystem check order upon boot. 0 for no check, 1 for root
directory, and 2 for check.

Options:

auto - file system will mount automatically at boot, or when the command
'mount -a' is issued.

noauto - the filesystem is mounted only when you tell it to.

exec - allow the execution binaries that are on that partition
(default).

noexec - do not allow binaries to be executed on the filesystem.

ro - mount the filesystem read only.

rw - mount the filesystem read-write.

sync - I/O should be done synchronously.

async - I/O should be done asynchronously.

flush - specific option for FAT to flush data more often, thus making
copy dialogs or progress bars to stays up until things are on the disk.

user - permit any user to mount the filesystem (implies
noexec,nosuid,nodev unless overridden).

nouser - only allow root to mount the filesystem (default).

defaults - default mount settings (equivalent to
rw,suid,dev,exec,auto,nouser,async).

suid - allow the operation of suid, and sgid bits. They are mostly used
to allow users on a computer system to execute binary executables with
temporarily elevated privileges in order to perform a specific task.

nosuid - block the operation of suid, and sgid bits.

noatime - do not update inode access times on the filesystem. Can help
performance.

nodiratime - do not update directory inode access times on the
filesystem. Can help performance. You do not need to enable this flag if
you have already enabled noatime.

relatime - update inode access times relative to modify or change time.
Access time is only updated if the previous access time was earlier than
the current modify or change time (similar to noatime, but doesn't break
mutt or other applications that need to know if a file has been read
since the last time it was modified). Can help performance.

## Bind

# Security

## Cryptsetup

### Create a LUKS encrypted volume

To create a LUKS encrypted volume use the following syntax:

    sudo cryptsetup luksFormat /dev/XXX --type luks2

### Open a LUKS encrypted volume

To open a LUKS encrypted volume:

    sudo cryptsetup open /dev/XXX <NAME>

Example:

    sudo cryptsetup open /dev/XXX my_encrypted_volume

### Mount a LUKS encrypted volume

To mount a volume:

    sudo mount /dev/mapper/<NAME> <TARGET>

Example:

    sudo mount /dev/mapper/my_encrypted_volume my_encrypted_folder

You must make sure to format the volume before you mount it for the
first time:

    sudo mkfs.<TYPE> /dev/mapper/<NAME>

Example:

    sudo mkfs.btrfs /dev/mapper/my_encrypted_volume

### Close a LUKS encrypted volume

To close the encrypted volume use:

    sudo cryptsetup close <NAME>

### Modify a LUKS encrypted volume

To show statistics and key slots of the encrypted volume use:

    sudo cryptsetup dump /dev/XXX

To remove a key from the volume:

    sudo cryptsetup luksKillSlot /dev/XXX <KEY#>

Example:

    sudo cryptsetup luksKillSlot /dev/XXX 1

## CHMOD

7 read, write and execute rwx 111

6 read and write rw- 110

5 read and execute r-x 101

4 read only r-- 100

3 write and execute -wx 011

2 write only -w- 010

1 execute only --x 001

0 none --- 000

## Adding a self-signed certificate

### Fedora

Place the certificate in:

    /etc/pki/ca-trust/source/anchors/

And then run command:

    sudo update-ca-trust

### Ubuntu

Copy certificate, usually a .pem to:

    /etc/ssl/certs

And then run command:

    update-ca-certificates

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

### Installation

To install run:

    sudo apt install apt-cacher-ng

And then select No at the prompt.

Run the service with:

    sudo systemctl start apt-cacher-ng

### Use

For debian:

Change `/etc/apt/sources.list` file and include the following as an
example:

    deb http://192.168.88.20:3142/ports.ubuntu.com/ubuntu-ports focal main restricted
    deb http://192.168.88.20:3142/ports.ubuntu.com/ubuntu-ports focal-updates main restricted
    deb http://192.168.88.20:3142/ports.ubuntu.com/ubuntu-ports focal universe
    deb http://192.168.88.20:3142/ports.ubuntu.com/ubuntu-ports focal-updates universe
    deb http://192.168.88.20:3142/ports.ubuntu.com/ubuntu-ports focal multiverse
    deb http://192.168.88.20:3142/ports.ubuntu.com/ubuntu-ports focal-updates multiverse
    deb http://192.168.88.20:3142/ports.ubuntu.com/ubuntu-ports focal-backports main restricted universe multiverse
    deb http://192.168.88.20:3142/ports.ubuntu.com/ubuntu-ports focal-security main restricted
    deb http://192.168.88.20:3142/ports.ubuntu.com/ubuntu-ports focal-security universe
    deb http://192.168.88.20:3142/ports.ubuntu.com/ubuntu-ports focal-security multiverse

For https:

    deb http://192.168.88.20:3142/HTTPS///get.docker.com/ubuntu docker main

# Containers

# Devices

## Loop Devices

### Create a loop device

To create a loop device you must first create a file. As an example the
following command will create a zeroed file with 100MB capacity.

    dd if=/dev/zero of=$FILENAME bs=1M count=100 status=progress; sync

Then create the loop device using the folowing:

    losetup -fP $FILENAME

### Partition a loop device

You can partition or modify the device using the fdisk utility. It is as
simple as with any other device:

    fdisk /dev/loop0

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

### disown

Disown will detach a process from the shell allowing you to exit the
server and allow the process to continue running.

An example of use:

    rsync <OPTION> <SOURCE> <DEST>

Once running suspend the process using \^Z. Then use the "bg" command to
run in the process in the background. Afterwards use the command
"disown" to detach the process from the active shell.

### nohup

Nohup does the same as disown. For example:

    nohup apt upgrade 

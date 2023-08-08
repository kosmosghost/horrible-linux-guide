### Mounting and Compression
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
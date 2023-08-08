### Defragment
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
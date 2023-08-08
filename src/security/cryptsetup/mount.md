### Mount a LUKS encrypted volume

To mount a volume:

```
sudo mount /dev/mapper/<NAME> <TARGET>
```

Example:

```
sudo mount /dev/mapper/my_encrypted_volume my_encrypted_folder
```

You must make sure to format the volume before you mount it for the first time:

```
sudo mkfs.<TYPE> /dev/mapper/<NAME>
```

Example:

```
sudo mkfs.btrfs /dev/mapper/my_encrypted_volume
```
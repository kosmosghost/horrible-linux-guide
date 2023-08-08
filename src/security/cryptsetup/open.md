### Open a LUKS encrypted volume

To open a LUKS encrypted volume:

```
sudo cryptsetup open /dev/XXX <NAME>
```

Example:

```
sudo cryptsetup open /dev/XXX my_encrypted_volume
```
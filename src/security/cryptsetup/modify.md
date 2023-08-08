### Modify a LUKS encrypted volume

To show statistics and key slots of the encrypted volume use:

```
sudo cryptsetup dump /dev/XXX
```

To remove a key from the volume:

```
sudo cryptsetup luksKillSlot /dev/XXX <KEY#>
```

Example:

```
sudo cryptsetup luksKillSlot /dev/XXX 1
```
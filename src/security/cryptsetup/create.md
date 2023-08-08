### Create a LUKS encrypted volume

To create a LUKS encrypted volume use the following syntax:

```
sudo cryptsetup luksFormat /dev/XXX --type luks2
```
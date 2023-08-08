### Scrub
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

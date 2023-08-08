## Run smart data tests by using:

```
smartctl -t <short|long|conveyence> /dev/XXX
```

Then by using the following you can view whether or not the test has completed and any errors found:

```
smartctl -l selftest /dev/XXX
```
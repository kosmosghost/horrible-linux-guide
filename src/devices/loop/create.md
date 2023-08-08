### Create a loop device
To create a loop device you must first create a file. As an example the following command will create a zeroed file with 100MB capacity.

```
dd if=/dev/zero of=$FILENAME bs=1M count=100 status=progress; sync
```

Then create the loop device using the folowing:

```
losetup -fP $FILENAME
```
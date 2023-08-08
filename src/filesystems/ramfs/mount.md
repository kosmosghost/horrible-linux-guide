### Mount a ramdisk using RamFS

RamFS
You can use RamFS to create a ramdisk on your computer using the mount command:
```
mount -t ramfs -o size=<SIZE> ramfs <PATH>
```	
example:
```
mount -t ramfs -o size=1g ramfs /ramdisk
```

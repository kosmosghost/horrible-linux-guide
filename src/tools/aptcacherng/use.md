### Use

#### For debian:


Change `/etc/apt/sources.list` file and include the following as an example:

```
deb http://192.168.0.20:3142/ports.ubuntu.com/ubuntu-ports focal main restricted
deb http://192.168.0.20:3142/ports.ubuntu.com/ubuntu-ports focal-updates main restricted
deb http://192.168.0.20:3142/ports.ubuntu.com/ubuntu-ports focal universe
deb http://192.168.0.20:3142/ports.ubuntu.com/ubuntu-ports focal-updates universe
deb http://192.168.0.20:3142/ports.ubuntu.com/ubuntu-ports focal multiverse
deb http://192.168.0.20:3142/ports.ubuntu.com/ubuntu-ports focal-updates multiverse
deb http://192.168.0.20:3142/ports.ubuntu.com/ubuntu-ports focal-backports main restricted universe multiverse
deb http://192.168.0.20:3142/ports.ubuntu.com/ubuntu-ports focal-security main restricted
deb http://192.168.0.20:3142/ports.ubuntu.com/ubuntu-ports focal-security universe
deb http://192.168.0.20:3142/ports.ubuntu.com/ubuntu-ports focal-security multiverse
```

For https:

```
deb http://192.168.0.20:3142/HTTPS///get.docker.com/ubuntu docker main
```
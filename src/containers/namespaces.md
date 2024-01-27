# Namespaces

sudo unshare --user --uts --pid --fork --mount --mount-proc=proc --net --root=/opt/containers/debian /bin/bash

Find namespace pid

lsns -t net 

sudo ip link add ve1 netns $PID type veth peer name ve2 netns 1
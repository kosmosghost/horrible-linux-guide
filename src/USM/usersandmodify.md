## Users and Modify
To create a new user use the useradd command:

```
useradd <USERNAME>
```

And to modify the user use the usermod command:

```
usermod <MODIFY> <USER>
```

For example, to add a user to a group use the following command:

```
usermod -a -G sudo,wheel <USERNAME>
```
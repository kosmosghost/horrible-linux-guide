## Options
To create a homedirectory while creating the user add the -m option:

```
useradd -m <USERNAME>
```

To create a custom home directory use:

```
useradd -m -d <DIRECTORY> <USERNAME>
```

To create a new user and add to a primary group at creation use:

```
useradd -g <GROUP> <USERNAME>
```

A user may belong to many secondary groups. Seperate each group name with an apostrophe. To create a new user and add to a secondary group at creation use:

```
useradd -G <GROUP,GROUP> <USERNAME>
```

To create a new user using a specific shell use the -s option.

```
useradd -s /bin/bash <USERNAME>
```

To create a new user and add descriptive comment use the -c option:

```
useradd -c "COMMENT" <USERNAME>
```
To create a new user and add an expiration date to the account use:

```
useradd -e <DATE> <USERNAME>
```

Example:

```
useradd -e 2021-01-01 user
```

To create a system user use the -r option:

```
useradd -r <USERNAME>
```

To add a user to a specific group use the command:

```
usermod -a -G <GROUP> <USER>
```

To disable a specific user from being able to login use:

```
usermod -s /sbin/nologin <USER>
```

To force a user to change their password use:

```
usermod -l <USERNAME>

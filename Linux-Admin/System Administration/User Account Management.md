When users/groups are created they are maintained in the following 3 files:
- /etc/passwd - list of users
- /etc/group - list of groups
- /etc/shadow - list of encrypted passwords

### useradd
used to create a new your on a linux system

***Example:***

```bash
$ useradd -g superheros -s /bin/bash -c "user description" -m -d /home/spiderman spiderman
```

`-g`: specifies a group option
`-s`: option to give a shell
`-c`: define user description option
`-m -d`: define user and user home directory

### userdel
used to delete users on your linux system

***Example:***

```bash
$ userdel -r spiderman
```

`-r`: delete users home directory option

### usermod
modify a user within your linux machine

|Options|Description|
|:--------|:------------|
  |-b, --badnames|allow bad names|
  |-c, --comment |new value of the GECOS field|
 | -d, --home|new home directory for the user account|
  |-e, --expiredate| set account expiration date to EXPIRE_DATE|
  |-f, --inactive|set password inactive after expiration to INACTIVE|
  |-g, --gid|force use GROUP as new primary group|
 | -G, --groups|new list of supplementary GROUPS|
  |-a, --append| append the user to the supplemental GROUPS mentioned by the -G option without removing the user from other groups|
 | -h, --help |display this help message and exit|
  |-l, --login |new value of the login name|
  |-L, --lock|lock the user account|
  |-m, --move-home |move contents of the home directory to the new location (use only with -d)|
  |-o, --non-unique| allow using duplicate (non-unique) UID|
  |-p, --password|use encrypted password for the new password|
 | -R, --root|  directory to chroot into|
  |-P, --prefix| prefix directory where are located the /etc/* files|
  |-s, --shell SHELL|new login shell for the user account|
  |-u, --uid UID| new UID for the user account|
 | -U, --unlock | unlock the user account|
  |-v, --add-subuids | add range of subordinate uids|
  |-V, --del-subuids |remove range of subordinate uids|
  |-w, --add-subgids|add range of subordinate gids|
 | -W, --del-subgids|remove range of subordinate gids|
  |-Z, --selinux-user|SELinux user mapping for the user account|

### groupadd
add a group to your linux system

***Example:***
```bash
$ groupadd superhero
```

### groupdel
remove a group to your linux system

***Example:***
```bash
$ groupdel superhero
```

### chgrp
change the group of a user

***Example:***

```bash
$ chgrp -R superheros spiderman
```

`-R`: cascade permission to every folder

# Enable Password Aging

### chage 

chage allows you to specify aging of users password. the parameters for this functionalality is automatically set for new users in the `/etc/login.defs` file:

- PASS_MAX_DAYS 99999
- PASS_MIN_DAYS 0
- PASS_MIN_LEN 5
- PASS_WARN_AGE 7

|Options|Description|
|:--------|:------------|
|-m|minimum days before password change is allowed|
|-M|maximum days the password is valid|
|-d| last day until change|
|-I| number of days after password expiration that the account is disabled|
|-E|expiration date of password|
|-W|number of days before the password is expired before user is warned|

***Example:***

```bash
$ chage -m 5 -M 90 -W 10 -I 3 user
```

Once you have added aging parameters to a users password you will see them specified in the `/etc/shadow` file

![[Pasted image 20231018203435.png]]

# Monitor Users Commands

|Command|Description|
|:-----------|:------------|
|who|tells you how many poeple are logged in the user id, terminal id and when they logged in|
|last|full login history of all users|
|w|(more verbose who) gives login time, idle time, and processes run|
|id|gives you information about a specific user|

# Talking to Users

The `users`, `wall`, and `write` commands are used for communication and information sharing among users in a Linux or Unix-like environment. Here's an explanation of each command along with examples:

1. **`users` Command**:
    
    The `users` command is used to display a list of users who are currently logged into the system.
    
    Example:
    
```bash
$ users
```
    
    Output:
    
    `user1 user2 user3`
    
This command simply lists the usernames of users who are currently logged in. It's a quick way to see who else is using the system.
    
2. **`wall` Command**:
    
    The `wall` (short for "write to all") command is used to send a message to all users who are currently logged into the system. It's often used by administrators to broadcast important messages or announcements to all users.
    
    Example:
    
```bash
$ wall "The server will be undergoing maintenance at 10:00 PM. Please save your work and log out."
```
    
When you run this command, all users currently logged in will receive the message on their terminal.
    
3. **`write` Command**:
    
    The `write` command is used to send a message to a specific user who is currently logged into the system. It allows for one-on-one communication.
    
    Example:
    
```bash
$ write user2
```
    
After running this command, you can type your message, and it will be sent directly to the user named "user2." Once the message is sent, the recipient will see it on their terminal.
    
To exit the `write` command and return to your shell prompt, press `Ctrl+D`.
    
Example:

```bash
$ write: user2 is logged in more than once; writing to pts/0 Hello, user2! How can I help you with the project?
```
    
In the example above, you initiate a chat with "user2" using the `write` command.
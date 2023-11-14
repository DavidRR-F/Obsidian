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

## System Utility Commands

### `uptime`

![[Pasted image 20231023160112.png]]

- <span style="color:pink;">11:18:23</span> - the current linux system time
- <span style="color:green;">up 83 days</span> - how long your system has been running
- <span style="color:blue;">4 users</span> - number of users currently logged into your linux machine
- <span style="color:orange;">load average 0.16,0.03,0.01</span> - average CPU load for 1, 5, and 15 minutes

### `hostname`
    
- Explanation: The `hostname` command is used to display or set the system's hostname, which is the name that identifies a device on a network.
- Example: To display the current hostname, simply run `hostname`. To set a new hostname, use `hostname NEW_HOSTNAME`, replacing `NEW_HOSTNAME` with the desired name.
- 
### `uname`
    
- Explanation: The `uname` command provides information about the system, such as the kernel name, network node hostname, kernel release, kernel version, machine hardware name, and processor architecture.
- Example: Running `uname -a` will display detailed system information, including all the available information.

### `which`
    
- Explanation: The `which` command is used to locate and display the path of a command or executable in the system's PATH environment variable.
- Example: To find the path of a command like `ls`, use `which ls`. It will return the full path to the `ls` command, e.g., `/bin/ls`.

### `cal`
    
- Explanation: The `cal` command is used to display a calendar for a specific month or year in the terminal.
- Example: To display a calendar for the current month, simply run `cal`. To show a calendar for a specific year, use `cal <year>`. For example, `cal 2023` will display the calendar for the year 2023.
- 
### `bc`
    
- Explanation: The `bc` command is a calculator that performs mathematical calculations in the terminal, including arithmetic, trigonometry, and more.
- Example: You can use `bc` to perform simple calculations, such as:
        - Addition: `echo "5 + 3" | bc`
        - Subtraction: `echo "10 - 4" | bc`
        - Multiplication: `echo "6 * 7" | bc`
        - Division: `echo "20 / 4" | bc`
        - Square root: `echo "sqrt(25)" | bc`

## Message of the day

The "Message of the Day" (MotD) is a simple and often customizable text message or banner that is typically displayed to users when they log into a Unix-like operating system or shell environment. The primary purpose of the MotD is to provide system administrators with a way to communicate important information, updates, or announcements to users as they access the system.

1. **Welcome Message**: The MotD often serves as a welcome message to users, providing a friendly greeting or acknowledging their successful login to the system.
    
2. **System Information**: System administrators can use the MotD to display important system information, such as the system's hostname, IP address, current operating system version, or system uptime.
    
3. **News and Announcements**: The MotD can be used to convey important news, announcements, or updates related to the system, applications, or security. This information can include scheduled maintenance, security alerts, or reminders.
    
4. **Legal Notices**: In some environments, legal notices or terms of use may be displayed in the MotD to remind users of their responsibilities and obligations when using the system.
    
5. **Customization**: System administrators have the flexibility to customize the MotD to suit their organization's needs. This may include adding ASCII art, branding elements, or specific instructions.
    
6. **Dynamic Content**: Some MotDs can display dynamic content based on user login, time of day, or other factors. For example, it may display different messages for different user groups or provide information specific to the user's role.
    
7. **Location**: The MotD file is often located in the `/etc/` directory and is typically named `motd` or `issue`. Its contents can be edited using a text editor, allowing administrators to update the message as needed.
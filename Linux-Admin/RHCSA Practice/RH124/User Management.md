## General Overview

#### Commands

- `useradd` - Used to create a new user account on the system
- `groupadd` - Used for creating a new group in the system
- `userdel` - Removes a user account from the system
- `groupdel` - Removes a group from the system
- `usermod` - Modifies a user account
#### Files

- `/etc/passwd` - This file contains user account information. For each user, it stores details like username, user ID (UID), group ID (GID), home directory, and shell. It's one of the primary files for user management in Unix and Linux systems
- `/etc/group` - This file maintains group information. It lists all the groups defined in the system with details like group name, group ID, and the members of each group. It's essential for managing group memberships and permissions
- `/etc/shadow` - This file securely stores encrypted user password information. It's accessible only by privileged users and contains data like the password hash, password change dates, and account expiration details

## In Depth Material

- [[User Account Management]]
- [[Account Authentication]]
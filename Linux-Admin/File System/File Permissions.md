Every file and directory in your account can be protected from or made accessible to other users by changing its access permissions.

### 3 permission types
- r - read
- w - write
- x- execute

### 3 control levels
- u - user
- g - group
- o -other (everyone on the system)

![[Pasted image 20231015092557.png]]

### Commands

#### chmod
used to change the permissions of files and directories. The word "chmod" stands for "change mode," and it allows you to control who can read, write, and execute a file or directory

```bash
$ chmod [options] mode file/directory
```

Common `chmod` Options:

- `-R` (or `--recursive`): Apply permissions recursively to all files and directories within the specified directory.
- `-v` (or `--verbose`): Display detailed output, showing the changes made.
- `-c` (or `--changes`): Display only the modified permissions.


1. Symbolic Mode:
    
    - Symbolic mode allows you to use letters and symbols to represent the changes you want to make to the permissions of a file or directory. It consists of three parts:
        - Who (user, group, others) the permission applies to (u, g, o, a).
        - The operation to perform (+ for adding permission, - for removing, and = for setting explicitly).
        - The permission itself (r for read, w for write, x for execute).
    
    Example:
    
    - To give the owner of a file read and write permissions: `chmod u+rw file.txt`
    - To remove execute permission for others: `chmod o-x file.txt`
    - To set read and execute permissions for the group explicitly: `chmod g=r-x file.txt`
2. Octal (Numeric) Mode:
    
    - Octal mode uses three digits (0-7) to represent the permissions for the owner, group, and others in a numeric format.
        - 4 represents read permission.
        - 2 represents write permission.
        - 1 represents execute permission.
        - You sum these values to specify the desired permissions.
        
| Number | Permission Type | Symbol |
|:----------|:-------------------|:---------|
|0|No Permission|---|
|1|Execute|--x|
|2|Write|-w-|
|3|Execute + Write|-wx|
|4|Read|r--|
|5|Read + Execute|r-x|
|6|Read+Write|rw-|
|7|Read + Write + Execute|rwx|


## File Ownership

There are two owners of a file or directory a **user** and **group**. There are 2 commands to change the ownership of a file:
- ***chown*** - changes the user ownership of a file
-  ***chgrp*** - changes the group ownership of a file

***Note***: has recursive flag -R for cascading ownership of all subdirectories/files in a parent directory

## Access Control List (ACL)

Provides a additional more flexible permission mechanism for file systems. It is designed to assist with UNIX file permissions. ACL allows you to give permissions for any user or group to any disc resource.

Example: A user is not part of a particular group created by you but you still want to give some read or write access.

Commands to assign and remove ACL permissions are:
- ***setfacl***
- ***getfacl***

| Task | Command |
|:-----|:-------------|
| Add permission for user | setfacl -m u:user:rwx /path/to/file |
| Add permission for  a group | setfacl -m g:group:rw /path/to/file |
| Add cascading directory permissions | setfacl -Rm u:user:rw /path/to/dir |
| remove a specific entry (for a specific user) | setfacl -x u:user /path/to/file |
| remove all entries (for all users) | setfacl -b /path/to/file |








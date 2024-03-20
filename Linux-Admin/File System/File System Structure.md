| File              | Description                                                                                                  |
| :---------------- | :----------------------------------------------------------------------------------------------------------- |
| /boot             | contains file that is used by the boot loader (grub.cfg)                                                     |
| /root             | root user home directory                                                                                     |
| /dev              | systems devices (disk, cdrom, speakers, flashdrive, keyboard, etc..)                                         |
| /etc              | configuration files                                                                                          |
| /bin -> /usr/bin  | Everyday user commands                                                                                       |
| /sbin -> /usr/bin | system/filesystem commands                                                                                   |
| /opt              | optional add-on applications (Not part of OS apps)                                                           |
| /proc             | running processes (Only exists in Memory)                                                                    |
| /lib -> /usr/lib  | C programming library files needed by commands and apps                                                      |
| /tmp              | directory for temporary files                                                                                |
| /home             | directory for users                                                                                          |
| /var              | system logs                                                                                                  |
| /run              | system daemons that start very early (e.g. systemd and udev) to store temporary runtime files like PID files |
| /mnt              | to mount external filesystem (e.g. NFS)                                                                      |
| /media            | for cdrom mounts                                                                                             |

## File Commands 

| Command | Description | parameters |
|:------------|:--------------|:-------------|
| touch | creates empty file | |
| cp | copy a existing file to destination | -R (recursive copy) |
| vi | file editor | |
| mkdir | create directory | |
| whoami | display current user | | 
| pwd | get current directory | | 
| ls | list files in directory | -l (list), ls -ltr (list in order), -li (inodes) | 
| find | find file location (iterates over the file system) | find directory_name -name "file_name" |
| locate | find file location (uses a prebuilt database) | locate "file_name" |
|ln | create file links | -s (create soft link)|
## Wild Cards

A wild card is a character that can be used as a substitute for any of a class of charaters in a search

- ******* - represents zero or more characters

```bash
 $ rm *-xyz
```

- ***?*** - represents a single character

```bash
 $ ls -l file?-xyz
```

- ***[]*** - represents a range of characters

```bash
 $ ls -l *[cd]*
```

- ***{}*** - represents a series of characters

```bash
 $ touch file{1...9}-xyz
```
## Soft and Hard Links

***inode***: Pointer or number of a file on the hard disk

***Soft Link***: Link will be removed if file is removed or renamed

```bash
$ ln -s /directory/file
```

***Hard Link***: Deleting renaming or moving the original file will not affect the hard link 

```bash
$ ln /directory/file
```


![[Pasted image 20231015082527.png]]


## Computer Storage

- Local Storage
	- RAM, HDD, SSD, etc.

- DAS (Direct Attached Storage)
	- CD/DVD, USB flash drive, external disk directly attached with USB or other cable

- SAN (Storage Area Network)
	- Storage attached through iSCSI or fiber cables

- NAS (Network Attached Storage)
	- Storage attached over network (TCP/IP)
	- E.g. Samba, NFS, etc.

## Disk Partitions 

### `df`

The `df` command is a Unix and Linux command-line utility used to display information about the disk space usage on a file system. It provides details about the amount of space used, available space, and total space on mounted file systems, partitions, or storage devices. The name "df" stands for "disk free."

**Common Options**:

- `-h` or `--human-readable`: This option makes the output more human-readable by displaying sizes in a more user-friendly format, such as "K" for kilobytes, "M" for megabytes, and "G" for gigabytes.
    
```bash
$ df -h
```
    
- `-T` or `--print-type`: This option displays the file system type (e.g., ext4, nfs) along with other information.

```bash
$ df -T
```
    
- `-a` or `--all`: This option includes all file systems, including those that are typically not shown in the default output (e.g., pseudo filesystems like `tmpfs`).
    
```bash
$ df -a
```
    
- `-i` or `--inodes`: This option displays information about the number of used and free inodes on the file system. Inodes are data structures used to store information about files and directories.
    
```bash
$ df -i
```
    
- `-P` or `--portability`: This option ensures that the output is POSIX-compliant and consistent across different systems. It forces a fixed-width output format.
    
```bash
$ df -P
```
    

**Specific File System**: You can specify a particular file system or mount point to display information for a specific device or directory. For example:

```bash
$ df /mnt/data
```

### `fdisk`

The `fdisk` command is a command-line utility used in Unix-like operating systems, including Linux, to manage disk partitions on storage devices, such as hard drives and solid-state drives (SSDs). With `fdisk`, you can create, delete, modify, and display information about disk partitions. It is a powerful tool for disk partitioning and is often used by system administrators and advanced users for managing storage on Linux systems.

Here are some common tasks and options associated with the `fdisk` command:

1. **View Partition Information**: To display information about the partitions on a specific disk, you can run `fdisk` with the `-l` option followed by the device name. For example, to view the partitions on the `/dev/sda` disk, you would use:
    
```bash
$ fdisk -l /dev/sda
```
    
2. **Create a New Partition**: You can use `fdisk` to create a new partition on an empty space on a disk. Use the following steps:
    
    - Start `fdisk` for the desired disk: `fdisk /dev/sdX` (replace `X` with the appropriate drive identifier).
    - Enter `n` to create a new partition.
    - Follow the prompts to specify the partition size, type, and location.
    - Save your changes with `w`.
3. **Delete a Partition**: To delete an existing partition, start `fdisk` for the disk containing the partition and use the `d` option followed by the partition number. For example:
    
```bash
$ fdisk /dev/sdX (fdisk) d Partition number (1-4): 1
```
    
4. **Change Partition Type**: You can change the type of an existing partition using the `t` option in `fdisk`. This can be useful for specifying the file system type or partition ID.
    
```bash
$ fdisk /dev/sdX (fdisk) t
```
    
5. **Set Bootable Flag**: To mark a partition as bootable (typically the case for the root or boot partition), you can use the `a` option in `fdisk`.
    
```bash
$ fdisk /dev/sdX (fdisk) a
```
    
6. **Write Changes**: After making changes to the partition table, you need to write the changes to disk for them to take effect. Use the `w` option in `fdisk` to write the changes.
    
```bash
$ fdisk /dev/sdX (fdisk) w
```


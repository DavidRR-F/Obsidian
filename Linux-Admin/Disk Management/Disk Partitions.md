
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

## Logical Virtual Management - LVM

LVM is a technology and set of utilities used in Unix-like operating systems, including Linux, to manage and abstract storage devices, such as hard drives (HDDs) and solid-state drives (SSDs), in a flexible and efficient manner. LVM allows for the creation of logical volumes (LVs) that span one or more physical storage devices, providing advantages in terms of volume management, resizing, and data protection.

![[Pasted image 20231114200838.png]]

### Add Disk and Create New LVM Partition

![[Pasted image 20231114205208.png]]

 1. Create a Partition

```bash
$ fdisk /dev/sdc

fdisk> n # new partition
fdisk> p # primary partition
# the rest as default values

# change partition type
fdisk> t # change partition
fdisk> L # see hex codes
fdisk> 8e # Linux LVM partition

fdisk> w # write to partition
```

2. Create a physical volume

```bash
$ pvcreate /dev/sdc1
```

Verify

```bash
$ pvdisplay
```

3. Create Volume Group

```bash
$ vgcreate <group_name> <pysical_volume>
```

Verify

```bash
$ vgdisplay
```

4. Create Logical Volume

```bash
$ lvcreate -n <volume_name> --size 1G <volume_group>
```

Verify

```bash
$ lvdisplay
```

5.  Format Disk and assign xfs File System

Assign xfs File System

```bash
$ mkfs.xfs /dev/<volume_group>/<logical_volume>
```

Mount Logical Volume to directory

```bash
$ mkdir /mydir

$mount /dev/<volume_group>/<logical_volume> /mydir
```

Verify

```bash
$ df -h
```

### Add and Extend Disk using LVM

1.  Partition a Disk

```bash
$ fdisk /dev/sdd

fdisk> n # new partition
fdisk> p # primary partition
# the rest as default values

# change partition type
fdisk> t # change partition
fdisk> L # see hex codes
fdisk> 8e # Linux LVM partition

fdisk> w # write to partition
```

2. Create Physical Volume

```bash
$ pvcreate /dev/sdd1
```

3. Extend Volume Group

```bash
$ vgextend <volume_group> /dev/sdd1
```

4. Extend Logical Volume

```bash
$ lvextend -L+1024M /dev/mapper/<volume_group>-<logical_volume>
```

You can find this volume using `df -h`

5. Extend File System

```bash
$ xfs_growfs /dev/mapper/<volume_group>-<logical_volume>
```

Extending a disk using LVM (Logical Volume Manager) offers several advantages and flexibility in managing storage on Linux systems

1. **Dynamic Storage Allocation**:
    
    - LVM allows you to dynamically allocate storage space to logical volumes (LVs) without the need to repartition physical devices or create new partitions.
    - This dynamic allocation means you can adjust the size of a logical volume as your storage needs change, which is especially useful in environments with evolving data requirements.

2. **No Downtime**:
    
    - You can extend a logical volume while the file system on that volume is still in use. There's no need to unmount the file system or take the system offline, which minimizes disruption to users and applications.

3. **Efficient Space Utilization**:
    
    - LVM enables efficient space utilization by allowing you to allocate only as much storage as you currently need. You can then add more space as required, reducing the risk of over-provisioning or wasting storage resources.

4. **Improved Backup and Snapshot Management**:
    
    - Extending a logical volume allows you to create larger snapshot volumes, which can be valuable for backup purposes or for creating consistent point-in-time copies of data.
    - Larger logical volumes can accommodate more data, facilitating backup and data management.

5. **Migration and Data Relocation**:
    
    - LVM makes it easier to migrate data between physical volumes or storage devices. This can be useful for replacing aging hardware or redistributing data for better performance.
    - You can move data between logical volumes within the same volume group or even between different volume groups.

6. **Performance Optimization**:
    
    - Extending a logical volume can improve storage performance, especially when combined with techniques like striping (data is distributed across multiple physical devices) or adding faster storage devices to the volume group.

7. **Redundancy and Data Protection**:
    
    - By extending logical volumes, you can create redundant setups, such as mirroring or RAID configurations, to enhance data protection and fault tolerance.

8. **Simplified Storage Management**:
    
    - LVM simplifies storage management by providing a unified framework for managing physical volumes, volume groups, and logical volumes. This abstraction layer makes
    - storage administration more straightforward.

9. **Long-Term Scalability**:
    
    - LVM supports long-term scalability, allowing you to adapt to future storage requirements without the need for significant reconfiguration or downtime


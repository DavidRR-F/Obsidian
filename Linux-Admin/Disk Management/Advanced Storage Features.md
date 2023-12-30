
## Stratis (RHEL 8+)

Stratis is an open-source storage management solution for Linux-based operating systems. It aims to simplify and modernize storage management by providing features such as advanced storage pooling, thin provisioning, snapshots, and easy-to-use command-line tools. Stratis is designed to make storage configuration and management more accessible for both system administrators and end-users. It combines the process of creating logical volume management (LVM) and creation of filesystems into one management and handles extending the file system automatically  

![[Pasted image 20231115193534.png]]

### Stratis Setup

1. Install Stratis cli and daemon

```bash
$ yum stratis-cli stratisd
```

2. Enable and start service

```bash
$ systemctl enable|start stratisd
```

3. Create new stratis pool and verify

```bash
$ stratis pool create pool1 /dev/sdb
$ stratis pool list
```

4. Extend the pool

```bash
$ stratis pool add-data pool1 /dev/sdc
```

## RAID

RAID, which stands for "Redundant Array of Independent Disks" or "Redundant Array of Inexpensive Disks," is a technology used in data storage to improve data redundancy, performance, and availability. RAID achieves these goals by combining multiple physical hard drives or solid-state drives (SSDs) into a single logical storage unit called an array. There are several RAID levels, each with its own characteristics and benefits. Here are some of the key RAID levels:

1. **RAID 0 (Striping)**:
    
    - RAID 0 provides increased performance by striping data across multiple drives. This means that data is divided into blocks, and each block is written to a different drive simultaneously.
    - RAID 0 does not provide redundancy or fault tolerance. If one drive in the array fails, all data is typically lost.
    - RAID 0 is often used for tasks where performance is critical but data redundancy is not a concern, such as video editing or gaming.

2. **RAID 1 (Mirroring)**:
    
    - RAID 1 duplicates data across multiple drives, creating an exact copy (mirror) on each drive.
    - RAID 1 provides data redundancy because if one drive fails, the data is still accessible from the mirrored drive.
    - RAID 1 is commonly used in applications where data integrity and fault tolerance are important, such as database servers.

3. **RAID 5 (Striping with Parity)**:
    
    - RAID 5 stripes data across multiple drives like RAID 0, but it also includes parity information, which provides redundancy.
    - If one drive in a RAID 5 array fails, the data can be reconstructed using the parity information on the remaining drives.
    - RAID 5 is suitable for environments where both performance and data redundancy are important.

4. **RAID 6 (Striping with Dual Parity)**:
    
    - RAID 6 is similar to RAID 5 but includes dual parity, which allows for the simultaneous failure of two drives without data loss.
    - It provides a higher level of redundancy but requires more drives than RAID 5.
    - RAID 6 is used in scenarios where high data availability is critical.

5. **RAID 10 (Striping and Mirroring)**:
    
    - RAID 10 combines elements of RAID 1 and RAID 0. It mirrors data by creating pairs of drives (RAID 1), and then it stripes data across those pairs (RAID 0).
    - RAID 10 offers both performance and redundancy advantages, making it popular for critical applications.

6. **RAID 50 and RAID 60**:
    
    - These RAID levels combine striping and parity with multiple sets of RAID 5 (RAID 50) or RAID 6 (RAID 60).
    - They are suitable for large-scale storage systems that require high performance and redundancy.

## File System Check

### `fsck` and `xfs_repair`

The `fsck` utility is used to check and repair Linux filesystems (ext2, ext3, ext4, etc..) while the `xtf_repair` utility is used to check and repair filesystems for xfs filesystem types. Depending on the last time a file system was checked, the system runs the `fsck` during boot time to check whether the filesystem is in a consistent state. Make sure to execute the fsck on an **unmounted** file systems to avoid any corruption issues.

### `fsck`

`fsck` (File System Consistency Check) is a command-line utility used in Unix-like operating systems to check and repair the integrity of file systems. Depending on the specific file system you are working with (e.g., ext4, XFS, or others), the options and behavior of `fsck` may vary slightly. Below, I'll provide examples of `fsck` commands with relevant options for the ext4 file system, which is one of the most commonly used file systems on Linux.

- **Check a File System**: To check a file system for errors, you can use the `fsck` command followed by the device or file system's path. For example, to check the `/dev/sda1` partition:
    
```bash
$ sudo fsck /dev/sda1
```
    
- **Automatically Repair Errors**: To automatically repair errors without user interaction, use the `-y` or `--yes` option:
    
```bash
$ sudo fsck -y /dev/sda1
```
    
    
- **Check and Repair a File System Non-Interactively**: To automatically repair errors without asking for confirmation, use the `-p` or `--automatically` option:
    
```bash
$ sudo fsck -p /dev/sda1
```    
    
- **Check a File System and Print Progress**: You can use the `-C` option to display a progress indicator while checking the file system. For example:
    
```bash
$ sudo fsck -C /dev/sda1
```
    
    
- **Check and Repair a Specific File System Type**: If you want to check and repair a specific file system type (e.g., ext4), you can specify the `-t` option followed by the file system type:
    
```bash
$ sudo fsck -t ext4 /dev/sda1
```
    
    
- **Force Check Even if File System Seems Clean**: You can force a file system check, even if it appears clean, using the `-f` or `--force` option:
    
```bash
$ sudo fsck -f /dev/sda1
```
    
    
- **Check and Repair All File Systems at Boot**: On some Linux distributions, you can schedule file system checks at boot time by editing the `/etc/fstab` file and adding the `fsck` pass number to the file system's entry. A pass number of `1` means to check the file system at boot, and a pass number of `2` means to check and repair it:
    
```bash
/dev/sda1 / ext4 defaults 1 1
```
    
### `xfs_repair`

`xfs_repair` is a command-line utility used to check and repair XFS file systems, which is a high-performance file system commonly used on Linux systems. Unlike `fsck` it does not run at boot and is used to handle larger partitions. Below are some examples of `xfs_repair` commands with relevant options:

1. **Check an XFS File System**: To check an XFS file system for errors, use the `xfs_repair` command followed by the device or file system's path. For example, to check the XFS file system on `/dev/sdb1`:
    
```bash
$ sudo xfs_repair /dev/sdb1
```
    
2. **Automatically Repair Errors**: To automatically repair errors without user interaction, use the `-L` or `--force` option:
    
```bash
$ sudo xfs_repair -L /dev/sdb1
```
    
3. **Check and Repair an XFS File System Non-Interactively**: To automatically repair errors without asking for confirmation, use the `-P` or `--phase-preen` option:
    
```bash
$ sudo xfs_repair -P /dev/sdb1
```
    
4. **Force Check Even if File System Seems Clean**: You can force an XFS file system check, even if it appears clean, using the `-f` or `--force` option:
    
```bash
$ sudo xfs_repair -f /dev/sdb1
```
    
5. **Specify an Alternate Log Device**: If your XFS file system uses a separate log device (e.g., `/dev/sdc1`), you can specify it using the `-l` or `--logdev` option:
    
```bash
$ sudo xfs_repair -l /dev/sdc1 /dev/sdb1
```
    
6. **Output Repair Progress**: To display progress information during the repair process, you can use the `-v` or `--verbose` option:
    
```bash
$ sudo xfs_repair -v /dev/sdb1
```
    
7. **Specify a Log Directory**: If you need to specify a log directory for temporary files, you can use the `-L` or `--log` option followed by the directory path:
    
```bash
$ sudo xfs_repair -L /tmp/logdir /dev/sdb1
```
    
8. **Specify a Metadata Directory**: To specify a metadata directory for temporary files, use the `-m` or `--mdir` option followed by the directory path:
    
```bash
$ sudo xfs_repair -m /tmp/metadir /dev/sdb1
```
    
9. **Dry Run Mode (No Changes Made)**: If you want to perform a dry run without making any changes, you can use the `-n` or `--dryrun` option:
    
```bash
$ sudo xfs_repair -n /dev/sdb1
```

#### Exit Codes

**0 (EXIT_SUCCESS)**: `xfs_repair` completed successfully without any issues. The file system is likely in a healthy state.

**1 (EXIT_FAILURE)**: `xfs_repair` encountered an error during its operation. This exit code typically indicates that the repair process was unsuccessful.

**2 (EXIT_BADARG)**: `xfs_repair` was invoked with incorrect or invalid command-line arguments. This exit code suggests that there may be a problem with the command syntax.

**3 (EXIT_CMD_ERROR)**: `xfs_repair` detected a command error, such as an incorrect or unknown subcommand or option.

**4 (EXIT_DUP_SUPER_ERROR)**: Duplicate or multiple superblocks were found on the file system, indicating a potential issue with the file system metadata.

**5 (EXIT_FS_ERROR)**: A file system error was detected that could not be repaired. This exit code suggests that the file system may be corrupt beyond repair.

**6 (EXIT_NO_CORE_DUMP)**: `xfs_repair` was unable to generate a core dump file in the event of a crash or failure.

**7 (EXIT_CORRUPT_METADATA)**: Corrupted metadata was detected on the file system. This exit code indicates that there are issues with the file system structure.

**8 (EXIT_FORCE_READONLY)**: `xfs_repair` is forcing the file system into read-only mode to prevent further damage or data loss. This exit code is used when certain errors are encountered.

**9 (EXIT_EIO_ERROR)**: An I/O (Input/Output) error occurred while reading or writing to the file system. This may indicate a hardware issue or a problem with the underlying storage device.

**10 (EXIT_UNIMPLEMENTED)**: `xfs_repair` encountered an unimplemented feature or functionality. This exit code suggests that the tool lacks support for certain operations.

## System Backup

### 5 Different Types of Backups

1. **System Backup:**
    
    - Captures the entire state of a system, including the operating system, installed software, settings, and system files.
    - Allows for the restoration of the entire system to a previous state, often used for disaster recovery.
    - Useful when you need to recover from a system crash, malware attack, or hardware failure.

2. **Application Backup:**
    
    - Involves backing up specific applications and their related data.
    - This can include application files, configurations, databases, and user data related to the application.
    - Ideal for ensuring business continuity for critical applications and minimizing downtime in case of application-specific issues.

3. **Database Backup:**
    
    - Focuses specifically on backing up databases.
    - Can be done in various ways, including full database backups, incremental updates, or log-based backups.
    - Essential for businesses that rely heavily on database-driven applications, as it ensures data integrity and consistency.

4. **Filesystem Backup:**
    
    - Involves backing up files and folders within a filesystem.
    - Can be performed at different levels, from individual files to entire directories.
    - Allows for selective backup and recovery, which is useful for restoring lost or corrupted files without affecting the entire system.

5. **Disk Backup or Disk Imaging:**
    
    - Creates a complete snapshot of a disk, including all the data and information necessary to restore a disk to its exact state at the time of backup.
    - Useful for restoring an entire drive, including the operating system, applications, and data.
    - Often used for migrating data to a new hard drive or for system recovery.

### dd command

`dd` is a command line utility for Unix and Unix-like operating systems whose primary purpose is to convert and copy files. As a result, dd can be used for tasks such as backing up the boot sector of a hard drive, and obtaining a fixed amount of random data

### Basic Syntax

The basic syntax of `dd` is:

```bash
$ `dd if=<input file> of=<output file> [options]
```

- `if=`: Specifies the input file or device.
- `of=`: Specifies the output file or device.

### Common Options

1. **bs=BYTES**
    
    - Sets both input and output block size to BYTES.
    - For example, `bs=1M` sets the block size to 1 megabyte.
2. **count=BLOCKS**
    
    - Copies only BLOCKS input blocks.
    - Used with `bs` to determine the total amount of data to copy.
3. **skip=BLOCKS**
    
    - Skips BLOCKS blocks at the start of the input.
    - Useful for starting the copy from a specific point in the input.
4. **seek=BLOCKS**
    
    - Skips BLOCKS blocks at the start of the output.
    - Allows you to offset where the writing begins in the output file.
5. **conv=CONVERSIONS**
    
    - Applies various conversions to the data as it is copied.
    - Common conversions include `notrunc` (do not truncate the output file), `sync` (pad every input block to size of `ibs` with trailing zeros), and `noerror` (continue after read errors).
6. **status=LEVEL**
    
    - Controls the level of information `dd` outputs.
    - Common values are `none` (no information), `noxfer` (no transfer statistics), and `progress` (periodic transfer statistics).

# SAN

SAN stands for "Storage Area Network," and it is a specialized network architecture that is dedicated to providing access to high-performance, block-level data storage. SANs are designed to provide fast, reliable, and scalable storage solutions for enterprises and data centers. Here are some key characteristics and components of a SAN:

1. **Block-Level Storage**: SANs operate at the block level, meaning they provide raw storage blocks (usually fixed-size chunks of data) to connected devices. This is in contrast to file-level storage provided by Network-Attached Storage (NAS) devices, which serve files and directories over a network.
    
2. **Dedicated Network**: SANs have their own dedicated network infrastructure optimized for storage traffic. This network is often separate from the regular data network to ensure that storage traffic doesn't compete with other network traffic for bandwidth.
    
3. **High Performance**: SANs are designed for high-speed data access. They use specialized protocols like Fibre Channel (FC), iSCSI (Internet Small Computer System Interface), and Fibre Channel over Ethernet (FCoE) to deliver low-latency, high-throughput storage access.
    
4. **Centralized Storage**: In a SAN, storage resources are centralized in a storage array or set of arrays. These arrays can be made up of hard disk drives (HDDs), solid-state drives (SSDs), or a combination of both.
    
5. **Scalability**: SANs are highly scalable. You can add additional storage capacity by expanding existing storage arrays or adding new ones to the SAN network.
    
6. **Redundancy and Reliability**: SANs are built with redundancy in mind to ensure high availability. Components like redundant controllers, power supplies, and disks help prevent data loss due to hardware failures.
    
7. **Data Protection**: SANs often include features like snapshots, replication, and RAID (Redundant Array of Independent Disks) to protect data from loss or corruption.
    
8. **Virtualization**: SANs can be used in conjunction with storage virtualization technologies to abstract and manage multiple physical storage devices as a single pool of storage resources. This simplifies management and improves resource utilization.
    
9. **Support for Clustering**: SANs are often used in clustered server environments where multiple servers can access shared storage simultaneously. This is particularly important for high-availability and load-balancing configurations.
    
10. **Security**: Security measures, such as zoning (in Fibre Channel SANs) and access control lists, are implemented to restrict access to authorized users and devices.
    
11. **Backup and Disaster Recovery**: SANs facilitate backup and disaster recovery processes by providing a centralized repository for data and enabling data replication to remote locations.
    
12. **Management Tools**: SANs come with management software that allows administrators to monitor and configure storage resources, set up data protection policies, and perform other tasks related to storage management.
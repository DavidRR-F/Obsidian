
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

## Installing SSH

```bash
$ sudo apt install openssh-server
$ sudo systemstl status ssh
$ sudo ufw allow ssh
```

## Enable passwordless login between Nodes

On the Controller Node, generate a public/private ras key pair

```bash
$ ssh-keygen -t rsa
```

Once you have generated the key you can pass them to the Worker Nodes so you can access them without a password.

```bash
$ ssh-copy-id <user>@<hostname/ip>
```

Once the key is added you should be able to login to the worker nodes without a password.

## NFS Setup

To be able to run parallel calculations across multiple nodes we need to setup a centralized network file system on the controller node.

```bash
$ sudo apt-get install nfs-server
```

Create a directory for your nfs then edit the `etc/exports` file. at the EOF add the following

```bash
/your/nfs/path *(rw,sync)
```

Restart the nfs kernel server

```bash
$ sudo service nfs-kernel-server restart
```

Change the ownership of your nfs directory from root to your user

```bash
$ sudo chown slurm-admin /mnt/ssd/nfs
```

### Worker Nodes

On the worker nodes we need to mount the nfs file system from the controller node

```bash
sudo apt-get install nfs-client
```

Edit the `etc/fstab` file to add the mount

```
<controller-hostname>:/controller/nfs/dir/path /worker/nfs/dir/path nfs
```

Remount all Partitions

```bash
sudo mount -a
```

Create a directory for slurm

```bash
$ mkdir /mnt/ssd/nfs/slurm
```
### Partition SSD (Optional)

If we need more space on the nfs we can use a SSD, we will need to patition the SSDs and make sure they are mounted on boot

List all available storage

```shell
$ sudo fdisk -l
```

locate your SSD then create a patition table

```shell
$ sudo fdisk /dev/sda
- Press `g` to create a new empty GPT partition table
- Press `n` to add a new partition (accept default settings)
- Press `w` to write the changes and exit
```

Format the SSD partition

```shell
$ sudo mkfs.ext4 /dev/sda1
```

Create a mount point

```shell
$ sudo mkdir /mnt/ssd
```

Mount the SSD

```shell
$ sudo mount /dev/sda1 /mnt/ssd
```

Update /etf/fstab to make sure the SSD mounts automatically on boot

```bash
$ echo "/dev/sda1 /mnt/ssd ext4 defaults 0 0" | sudo tee -a /etc/fstab
```

## Setup Static IP

Add IP Addresses of clusters

```shell
$ sudo nano /etc/hosts
- Add in following template
<IP Address> <Hostname> <Username>
...
```

Update your cloud.cfg so ips arent wiped on reboot

```shell
$ sudo nano /etc/cloud/cloud.cfg
- comment out update_etc_hosts
```

find ip address

```shell
$ ip addr show
- your eth0 subnet
```

Default Gateway

```shell
$ ip route | grep default
```

Routers local DNS

```
$ cat /etc/resolv.conf
- next to namespace
```

or use googles (8.8.8.8, 8.8.4.4) or cloudflare (1.1.1.1)

Backup your netplan config

```shell
$ sudo cp /etc/netplan/<your-config>.yaml /etc/netplan/<your-config>.yaml.backup
```

Edit your configuration

```shell
$ sudo nano /etc/netplan/<your-config>.yaml
```

```yaml
network:
  version: 2
  ethernets:
    eth0:
      dhcp4: no
      addresses:
        - <ip-address>/24
      routes:
        - to: default
          via: <router-local>
      nameservers:
        addresses: [<router-local-or-third-party>]
```

Apply your changes

```shell
$ sudo netplan apply
```

On some versions of Ubuntu, the open vswitch service is not installed you will have to install and enable the service to use the netplan command.

```shell
$ sudo apt-get install --reinstall openvswitch-switch
$ ls /lib/systemd/system/ovsdb-server.service
$ sudo systemctl start ovsdb-server
```

## Cluster Users

We will create a user for munge and slurm on every node.

```bash
# Create Munge User
$ export MUNGEUSER=1004
$ sudo groupadd -g $MUNGEUSER munge 
$ sudo useradd -m -c "MUNGE Uid 'N' Gid Emporium" -d /var/lib/munge -u $MUNGEUSER -g munge -s /sbin/nologin munge

# create Slurm User
$ export SLURMUSER=1005 
$ sudo groupadd -g $SLURMUSER slurm 
$ sudo useradd -m -c "SLURM workload manager" -d /var/lib/slurm -u $SLURMUSER -g slurm -s /bin/bash slurm
```

## Munge Setup

Munge is a authentication service used for communication between nodes. The setup for munge is the for controller and worker nodes with the exception that the controllers `munge.key` file needs to be transferred to the worker nodes in order to have password less authentication.

First, run the following command to install the munge packages.

```
$ sudo apt-get install munge 
```

This should install successfully as long as you're connected to the internet. Now we need to set permission and ownership of the munge files:

```
$ sudo chown -R munge: /etc/munge/ /var/log/munge/ /var/lib/munge/ /run/munge/
$ sudo chmod 0700 /etc/munge/ /var/log/munge/ /var/lib/munge/ /run/munge/
```

### Copy Munge Key to NFS

We want to add the `munge.key` file to our NFS for slurm so that the controller and worker nodes can authenticate with each other using it.

```bash
sudo scp /etc/munge/munge.key /mnt/ssd/nfs/slurm/
```

update the `munge.key` permissions

```bash
$ sudo chmod -R 777 munge.key
```

Now enable the munge service and restart munge

```bash
$ sudo systemctl enable munge
$ sudo systemctl restart munge
```

# Slurm Configuration
## Controller Node

Install Dependencies

```bash
$ sudo apt-get install mariadb-server 
$ sudo apt-get install slurmdbd 
$ sudo apt-get install slurm-wlm
```

#### Slurm account database (MariaDB)

Access MariaDB as root

```bash
$ su - (or sudo -i)
$ mysql
```

Create a sthe slurm database and grant permission to the slurm user

```sql
create database slurm_acct_db;
grant all on slurm_acct_db.* TO 'slurm'@'localhost' identified by 'yourpassword' with grant option;
```
    
- **`grant all on slurm_acct_db.*`**: Grants all privileges on the database `slurm_acct_db` and all its tables (denoted by `*`) to the user.
- **`TO 'slurm'@'localhost'`**: Specifies the user `slurm` connecting from `localhost` is the grantee. The user `slurm` will have the privileges on `slurm_acct_db`.
- **`identified by 'hashmi12'`**: Sets the password for the `slurm` user to `hashmi12`.
- **`with grant option;`**: Allows the `slurm` user to grant the privileges they have to other users.
- **`create database slurm_acct_db;`**: This SQL statement creates a new database named `slurm_acct_db`. This database is intended to be used by Slurm for accounting purposes, which tracks job and resource usage data.

### Allow ports on firewall

```bash
$ sudo ufw allow 6817 
$ sudo ufw allow 6818 
$ sudo ufw allow 6819
```
### Configure slurm db backend

```bash
$ sudo mkdir /etc/slurm-llnl
$ sudo vi /etc/slurm-llnl/slurmdbd.conf

AuthType=auth/munge 
DbdAddr=localhost 
#DbdHost=master0 
DbdHost=localhost 
DbdPort=6819 
SlurmUser=slurm 
DebugLevel=4 
LogFile=/var/log/slurm/slurmdbd.log 
PidFile=/run/slurm/slurmdbd.pid 
StorageType=accounting_storage/mysql 
StorageHost=localhost 
StorageLoc=slurm_acct_db 
StoragePass=hashmi12 
StorageUser=slurm 
###Setting database purge parameters 
PurgeEventAfter=12months 
PurgeJobAfter=12months 
PurgeResvAfter=2months 
PurgeStepAfter=2months 
PurgeSuspendAfter=1month 
PurgeTXNAfter=12months 
PurgeUsageAfter=12months
```

Update conf permissions

```bash
$ sudo chown slurm:slurm /etc/slurm/slurmdbd.conf
$ sudo chmod 600 /etc/slurm/slumdbd.conf
```
#### Configure `slurm.conf` using the [Configuration website](https://slurm.schedmd.com/configurator.easy.html)

Copy the configuration created through the website and add it to the `/etc/slurm-llnl/slurm.conf`

```bash
$ sudo vi /etc/slurm-llnl/slurm.conf

# slurm.conf file generated by configurator easy.html.  
# Put this file on all nodes of your cluster.  
# See the slurm.conf man page for more information.  
#  
ClusterName=cluster  
SlurmctldHost=node0  
#  
#MailProg=/bin/mail  
#MpiDefault=  
#MpiParams=ports=#-#  
ProctrackType=proctrack/cgroup  
ReturnToService=1  
SlurmctldPidFile=/run/slurm/slurmctld.pid  
SlurmctldPort=6817  
SlurmdPidFile=/run/slurm/slurmd.pid  
SlurmdPort=6818  
SlurmdSpoolDir=/var/spool/slurmd  
SlurmUser=slurm  
#SlurmdUser=root  
StateSaveLocation=/var/spool/slurmctld  
#SwitchType=  
TaskPlugin=task/affinity,task/cgroup  
#  
# TIMERS  
KillWait=30  
MinJobAge=300  
SlurmctldTimeout=120  
SlurmdTimeout=300  
#  
# SCHEDULING  
SchedulerType=sched/backfill  
SelectType=select/cons_tres  
#  
#  
# LOGGING AND ACCOUNTING  
#AccountingStorageType=  
#JobAcctGatherFrequency=30  
#JobAcctGatherType=  
#SlurmctldDebug=info  
SlurmctldLogFile=/var/log/slurmctld.log  
#SlurmdDebug=info  
SlurmdLogFile=/var/log/slurmd.log  
#  
#  
# COMPUTE NODES  
NodeName=node[0-x] CPUs=4 ThreadsPerCore=1 State=UNKNOWN  
PartitionName=debug Nodes=ALL Default=YES MaxTime=INFINITE State=UP
```

### Create hosted slurm files

```bash
$ sudo mkdir /var/spool/slurmctld
$ sudo chown slurm:slurm /var/spool/slurmctld
$ sudo chown 700 /var/spool/slurmctld

$ sudo mkdir /var/log/slurm
$ touch /var/log/slurm/slurmctld.log 
$ touch /var/log/slurm/slurm_jobacct.log /var/log/slurm/slurm_jobcomp.log 
$ sudo chown -R slurm:slurm /var/log/slurm/ 
$ sudo chmod 755 /var/log/slurm
```

#### Change the location of the pid files

```bash
$ sudo vi /usr/lib/systemd/system/slurmctld.service

PIDFile=/run/slurm/slurmctld.pid

$ sudo vi /usr/lib/systemd/system/slurmdbd.service

PIDFile=/run/slurm/slurmdbd.pid

$ sudo vi /usr/lib/systemd/system/slurmd.service

PIDFile=/run/slurm/slurmd.pid
```

Create `/run/slurm` and update ownership and permissions

```bash
$ sudo mkdir -p /run/slurm 
$ sudo chown slurm:slurm /run/slurm 
$ sudo chmod 755 /run/slurm
```

#### Run the following as root echo 

```bash
$ CgroupMountpoint=/sys/fs/cgroup >> /etc/slurm-llnl/cgroup.conf
$ slurm -C
```

- **`CgroupMountpoint=/sys/fs/cgroup`**: This is a configuration setting intended for a configuration file. It specifies a setting or variable named `CgroupMountpoint` and sets its value to `/sys/fs/cgroup`. This path is typically the mountpoint for cgroups (control groups) in a Linux filesystem, which is a feature used to limit, account for, and isolate the resource usage (CPU, memory, disk I/O, etc.) of a collection of processes.
    
- **`>>`**: This is a shell redirection operator used in Unix and Unix-like operating systems. It appends the output of the command on its left to the file on its right. If the file does not exist, it will be created; if the file exists, the text will be added to the end of the file without overwriting its existing contents.
    
- **`/etc/slurm-llnl/cgroup.conf`**: This is the file path to which the configuration line is being appended. It suggests the file is a configuration file for cgroups within the Slurm Workload Manager, a free, open-source job scheduler for Linux and Unix-like kernels. Slurm is often used on large and small computing clusters to allocate resources, provide a framework for starting, executing, and monitoring work (usually in the form of jobs and tasks), and managing workload.
### Start Slurm services

```bash
$ sudo systemctl daemon-reload 
$ sudo systemctl enable slurmdbd 
$ sudo systemctl start slurmdbd 
$ sudo systemctl enable slurmctld 
$ sudo systemctl start slurmctld 

At this point see the status of the started services: 
$ sudo systemctl status slurmd
$ sudo systemctl status slurmdbd 
$ sudo systemctl status slurmctld
```

## Worker Node



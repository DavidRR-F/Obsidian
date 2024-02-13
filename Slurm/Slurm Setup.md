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


## Cluster Users

We will create a user for munge and slurm on every node.

```bash
# Create Munge User
$ export MUNGEUSER=1001 
$ sudo groupadd -g $MUNGEUSER munge 
$ sudo useradd -m -c "MUNGE Uid 'N' Gid Emporium" -d /var/lib/munge -u $MUNGEUSER -g munge -s /sbin/nologin munge

# create Slurm User
$ export SLURMUSER=1002 
$ sudo groupadd -g $SLURMUSER slurm 
$ sudo useradd -m -c "SLURM workload manager" -d /var/lib/slurm -u $SLURMUSER -g slurm -s /bin/bash slurm
```

## Munge Setup

Munge is a authentication service used for communication between nodes. The setup for munge is the for controller and worker nodes with the exception that the controllers `munge.key` file needs to be transferred to the worker nodes in order to have password less authentication.

First, run the following command to install the munge packages.

```
$ sudo apt install munge libmunge2 libmunge-dev
```

This should install successfully as long as you're connected to the internet. To test your installation, you can run the following command:

```
$ munge -n | unmunge | grep STATUS
```

You should see something like `STATUS: SUCCESS`. Now, you have Munge correctly installed and there should be a Munge key at `/etc/munge/munge.key'. If you don't see one, then you should be able to create one manually by running the following command:

```
$ sudo /usr/sbin/mungekey
```

> With future updates of munge, slurm, and ubuntu, specific file locations may change.

Now, we have to ensure all of the munge files have the correct permissions. This just entails giving the munge user ownership over all the munge files. You don't have to create the munge user manually since it should have been created by munge when we installed the packages above. In fact, we recommend saving yourself the trouble and not creating the user yourself. We had a lot of troubles stem from trying to create it ourselves.

To Setup the correct permissions, use the following commands:

```
$ sudo chown -R munge: /etc/munge/ /var/log/munge/ /var/lib/munge/ /run/munge/
$ sudo chmod 0700 /etc/munge/ /var/log/munge/ /var/lib/munge/
$ sudo chmod 0755 /run/munge/
$ sudo chmod 0700 /etc/munge/munge.key
$ sudo chown -R munge: /etc/munge/munge.key
```

Next, we need to restart the munge service and configure it to run at startup. We do that like so:

```
$ systemctl enable munge
$ systemctl restart munge
```

You can investigate munge service errors with:

```
$ systemctl status munge
```

Or

```
$ sudo nano /var/log/munge/munged.log
```

That's it! Now, you can go ahead and Setup your worker nodes. Also, for convenience you can now save your `munge.key` located at `/etc/munge/` to an easily accessible location. You will need to copy that key over to the other nodes in the cluster when setting them up.

```bash
$ sudo scp /etc/munge/munge.key /mnt/ssd/nfs/slurm/
$ chmod -R 777 munge.key
```

Now, we can test the munge connection to the controller node, like so:

```
$ munge -n | ssh <CONTROLLER_NODE> unmunge 
```

Make sure to replace `<CONTROLLER_NODE>` with host alias of your controller node. If this is successful, you should see the munge status of the controller node. If you get an error, try restarting the munge service on the controller node.

## Slurm Setup

### Controller Node

Install Dependencies

```bash
$ sudo apt-get install mariadb-server 
$ sudo apt-get install slurmdbd 
$ sudo apt-get install slurm-wlm
```

#### Slurm account database (MariaDB)

```bash
$ su -
$ mysql
$ grant all on slurm_acct_db.* TO 'slurm'@'localhost' identified by 'hashmi12' with grant option; create database slurm_acct_db;
$ exit
```

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
SlurmctldPidFile=/var/run/slurmctld.pid  
SlurmctldPort=6817  
SlurmdPidFile=/var/run/slurmd.pid  
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
NodeName=node[1-32] CPUs=1 State=UNKNOWN  
PartitionName=debug Nodes=ALL Default=YES MaxTime=INFINITE State=UP
```

### Create hosted slurm files

```bash
$ sudo mkdir /var/spool/slurmctld
$ sudo chown slurm:slurm /var/spool/slurmctld
$ chrown 755 /var/spool/slurmctld

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


#### Run the following as root echo 

```bash
$ CgroupMountpoint=/sys/fs/cgroup >> /etc/slurm-llnl/cgroup.conf
$ slurm -C
```

### Start Slurm services

```bash
$ systemctl daemon-reload 
$ systemctl enable slurmdbd 
$ systemctl start slurmdbd 
$ systemctl enable slurmctld 
$ systemctl start slurmctld 

At this point see the status of the started services: 
$ systemctl status slurmdbd 
$ systemctl status slurmctld

If error
Condition check resulted in Slurm controller daemon being skipped.
```
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

Now, we can test the munge connection to the controller node, like so:

```
$ munge -n | ssh <CONTROLLER_NODE> unmunge 
```

Make sure to replace `<CONTROLLER_NODE>` with host alias of your controller node. If this is successful, you should see the munge status of the controller node. If you get an error, try restarting the munge service on the controller node.
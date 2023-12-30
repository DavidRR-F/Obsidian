
# NFS

NFS, or Network File System, is a distributed file system protocol that allows remote systems to access and share files and directories over a network. It was originally developed by Sun Microsystems and is now a widely used protocol in Unix-like operating systems and networked environments. NFS enables seamless file sharing and access among systems, making it particularly useful in networked environments with multiple machines.

![[Pasted image 20231129134821.png]]

## Steps for NFS Server Configuration

### Server-Side Configuration

1. Install NFS Package

```bash
$ yum install nfs-utils libnfsidmap
```

2. Enable and Start NFS Services

```bash
$ systemctl enable rpcbind
$ systemctl enable nfs-server
$ systemctl start rpcbind, nfs-server, rpc-statd, nfs-idmapd
```

3. Create NFS Share Directory and Assign Permissions

```bash
$  mkdir /shared-dir
$ chmod a+rwx /shared-dir
```

4. Modify `/etc/nfs/exports` file to add new shared filesystem

```
/shared-dir 192.168.x.x (rw, sync, no_root_squash) # for only one host
/shared-dir * (rw, sync, no_root_squash) # for everyone
```

5. Export the NFS filesystem

```bash
$ exportfs -rv
```

### Client-Side Configuration

1. Install NFS Package

```bash
$ yum install nfs-utils rpcbind
```

2. Enable and Start NFS Services

```bash
$ service rpcbind start
```

3. Make sure firewall allows NFS Traffic 

- **Identify the NFS Services and Ports**:
	    
	- NFSv3 commonly uses the following ports:
	        - Port 2049 for NFS service.
	        - Port 111 for RPC-based services (Portmapper).
	        - Ports 32767-32769 for dynamic RPC ports.
	- NFSv4 often uses Port 2049 exclusively.

- **Check Your Current Firewall Configuration**:
	    
	- Use the following command to view your current firewall configuration:
	        
```bash
$ sudo firewall-cmd --list-all
```
	        
- **Open the Necessary Ports**:
	    
	- To open specific ports, you can use the `--add-port` option followed by the port number and protocol (tcp or udp).
	- For example, to open NFSv3 ports:
	        
```bash
$ sudo firewall-cmd --add-port=2049/tcp --permanent 
$ sudo firewall-cmd --add-port=111/tcp --permanent 
$ sudo firewall-cmd --add-port=32767-32769/tcp --permanent
```

- For NFSv4, you typically only need to open Port 2049:
	        
```bash
$ sudo firewall-cmd --add-port=2049/tcp --permanent
```
	        
- **Reload the Firewall Rules**:
	    
	- After adding the necessary rules, reload the firewall to apply the changes:
	        
```bash
$ sudo firewall-cmd --reload
```

4. Show mount from the NFS server

```bash
$ showmount -e 192.168.x.x
```

5. Mount the filesystem and Verify

```bash
$ mount 192.168.x.x:/shared-dir /mnt/nfs-server
$ df -h
```


# Samba 

Samba is an open-source software suite that enables file and print sharing between Unix-like operating systems (such as Linux) and Windows-based systems. It provides interoperability between these different operating systems, allowing them to seamlessly share files, printers, and other resources on a network.

#### SMB vs. CIFS

Samba shares its filesystem through protocols called SMB (Server Message Block) and CIFS (Common Internet File System). CIFS became the extension of SMB and now Microsoft has introduced newer versions of SMB. So SMB and CIFS are used and referred to interchangeably.

## Samba Configuration

### Server-Side Configuration

1. Install Samba Packages

```bash
# Become Root User
$ yum install samba samba-client samba-common
```

2. Enable Samba to be allowed through firewall

```bash
$ firewall-cmd --permanent --zone=public --add-service=samba
$ filewall-cmd --reload
```

3. Create Samba shared directory and assign permissions

```bash
$ mkdir -p /samba/shared-dir
$ chmod a+rwx /samba/shared-dir
$ chown -R nobaody:nobody /samba/shared-dir
```

4. Change the SELinux security context for the Samba shared directory 

```bash
$ chcon -t samba_share_t /samba/shared-dir
```

5. Modify `/etc/samba/smb.conf` file to add new shared filesystem

```toml
[global]
	workgroup = WORKGORUP
	netbios name = centos
	security = user
	map to guest = bad user
	dns proxy = no

[Anonymous]
	path = /samba/shared-dir
	browsable = yes
	writable = yes
	guest ok = yes
	guest only = yes
	read only = no
```

6. Enable and Start Samba services

```bash
$ systemctl enable smb, nmb
$ systemctl start smb, nmb
```


### Client-Side Configuration

#### Mount on Windows Client

1. Go to Start
2. Go to Search Bar
3. Type `\\<Server's IP Address>`

#### Mount on Linux Client

1. Install CIFS Service

```bash
# Become Root User
$ yum -y install cifs-utils samba-client
```

2. Mount the samba share

```bash
$ mkdir /mnt/sambashare
$ mount -t cifs //192.168.x.x/Anonymous /mnt/sambashare/
```


### Secure Samba Server

1. Create a group and user to access the samba server with proper authentication

```bash
$ useradd larry
$ groupadd smbgrp
$ usermod -a -G smbgrp larry
$ smbpasswd -a larry
```

2. Create a new share, set the permission on the share

```bash 
$ mkdir /samba/secureshare
$ chown -R larry:smbgrp /samba/secureshare
$ chmod -R 0770 /samba/secureshare
$ chcon -t samba_share_t /samba/secureshare
```

3. Modify `/etc/samba/smb.conf` file to add new shared filesystem

```toml
[global]
	workgroup = WORKGORUP
	netbios name = centos
	security = user
	map to guest = bad user
	dns proxy = no

[Secure]
	path = /samba/secureshare
	valid users = @smbgrp
	guest ok = no
	writable = yes
	browsable = yes
```

4. Restart the services

```bash
$ systemctl restart smb, nmb
```


# NAS Device for NFS or Samba

A storage can be carved on a Linux Server, and it can be shared with another Linux machine through NFS or to a Windows machine through Samba. NFS/Samba or any NAS Service can be setup through a dedicated NAS device.

![[Pasted image 20231129155129.png]]


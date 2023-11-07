### Basic Overview

SSH stands for secure shell and provides you with an interface to the Linux system. Open SSH is a package/software with a service daemon `sshd`. It takes in your commands and translates them to kernel to manage hardware.

![[Pasted image 20231106200633.png]]

## Most Common Security Configurations

### Configure Idle Timeout Interval

Avoid having an unattended SSH session, you can set  an Idle timeout interval
- Become root
- Edit your `/etc/ssh/sshd_config`
	- ClientAliveInterval 600
	- ClientAliveCountMax 0
	- restart the service

The idle timeout interval you are setting is in seconds (600 secs = 10 mins). Once the interval
has passed, the idle user will be automatically logged out

### Disable root login

Disabling root login should be one of the measures you should take when setting up the system for the first time. It disables any user to login to the system as the root account

- Become root
- Edit your `/etc/ssh/sshd_config`
	- PermitRootLogin no
	- restart the service

### Disable empty Passwords

- Become root
- Edit your `/etc/ssh/sshd_config`
	- PermitEmptyPasswords no
	- restart the service

### Limit User' SSH Access

To provide another layer of security, you should limit your SSH logins to only certain users who need remote access

- Become root
- Edit your `/etc/ssh/sshd_config`
	- AllowUsers user1 user2
	- restart the service

### Use a different port

By default SSH runs on port 22. Most hackers looking for any open ssh servers will look for port 22 and changing can make the system much more secure 

- Become root
- Edit your `/etc/ssh/sshd_config`
	- Port 69
	- restart the service

## SSH-Keys

Common Reasons to use SSH Keys are for Repetitive Logins and Automation through scripts. Keys are generated at the user or root level

![[Pasted image 20231106202921.png]]

#### Setup

1. Generate the Key

```bash
$ ssh-keygen
```

2.  Copy the Key to the sever

```bash
$ ssh-copy-id root@192.168.1.x
```

3. Login from client to server

```bash
$ ssh root@192.168.1.x
```
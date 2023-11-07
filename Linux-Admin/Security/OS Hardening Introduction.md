
The main ways to maintain secure linux severs is with:
- User Account Management
- Removing un-wanted packages
- Stop un-used Services
- Check on Listening Ports
- Secure SSH Configuration
- Enable Firewall
- Enable SELinux
- Change Listening Services Port Numbers
- Keep your OS up to date (security patching)

## User Account Management
- Don't use standard names for root user like admin or root
- Establish password reset rules (expires, inactive, etc...) 
	- chage command
	- /etc/login.defs

## Removing unwanted packages

Get a list of packages

```bash
$ rpm -qa | more
```

Remove a package

```bash
$ rpm -e <package_name>
```

## Stop unused services

Get list of services

```bash
$ systemctl -a | more
```

Disable a service

```bash
$ sudo systemctl stop service-name 
$ sudo systemctl disable service-name
```
## Check on listening ports

Check open ports

```bash
$ netstat -tunlp
```

## Secure ssh 

modify ssh cofiguration `/etc/ssh/ssh_config`
	- change the port
	- disable PermitRootLogin

## Enable Firewall

`firewalld` allows you to specify which ports to accept traffic from

Open GUI

```bash
$ firewall-config
```

CLI Commands

```bash
$ firewall-cmd --help
```

CLI Commands for `iptables`

```bash
$ iptables --help
```

## Enable SELinux

stands for Security-Enhanced Linux, is a security framework and implementation of mandatory access control (MAC) in Linux-based operating systems. It provides fine-grained access control and mandatory access controls, enhancing the security of Linux systems by enforcing access policies and limiting the potential impact of security vulnerabilities.

Check if enabled

```bash
$ sestatus
```

Configuration file: `/etc/sysconfig/selinux` (reboot after altering)

Get advanced information on a file

```bash
$ stat <filename>
```
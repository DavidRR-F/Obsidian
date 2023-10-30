## File Transfer Protocol (FTP)

Standard network protocol used for the transfer of the computer files between a client and server on a computer network. FTP is built on a client-server model architecture using separate control and data connections between the client and the server (Default FTP Port: 21)

![[Pasted image 20231030192603.png]]

#### 1. Install and Configure FTP on remote server

1. Become root

```bash
$ su -
```

2. Check if FTP daemon is installed

```bash
$ rpm -qa | grep vsftpd
```

- If Not install the FTP daemon

```bash
$ yum install vsftpd
```

3. Configure vsftpd

**Note**: Best Practice when updating a configuration file is to make a copy of it that you can revert back to incase it messes things up

```bash
$ cp vsftpd.conf vsftpd.conf.orig

$ vi /etc/vsftpd/vsftpd.conf

# Edit the following
# Disable anonymous login
anonymous_enable=NO

# Uncomment
ascii_upload_enable=YES
ascii_download_enable=YES
ftpd_banner=Welcome to My FTP service

## Add at the end of this file
uselocaltime=YES
```

4. Start the FTP daemon

```bash
$ systemctl start vsftpd

$ systemctl enable vsftpd
```

5. Allow FTP traffic through the firewall configuration

```bash
$ sudo firewall-cmd --add-port=21/tcp --permanent

$ sudo firewall-cmd --reload
```

#### 2. Install and Configure FTP on client

1. Install the FTP client

```bash
$ yum install ftp
```

2. Transfer files

```bash
$ ftp <IP_Address>
```

- Enter username and password
- bi
- hash
- put <file_name>
- bye.

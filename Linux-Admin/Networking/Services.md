## File Transfer Protocol (FTP)

Standard network protocol used for the transfer of the computer files between a client and server on a computer network. FTP is built on a client-server model architecture using separate control and data connections between the client and the server **Default FTP Port: 21**

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


## Secure Copy Protocol (SCP)

Similar to FTP SCP is a network protocol and command-line tool used for securely transferring files and directories between two remote hosts over a secure SSH (Secure Shell) connection. SCP provides encryption and authentication, ensuring that data transferred between the hosts is protected from eavesdropping and tampering. **Default SCP port 22** (same as ssh)

```bash
$ scp <file_name> <user_name>@<remote_server_ip>
```

## Remote Synchronization - rsync

`rsync` is a utility for efficiently transferring and synchronizing files within the same computer or to a remote computer by comparing the modification times and sizes of files idempotently. rsync is a lot faster than ftp or scp and is primarily used to backup the files and directories from one server to another. **Default rsync port 22**

- Install rsync

```bash
$ yum install rsync
```

- rsync a file on local machine

```bash
## compress entire home directory
$ tar cvf backup.tar .

$ mkdir /tmp/backups

$ rsync -zvh backup.tar /tmp/backups/
```

- rsync a directory on a local machine

```bash
$ rsync -azvh /home/user /tmp/backups/ 
```

- rsync a file to a remote machine

```bash
$ mkdir /tmp/backups

$ rsync -avz backup.tar <user_name>@<remote_server_ip>:/tmp/backups
```

- rsync a file from a remote machine

```bash
$ touch serverfile

$ rsync -avzh <user_name>@<remote_server_ip>:/home/<user_name>/serverfile /tmp/backups
```

## Network Time Protocol (NTP)

networking protocol and a set of algorithms used to synchronize the time of computer systems and network devices over a network. The primary purpose of NTP is to ensure that all devices on a network have accurate and synchronized time, which is essential for various purposes

1. Check if ntp package is installed

```bash
$ rpm -qa | grep ntp

$ yum install ntp -y
```

2. Modify `/etc/ntp.conf`

```bash
$ vi /etc/ntp.conf

# Add Content
server 8.8.8.8 # googles dns
```

3. Start and enable service

```bash
$ systemctl start ntpd

$ systemctl enable ntpd
```

4. Check if the service is running

```bash
$ systemctl status ntpd

or 

$ ps -ef | grep ntp
```

### `ntpq`

interactive mode for ntp

```bash
$ ntpq
# get dns time list
ntpq> peers
ntpq> quit
```

## `chronyd`

an open-source software package for time synchronization on Unix-like operating systems. It is often used as an alternative to the older Network Time Protocol (NTP) daemon (`ntpd`) for keeping system clocks accurate and synchronized with precise time sources. Chrony provides a more modern and efficient approach to time synchronization and is commonly found on many Linux distributions. ***Dont run ntpd and chronyd at the same time***

### Setup

1. Check if  you have the package

```bash
$ rpm -qa | grep chronyd

$ yum install chrony
```

2. Configure `/etc/chrony.conf`

```bash
$ vi /etc/chonry.conf

# Add Content
server 8.8.8.8 # googles dns (pick a ntp server not dns)
```

3. Start the service

```bash
$ systemctl start chronyd

$ systemctl enable chronyd
```

4. Run the program

```bash
$ chronyc

chronyc> help
chronyc> souces
```

## Sendmail

Sendmail is a widely used mail transfer agent (MTA) and mail server software for Unix-like operating systems. It is responsible for routing and delivering email messages on a computer network. Sendmail was one of the earliest MTA implementations and has been a fundamental component of email infrastructure since the early days of the internet.

#### Files 
- /etc/mail/sendmail.mc (mail configuration file)
- /etc/mail/sendmail.cf (compiled configuration file)

1. Check if  you have the package

```bash
$ rpm -qa | grep sendmail

$ yum install sendmail
```

2. Configure `/etc/mail/sendmail.mc`

```bash
$ vi /etc/mail/sendmail.mc

# Add fully qualified domain name
define('SMART_HOST', 'smtp.your.provider')dnl
```

### Send an email 

```bash
$ mail -s "your subject line" myour_email@gmail.com

# TYpe mail body then Ctrl+D
```

## Web Server (httpd) (Apache)

used abbreviation for the term "HTTP daemon." An HTTP daemon is a software component that operates as a web server, serving web pages and other resources over the HTTP (Hypertext Transfer Protocol) and HTTPS (HTTP Secure) protocols. In other words, `httpd` refers to the web server software responsible for hosting and delivering web content to clients, typically web browsers.
#### Files
- /etc/http/conf/httpd.conf
- /var/log/httpd
- /var/www/html/index.html
### Setup

1. **Update Your System** (Optional but recommended):
    
    It's a good practice to ensure your system is up-to-date before installing new software. Run the following commands:
    
```bash
$ sudo yum update
```
    
2. **Install Apache HTTP Server**:
    
    You can use the `yum` package manager to install the Apache HTTP Server. Run the following command:
    
```bash
$ sudo yum install httpd
```
    
This command will download and install Apache and its dependencies.
    
3. **Start Apache HTTP Server**:
    
    Once the installation is complete, you can start the Apache HTTP Server using the following command:
    
```bash
$ sudo systemctl start httpd

$ sudo systemctl enable httpd
```
    
4. **Configure Firewall**:
    
    If your server has the firewall enabled, you'll need to allow HTTP traffic through. You can do this with the following commands:
    
```bash
$ sudo firewall-cmd --zone=public --permanent --add-service=http sudo firewall-cmd --reload
```
    
These commands allow HTTP traffic (port 80) through the firewall.
    
5. **Test Apache**:
    
    Open a web browser and enter your server's IP address or hostname. You should see the default Apache test page, indicating that Apache is running.
    
    If you don't know your server's IP address, you can find it using the `ip a` or `ifconfig` command.
    
6. **Create a Virtual Host** (Optional):
    
    If you plan to host multiple websites or need custom configurations, you can create virtual hosts. Apache's configuration files are typically located in `/etc/httpd/conf` or `/etc/httpd/conf.d`. You can create separate configuration files for each virtual host.
    
    For example, to create a virtual host for a website called "example.com," you can create a configuration file like `/etc/httpd/conf.d/example.conf` and add your virtual host settings there. Here's a simple example:

```c
<VirtualHost *:80>     
	ServerAdmin webmaster@example.com     
	ServerName example.com     
	DocumentRoot /var/www/html/example 
</VirtualHost>
```
    
Don't forget to create the directory specified in `DocumentRoot` and place your website files there.
    
7. **Restart Apache**:
    
    After making changes to Apache's configuration, restart the server to apply the changes:
    
```bash
$ sudo systemctl restart httpd
```
    
8. **Access Your Website**:
    
    You can now access your website through a web browser using your server's IP address or domain name.

## rsyslog

`rsyslog` is an open-source software utility for log processing and management on Unix-like operating systems. It is a powerful and flexible system for collecting, processing, and forwarding log messages generated by various software applications, system components, and devices. `rsyslog` is commonly found on Linux distributions and is used to centralize and manage logs, making it easier to monitor and troubleshoot system and application issues.

1. **Installation**:
    
    Ensure that `rsyslog` is installed on your system. On many Linux distributions, it is already installed by default. If it's not installed, you can typically install it using your system's package manager. For example, on a Red Hat-based system like CentOS or RHEL, you can use `yum`:
    
```bash
$ sudo yum install rsyslog
```
    
2. **Configuration**:
    
    `rsyslog` is configured through its main configuration file, usually located at `/etc/rsyslog.conf`. Additionally, configuration files for specific tasks and modules can be found in the `/etc/rsyslog.d/` directory.
    
- To edit the main configuration file:
        
```bash
$ sudo nano /etc/rsyslog.conf
```
        
- To create or edit additional configuration files in `/etc/rsyslog.d/`:
        
```bash
$ sudo nano /etc/rsyslog.d/myconfig.conf
```
    
    The configuration file uses a syntax that defines how `rsyslog` processes log messages, where they are stored, and how they are forwarded.
    
3. **Basic Configuration**:
    
    A minimal `rsyslog` configuration may look like this:
    
```bash
# Log anything (except mail) of level info or higher. 
*.*    /var/log/messages  
# Log all the mail messages in one place. mail.
*    /var/log/maillog
```
    
This configuration will store log messages in `/var/log/messages` for all facilities and log levels.
    
4. **Restart the Service**:
    
    After making changes to the configuration, restart the `rsyslog` service to apply the changes:
    
```bash
$ sudo systemctl restart rsyslog
```
    
5. **Sending Log Messages**:
    
    To send log messages to `rsyslog`, applications and services on your system must be configured to use the `syslog` protocol. Many programs automatically log messages using `syslog`, so you don't typically need to configure this part.
    
    For custom applications or scripts, you can use the `logger` command to send log messages to `rsyslog`. For example:
    
```bash
$ logger "This is a test log message."
```
    
This command will send a log message to `rsyslog`, which will then process and store it based on your configuration.
    
6. **Log Rotation**:
    
    Log rotation ensures that log files do not consume excessive disk space. `rsyslog` can work with log rotation utilities like `logrotate` to manage log files. Ensure that `logrotate` is configured appropriately on your system.
    
7. **Viewing Logs**:
    
    You can view log messages using standard tools like `cat`, `tail`, and `less`. For example:
    
```bash
$ cat /var/log/messages tail -f /var/log/messages  # Real-time log monitoring
```
    
8. **Advanced Configuration**:
    
    Depending on your specific use case, you may need to configure more advanced features such as remote logging, log filtering, custom log formats, and log forwarding to external systems.
    
9. **Security Considerations**:
    
    Be mindful of security when configuring `rsyslog`. Ensure that only authorized users have access to log data, and consider encrypting log traffic when forwarding logs to remote systems.
    
10. **Monitoring and Analysis**:
    
    Consider using log analysis and monitoring tools to make sense of your log data, especially in larger deployments.
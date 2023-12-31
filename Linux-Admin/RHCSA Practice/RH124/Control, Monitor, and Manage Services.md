
## Processes and Jobs

- Application - A Service that runs in the background user intervention GUI or other
- Process - A process is a running instance of a program in the Linux operating system
- Daemon - A Service that runs in the background on a linux system without user intervention
- Threads -  smaller units of execution within a process that allows for concurrency
- Jobs - a single command or a sequence of commands that are executed as a single unit

Control Commands

 - `systemctl` - used to control system services
 - `fg` - bring a background job to the foreground in a Linux or Unix environment
 - `bg` - resume suspended jobs in the background
- `crontab` - schedule jobs at a recurring time
- `at` -  schedule jobs but only once

Monitoring Commands

- `df` - give you your disk partition information
- `du` - estimate and display the disk space usage of files and directories in a file system
- `dmeg` - display kernel (warning) messages
- `iostat` -  input and output (I/O) statistics for devices and partitions on a Linux system
- `uptime` - Displays the current time, how long the system has been running, the number of users currently logged in, and the system load averages for the past 1, 5, and 15 minutes
- `top` - Provides a dynamic, real-time view of the running system
- `free` - Displays the total amount of free and used physical and swap memory in the system
- `lsof` - list information about files that are opened by processes
- `tcpdump` - capture and display the TCP/IP and other packets being transmitted or received over a network
- `netstat` - Displays network connections, routing tables, interface statistics, masquerade connections, and multicast memberships
- `ps` - displays information about the currently running processes, including their process ID, user, CPU usage
- `kill` - Sends a signal to a process, usually related to stopping the process

Files

- `/proc/cpuinfo` -  cpu information is stored on the machine
- `/proc/meminfo` - memory information is stored on the machine


## In Depth Material

- [[Processes, Jobs, and Scheduling]]
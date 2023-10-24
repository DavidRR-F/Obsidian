### Application (Service):
    
An application, often referred to as a service when it runs in the background, is a software program designed to perform specific tasks or provide specific functionality. Applications can be command-line tools or graphical user interface (GUI) programs. In the context of a server or Linux system, a service typically refers to a program that runs continuously to provide some functionality, such as a web server (e.g., Apache) or database server (e.g., MySQL).

### Script:
    
 A script is a sequence of commands or instructions written in a scripting language like Bash, Python, or Perl. Scripts are used to automate tasks and can be executed to perform various operations on a Linux system. They are often used for system administration, data processing, and other repetitive tasks.
    
### Process:
    
A process is a running instance of a program in the Linux operating system. It is an independent unit that has its own memory space, system resources, and execution environment. Each process has a unique Process ID (PID) and can run in the foreground or background. Processes can be started by users, scripts, or as part of system services.

### Daemon:
    
A daemon is a background process that runs on a Linux system, typically without any direct user interaction. Daemons are often started at system boot and continue to run in the background, providing various services or tasks. Common examples of daemons include web servers, print spoolers, and network services like SSH.

### Threads:
    
Threads are smaller units of execution within a process. Multiple threads can exist within a single process and share the same memory space, resources, and file descriptors. Threads allow for concurrent execution within a process, enabling more efficient multitasking. Multithreading is commonly used in applications where parallelism or concurrency is needed.

### Job:
    
In the context of the Linux shell (e.g., Bash), a job refers to a single command or a sequence of commands that are executed as a single unit. Jobs can be run in the foreground or background. Users can manage jobs using built-in shell commands like `bg` (background), `fg` (foreground), and `jobs` (list running jobs).

## Commands

### `systemctl`

This command is used to control system services

```bash
$ systemctl [option] [servicename].service
```

|Option|Description|
|:-------|:------------|
|start|start an application|
|stop|stop an application|
|status|check the current status of an application|
|enabled|configure application to start on boot|
|disabled|configure application to not start on boot|
|restart|restart an application|
|list-units --all|get a list of all services|

### `ps`

shows the processes of the current shell described by the following columns:

- PID = the unique process ID
- TTY = terminal type that the user logged-in to
- TIME = amount of CPU in minutes and seconds that the process has been running
- CMD = name of the command

|Option|Description|
|:-------|:------------|
|-e|show all running processes|
|aux|show all running processes in BSD format|
|-ef|show all running processes in full format listing|
|-u <user_name>| show all processes being run by a specific user|

### `top`

shows the linux processes and it provides a real time view of the running system with a summary of information of the system and list of processes or threads which are currently managed by the linux kernel described by the following columns:

- PID = the unique process ID
- USER = username of owner of task
- PR = scheduling priority of the process
- NI = `Nice Value` - negative nice value implies higher priority
- VIRT = total virtual memory used by the task
- RES = memory consumed by the process in RAM
- SHR = amount of shared memory used by a task
- S = process state in the single letter form
- %CPU = CPU usage
- %MEM = memory usage of task
- TIME+ = CPU time 


### `kill`

used to terminate processes manually. Sends a signal the ultimately kills a particular process or group of processes via process id. Used when the systemctl stop does not work 

```bash
$ kill [OPTION] [PID]
```

- ***OPTION*** = signal name or signal number/ID
- ***PID*** = process ID

`kill -l` - to get a list of all signal names/numbers
`kill -1` - Restart
`kill -2` - Interrupt from the keyboard just like `Ctrl C`
`kill -9` - Forcefully kill the process
`kill -15` - Killing a process gracefully
`killall` - Kill all processes
`pkill` - kill via process name

### `crontab`

used to schedule tasks

|Options|Description|
|:--------|:------------|
|-e|Edit the crontab|
|-l|List the contab entries|
|-r|remove the crontab|
|crond|crontab daemon/service that manages scheduling|

![[Pasted image 20231023193246.png]]

Example: create  crontab entry by scheduling a task

```bash
$ crontab -e

# In File
21 16 * 10 * echo "Spooky Season" >> crontab_entry

$ wq!
```

By Default there are 4 different types of cronjobs
 - Hourly
 - Daily
 - Weekly
 - Monthly
All the above are setup in
- `/etc/cron.____`
The timing for each are set in
- `/etc/anacrontab --` (Except hourly `/etc/cron.d/0hourly`)
### `at`

allows you to schedule jobs but only once. When the command runs it will enter interactive mode and you can get out by pressing `Ctrl D`

- `at HH:MM PM` = Schedule a job
- `atq` = List the at entries
- `atrm #` = Remove at entry
- `atd` = at daemon/service that manages scheduling

Example: Create at entry by scheduling a task

```bash
$ at 04:45 PM

# In FIle
echo "Hello World"

Ctrl D
```

## Process Management

1. **Background**:
    
    - **Why**: You run processes in the background when you want them to execute independently of your current terminal session. This is useful for multitasking and for running long-running tasks that don't require your constant attention.
    - **When**:
        - When running commands that take a long time to complete.
        - For starting server processes and daemons.
        - When you want to continue using the terminal for other tasks.
    - **Commands**:
        - `&` symbol: Appending `&` to a command runs it in the background.
        - `bg`: Resume a stopped or paused process in the background.
    - **Example**:
        
```bash
$ long_running_task & bg
```
        
2. **Foreground**:
    
    - **Why**: Processes run in the foreground when you want to interact with them directly, monitor their progress, and provide input if necessary. They block the terminal until they finish.
    - **When**:
        - When running interactive programs.
        - For tasks that require your immediate attention.
    - **Commands**:
        - Running a command without `&` runs it in the foreground by default.
        - `fg`: Bring a background process to the foreground.
    - **Example**:

```bash
$ interactive_program & fg
```
        
3. **After Exit (nohup)**:
    
    - **Why**: You use the `nohup` command to run processes that should continue running even after you log out or exit the terminal. It prevents the process from receiving the SIGHUP (hang up) signal when you disconnect.
    - **When**:
        - For long-running tasks that you want to survive your session.
        - Running background tasks on remote servers or in SSH sessions.
    - **Commands**:
        - `nohup`: Prepend the command with `nohup` to run it after exit.
    - **Example**:
        
```bash
$ nohup long_running_task &

or

$ nohup process > /dev/null 2>&1 &
```
        

Using these approaches, you can effectively manage processes based on your specific needs, whether it's running tasks concurrently, interacting with them in real-time, or ensuring they persist even after you log out.

#### Other Commands

- `nice` - give a process a specific priority

```bash
nice -n 5 sleep 10
```

- `jobs` - view scheduled jobs

### <span style="color:red;">System Monitoring</span> (IMPORTANT)

### `df`

give you your disk partition information

```bash
$ df -h

Filesystem      Size  Used Avail Use% Mounted on
tmpfs           781M  3.9M  777M   1% /run
/dev/mmcblk0p2   29G   25G  3.3G  89% /
tmpfs           3.9G     0  3.9G   0% /dev/shm
tmpfs           5.0M     0  5.0M   0% /run/lock
/dev/mmcblk0p1  253M  148M  105M  59% /boot/firmware
/dev/sda1       916G   78M  870G   1% /mnt/ssd
tmpfs           781M  4.0K  781M   1% /run/user/1000
```

### `du`

used to estimate and display the disk space usage of files and directories in a file system.

```bash
$ du -h | more
```

The `-h` option makes the output human-readable, displaying sizes in kilobytes (KB), megabytes (MB), and so on.

### `dmesg`

used to display kernel (warning) messages, including information about hardware, drivers, and system events.

```bash
$ dmesg | more
```

This command displays a log of kernel messages from the current session and may require superuser (root) privileges to access some messages.

### `iostat 1`

provides input and output (I/O) statistics for devices and partitions on a Linux system. Adding `1` as an argument makes it update the statistics every second.

```bash
$ iostat 1
```

This command displays information about CPU usage, I/O operations, and more.

### `netstat`

used to display network statistics, including active network connections, routing tables, and network interface information.

```bash
$ netstat -tuln
```

This command displays a list of listening and established TCP/UDP connections.

### `free`

provides information about the system's memory usage, including total, used, and free memory.

```bash
$ free -h
```

The `-h` option makes the output human-readable, displaying memory sizes in KB, MB, and so on.

### `cat /proc/cpuinfo`

Were all the cpu information is stored on the machine

### `cat /proc/meminfo`

Were all memory information is stored on the machine

## Log Monitoring (/var/log)


### Log Files

1. `/var/log/boot`:
    
    - **Description**: The `boot` log file contains information related to the system's boot process. It includes messages and events that occur during system startup, such as hardware initialization and service start/stop events.
    - **Use**: Troubleshooting boot-related issues and understanding the sequence of events during system startup.
    
2. `/var/log/chronyd`:
    
    - **Description**: The `chronyd` log file contains logs related to the `chronyd` service, which is responsible for system time synchronization using the NTP (Network Time Protocol).
    - **Use**: Monitoring time synchronization activities and diagnosing time-related issues.
    
3. `/var/log/cron`:
    
    - **Description**: The `cron` log file contains information about scheduled tasks and cron jobs executed on the system. It logs when cron jobs start and finish, as well as any errors or output generated by these jobs.
    - **Use**: Reviewing the execution history of scheduled tasks and troubleshooting cron job issues.
    
4. `/var/log/maillog`:
    
    - **Description**: The `maillog` log file records email-related activities and messages generated by email servers and mail transfer agents (MTAs) like Sendmail, Postfix, and Exim. It includes information about email deliveries, rejections, and errors.
    - **Use**: Diagnosing email server issues, tracking email delivery, and identifying email-related errors.
    
5. `/var/log/secure`:
    
    - **Description**: The `secure` log file (or `auth.log` on some distributions) contains security-related messages and authentication events. It logs successful and failed login attempts, account lockouts, and other security-related activities.
    - **Use**: Monitoring and auditing security events, detecting unauthorized access attempts, and investigating security breaches.
    
6. `/var/log/messages`:
    
    - **Description**: The `messages` log file is a general-purpose system log that captures a wide range of system-related messages and events. It often serves as a catch-all log for various system components and services.
    - **Use**: Reviewing system-wide messages, diagnosing hardware and software issues, and identifying system errors.
    
7. `/var/log/httpd` (or `/var/log/apache2`):
    
    - **Description**: The `httpd` log directory contains log files generated by the Apache HTTP server. It typically includes access logs, error logs, and other logs related to web server activity.
    - **Use**: Analyzing web server access patterns, diagnosing web server errors, and tracking website activity.

## System Maintenance Commands

- `shutdown` - shutdown the linux system
- `reboot` - reboot a linux system
- `halt` - shutdown to its lowest state but leaves it powered on
- `init` - used to transition the system between different runlevels or modes of operation
	- 0 - used to shut down the system
	- 1 - Single-user mode is a minimal state where only the essential services are started
	- 2 - often user-configurable and used for custom system configurations
	- 3 - multi-user mode with full networking support
	- 4 -  often user-configurable and used for custom system configurations
	- 5 - used to start the system with a graphical user interface (GUI)
	- 6 - used to reboot the system 

## Other Commands

### `hostnamectl`

changing the system hostname

```bash
$ hostnamectl set-hostname new_hostname
```

### `dmidecode`

retrieve information about a computer's hardware components, specifically from the Desktop Management Interface (DMI) data

1. **System Information**: This includes details about the system manufacturer, product name, version, and serial number.
    
2. **BIOS Information**: Information about the system's BIOS, such as its vendor, version, and release date.
    
3. **Processor Information**: Details about the CPU(s) installed in the system, including the manufacturer, model, and clock speed.
    
4. **Memory Information**: Information about the system's memory modules, such as type, size, and speed.
    
5. **Motherboard Information**: Details about the motherboard, including its manufacturer, product name, and serial number.
    
6. **System Enclosure Information**: Information about the system's chassis or enclosure, such as its type and serial number.
    
7. **BIOS Language**: The language used by the BIOS.

```bash
$ sudo dmidecode --type system
```

## Terminal Control Keys

1. **Ctrl+C**:
    - **Function**: Interrupt (Kill) the current running process.
    - **Usage**: Pressing Ctrl+C sends the SIGINT (interrupt) signal to the foreground process, often causing it to terminate gracefully.
2. **Ctrl+D**:
    - **Function**: End of Input (EOF).
    - **Usage**: In most terminal applications, Ctrl+D signifies the end of input, allowing you to exit programs like the shell or input data from the command line.
3. **Ctrl+Z**:
    - **Function**: Suspend the current foreground process.
    - **Usage**: Pressing Ctrl+Z suspends the currently running foreground process and returns control to the shell. You can later use the `fg` command to resume it or `bg` to run it in the background.
4. **Ctrl+L**:
    - **Function**: Clear the terminal screen (equivalent to the `clear` command).
    - **Usage**: Clears the terminal, making it easier to read and providing a clean workspace.
5. **Ctrl+U**:
    - **Function**: Delete from the cursor position to the beginning of the line.
    - **Usage**: Removes text to the left of the cursor, making it easy to delete input.
6. **Ctrl+K**:
    - **Function**: Delete from the cursor position to the end of the line.
    - **Usage**: Deletes text to the right of the cursor, allowing you to clear input.
7. **Ctrl+W**:
    - **Function**: Delete the word to the left of the cursor.
    - **Usage**: Removes the word immediately to the left of the cursor, helping with text editing.
8. **Ctrl+R**:
    - **Function**: Reverse search for previously entered commands.
    - **Usage**: Initiates a reverse search through command history based on what you've typed so far.
9. **Ctrl+A**:
    - **Function**: Move the cursor to the beginning of the line.
    - **Usage**: Quickly navigate to the start of the command line.
10. **Ctrl+E**:
    - **Function**: Move the cursor to the end of the line.
    - **Usage**: Quickly navigate to the end of the command line.
11. **Ctrl+S**:
    - **Function**: Pause terminal output (XOFF).
    - **Usage**: Temporarily stops the terminal from displaying text until you press Ctrl+Q to resume output (XON).
12. **Ctrl+Q**:
    - **Function**: Resume terminal output (XON).
    - **Usage**: Resumes terminal output after it has been paused using Ctrl+S.
13. **Ctrl+T**:
    - **Function**: Swap the characters at the cursor and the one to the left of it.
    - **Usage**: Useful for correcting typographical errors quickly.

## Recovering Root Password

- Restart your computer
- edit grub
- change password
- reboot

### SOS Report

Collect and package diagnostic and support data

#### Package Name

`sos-version`

#### Command

```bash
$ sosreport
```

### Environment Variables

- View all environment variables
```bash
$ printevn

or

$ env
```

- view one environment variable
```bash
$ export TEST=1
$ echo $TEST
```

- set environment variable permenently
```bash
$ vi .bashrc

TEST='123'
export TEST
```

- set global environment variabl permanently
```bash
$ vi /etc/profile or /etc/bashrc

TEST='123'
export TEST
```
### Special Permissions

All permissions on a file or directory are referred to as bits
### `setuid`

bit tells Linux to run a program with the effective user id of the owner instead of the executor (e.g. passwd command) -> `/etc/shadow`
### `setgid`

bit tells Linux to run a program with the effective group id of the owner instead of the executor (e.g. locate or wall command)
### `sticky bit`

a bit set on files/directories that allows only the owner or root to delete those files

#### Assigning Special Permissions

- Assign special permissions at the user level
```bash
# Add
$ chmod u+s xyz.sh

# Remove
$ chmod u-s xyz.sh
```

- Assign special permissions at the group level
```bash
# Add
$ chmod g+s xyz.sh

# Remove
$ chmod g-s xyz.sh
```

- Find all executables in linux with setuid and setgid permissions
```bash
$ find / -prem /6000 -type f
```

- Sticky Bit 
It is assigned to the last bit of permissions
	- `-rwx rwx rwt`
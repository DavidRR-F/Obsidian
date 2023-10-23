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
|list_units --all|get a list of all services|

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



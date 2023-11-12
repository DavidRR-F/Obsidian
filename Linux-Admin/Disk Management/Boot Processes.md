
## System Run Level

In traditional Unix and Unix-like operating systems, including many Linux distributions, runlevels are used to define the state or mode in which the system operates. Runlevels determine which services, daemons, and processes are started or stopped when the system boots or changes its operating state. The specific behavior of runlevels can vary between different Unix-like systems, but the following is a common description of runlevels 0 through 6:

Select runlevel

```bash
$ init <run_level>
```

Show runlevel

```bash
$ who -r
```
### **Runlevel 0 (Halt/Shutdown)**:
    
- Runlevel 0 is reserved for system shutdown or halting. When the system is set to runlevel 0, it initiates the shutdown process and powers off the computer.
- In some Linux distributions, entering runlevel 0 might trigger the execution of scripts to cleanly shut down running services and save system state.

### **Runlevel 1 (Single User Mode or Maintenance Mode)**:
    
- Runlevel 1 is also known as single-user mode or maintenance mode. It is used for system maintenance and repair tasks.
- When the system enters runlevel 1, it boots into a minimal environment with a single root user login prompt, and most services are disabled.
- Single-user mode is typically used when the system encounters critical issues or requires manual intervention, such as repairing a damaged file system.

### **Runlevel 2 (Multi-User Mode without Networking)**:
    
- Runlevel 2 is often used as a basic multi-user mode without networking services. It typically provides a multi-user command-line interface.
- This runlevel is suitable for servers that do not require networking services, such as a web server or database server.

### **Runlevel 3 (Multi-User Mode with Networking)**:
    
- Runlevel 3 is a multi-user mode with full networking functionality. It provides a multi-user command-line interface and starts networking services.
- This runlevel is commonly used for server systems where remote access and network services are needed.

### **Runlevel 4 (Unused)**:
    
- Runlevel 4 is typically unused in many Unix-like systems and is available for system administrators to define their own custom runlevel behaviors.
- In some distributions, runlevel 4 may be configured to have specific purposes or to launch custom services, but it is not standardized.

### **Runlevel 5 (Graphical User Interface)**:
    
- Runlevel 5 is used to start the system with a graphical user interface (GUI). It is commonly associated with desktop Linux distributions.
- In runlevel 5, the system starts the GUI login manager, allowing users to log in and use the graphical environment.

### **Runlevel 6 (Reboot)**:
    
- Runlevel 6 is reserved for system reboot. When the system is set to runlevel 6, it initiates the reboot process, which includes stopping running services and restarting the computer.

## Computer Boot Process

The computer boot process, often referred to as "bootstrapping" or simply "booting," is the sequence of steps that occur when a computer is powered on or restarted. The primary goal of the boot process is to initialize the hardware, load the operating system, and prepare the computer for user interaction.

![[Pasted image 20231112162824.png]]


1. **Power-On or Reset**:
    
    - The boot process begins when the computer is powered on or when it is reset (restarted).
    - When power is applied, the computer's central processing unit (CPU) starts executing instructions from a predefined memory location known as the reset vector or BIOS (Basic Input/Output System) firmware.

1. **POST (Power-On Self-Test)**:
    
    - The BIOS firmware conducts a Power-On Self-Test (POST). During POST, the computer's hardware components (e.g., CPU, RAM, storage devices, keyboard, and graphics card) are tested for proper functionality.
    - If the POST process detects hardware issues or failures, it may display error messages or emit audible beep codes to indicate the problem.

1. **BIOS Initialization**:
    
    - After completing the POST, the BIOS initializes the system's hardware components and peripherals.
    - The BIOS configuration settings, including the boot order (sequence of devices to check for bootable media), are loaded and checked.

1. **Boot Device Selection**:
    
    - The BIOS uses the boot order to determine which storage device (e.g., hard drive, solid-state drive, USB drive, CD/DVD drive) to attempt to boot from first.
    - If a bootable device is found, the BIOS transfers control to the Master Boot Record (MBR) or the boot sector of the selected storage device.

1. **MBR and Bootloader**:
    
    - The MBR or the boot sector of the bootable storage device contains a small program called the bootloader.
    - The bootloader's primary function is to load the operating system kernel into memory. The bootloader may also provide options for selecting an operating system if multiple OS installations exist on the same computer (e.g., dual-boot configuration).

1. **Operating System Kernel Loading**:
    
    - The bootloader loads the operating system's kernel into memory. The kernel is the core component of the operating system that manages hardware resources, processes, and system calls.
    - Once the kernel is loaded, it initializes system drivers, performs hardware detection, and prepares the system for user interaction.

1. **Init Process (Systemd on Modern Linux Systems)**:
    
    - On modern Linux distributions that use systemd as the init system, systemd is the first user-space program to start.
    - systemd initializes user-space services, starts system daemons, and manages system processes.

1. **User Login or Graphical User Interface (GUI)**:
    
    - After initialization, the operating system presents a user login prompt or starts the graphical user interface (GUI), depending on the system's configuration.
    - Users can log in and begin using the computer.

1. **User-Level Applications**:
    
    - Once the user is logged in, user-level applications, services, and user interfaces are launched based on user preferences and system configuration.

## Linux Boot Process


Linux comes fine tuned by default when you install it, however there are a few tweaks then you can do based on system performance and application requirements

- Optimize system performance by selecting a tuning profile managed by the `tuned` daemon
- Prioritize or de-prioritize specific processes with the nice and re nice commands

## tuned

System tuning daemon used to tune Linux system performance and is intalled in CentOS/Redhat 7/8 by default

Common Tune Profiles:

|Tuned Profile| Purpose|
|:--------------|:---------|
|balanced|deal for systems that require a compromise between power saving and performance|
|desktop| Derived from the balance profile, Provides faster response of interactive applications|
|Throughput-performance|tunes the system for maximum throughput|
|Latency-performance|Ideal for server systems that require low latency at the expanse of power consumption|
|network-latency|Derived from the latency-performance profile. It enables additional network tuning parameters to provide low network latency|
|network-throughput|derived from the throughput-performance profile. Additional network tuning parameters are applied for maximum network throughput|
|powersave|tunes the system for maximum power saving|
|oracle|Optimized for Oracle database loads based on the thoughput-performance profile|
|virtual-guest|Tunes the system for maximum performance if it runs on a virtual machine|
|virtual-host|Tunes the system for maximum performance if it acts as a host for virtual machines|


Here are the key features and functions of Tuned:

1. **Profile-Based Tuning**: Tuned provides a set of predefined tuning profiles, each tailored for specific use cases or workloads. These profiles are designed to optimize system settings for performance, power efficiency, or specific applications.
    
2. **Dynamic Tuning**: The daemon continuously monitors system resources, such as CPU usage, memory usage, disk I/O, and network activity. Based on the observed workload, Tuned can dynamically switch between profiles to adapt to changing conditions.
    
3. **Power Management**: Tuned includes profiles that focus on power management, helping to reduce energy consumption and extend battery life on laptops and other mobile devices.
    
4. **Performance Optimization**: Other profiles are optimized for maximum performance, making them suitable for servers and high-performance computing environments.
    
5. **Customization**: System administrators can create custom tuning profiles or modify existing ones to fine-tune system settings according to their specific requirements.
    
6. **Compatibility**: Tuned is designed to work with various hardware configurations and is compatible with a wide range of hardware and drivers.
    
7. **Command-Line Interface (CLI)**: Tuned can be configured and managed through its command-line interface (`tuned-adm`) to enable or disable profiles, view active profiles, and apply custom configurations.
    
8. **Integration**: Tuned integrates with systemd, the default init system in many Linux distributions. It is often used in conjunction with other tools and utilities for system performance monitoring and management.

Check which profile is active 

```bash
$ tuned-adm active
```

Get list of profiles 

```bash
$ tuned-adm list
```

Set active profile

```bash
$ tuned-adm profile throughput-performance
```

Tune recomendation

```bash
$ tuned-adm recommend
```

Turn Off setting daemon

```bash
$ tuned-adm off
```

## nice and renice

In Linux and Unix-like operating systems, `nice` and `renice` are commands used for process priority management, specifically for controlling the priority of processes in the system's process scheduling.

1. The `nice` command is used when starting a new process to adjust its scheduling priority.
    - It allows you to specify a "niceness" value for a command, which is an integer that determines the priority of the process. The lower the niceness value, the higher the priority.
    - The default niceness value is 0, and it ranges from -20 (highest priority) to +19 (lowest priority).
    - To start a command with a specific niceness value, you use the `nice` command followed by the desired niceness value and the command you want to run.
    - For example, to start a process with a lower priority:
        
```bash
$ nice -n 10 some_command
```
        
2. **`renice` Command**:
    
    - The `renice` command is used to change the niceness value (priority) of an existing process.
    - It allows you to increase or decrease the priority of a running process.
    - To use `renice`, you provide the desired niceness value and the process ID (PID) of the process you want to adjust.
    - For example, to increase the priority of a process with PID 12345:
        
```bash
$ renice -n -5 -p 12345
```
        
This command sets the niceness value to -5, making the process higher-priority.

## Check Priorities

![[Pasted image 20231112092836.png]]

**PR**: system priority level
**NI**: user priority level

To check process priority you can run the `top` command or `ps`:

Check priority with `top`

```bash
$ top
```

![[Pasted image 20231112092549.png]]

Check Priority with `ps`

```bash
$ ps axo pid,comm,nice,cls --sort=-nice | more
```

![[Pasted image 20231112093141.png]]
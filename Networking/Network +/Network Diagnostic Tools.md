### `traceroute`

`traceroute` is a network diagnostic tool used to track the path that a packet takes from its source to its destination. It displays each hop (the journey from one router or intermediary device to another) along the route and measures transit delays of packets across an IP network.

**Usage Example**: To see the path packets take to reach google.com, you would use:

```bash
$ traceroute google.com
```

This command will list all the hops between your computer and Google’s servers, along with the time each hop took.

### `pathping`

`pathping` is a network utility tool that combines the features of `ping` and `traceroute` to provide more detailed information about the path data packets take from a source to a destination over an IP network. Available on Windows operating systems, `pathping` sends multiple packets to each router between a source and destination over a period of time and then computes results based on the packets returned from each hop. Because it analyzes both the route and the network latency between hops, `pathping` is a powerful tool for diagnosing network congestion and packet loss issues.

### How `pathping` Works

1. **Route Tracing**: Initially, `pathping` performs a trace route to identify the path packets take to reach the destination.
2. **Network Performance Statistics**: After completing the route tracing, `pathping` sends packets to each router in the path and calculates statistics for each hop over a default period (which can be customized). This includes loss percentage and response times.

### Usage Example

To use `pathping`, you would open a command prompt and type a command following this structure:

```bash
$ pathping target_domain_or_IP
```

For example, to analyze the path and performance to `example.com`, you would use:

```bash
$ pathping example.com
```

### `netstat`

`netstat` (network statistics) is a command-line tool that displays network connections (both incoming and outgoing), routing tables, and a number of network interface and network protocol statistics. It's used to troubleshoot networking problems and to gather information about network traffic on a computer.

**Usage Example**: To display all active connections and their respective ports on your machine, you can use:

```bash
$ netstat -a
```

To see the listening ports and the associated services:

```bash
$ netstat -l
```

These commands help in identifying open and listening ports, established connections, and other network-related information.

### Wireshark

Wireshark is a graphical network protocol analyzer tool widely used in the networking field. It allows you to capture and interactively browse the traffic running on a computer network. It can analyze network problems, detect network intrusion attempts, and much more.

![[Pasted image 20240305212656.png]]

**Usage Example**: Wireshark is typically launched from a graphical interface, but it can also be used from the command line with `tshark`, its CLI counterpart. To capture packets on a specific interface, you might use:

```bash
$ tshark -i eth0
```

This command starts capturing packets on the `eth0` interface. You can stop the capture with `Ctrl+C`, and you can specify various filters and options to refine what you capture or save the capture to a file for later analysis.

**Note**: Wireshark/tshark captures packets live and can decode and display the contents of those packets. Because it can capture sensitive information, it should be used responsibly and ethically.

### `tcpdump`

`tcpdump` is a powerful command-line packet analyzer tool widely used in the field of network monitoring and analysis. It allows users to capture, filter, and inspect network traffic passing through a system's network interfaces. `tcpdump` works on most Unix/Linux-based operating systems, including macOS, and it provides a detailed view of the packets on the network, which can be crucial for troubleshooting network issues, analyzing network behavior, or monitoring suspicious activity.

### How `tcpdump` Works

`tcpdump` captures packets at the network layer and can interpret packets of most higher-level protocols such as HTTP, FTP, DNS, and others. It operates by putting the network interface into promiscuous mode (unless specified otherwise), which allows the tool to capture all packets on the network, not just those intended for the host.

### Usage Example

To use `tcpdump`, you typically need root or equivalent permissions due to the low-level access to the network interface required for packet capture. Here's a basic example of how to use `tcpdump`:

```bash
$ tcpdump -i eth0
```

This command starts capturing packets on the `eth0` network interface. Without additional parameters, `tcpdump` will capture all packets on the interface and display a summary line for each packet.

More specific captures can be performed using filters:

```bash
$ tcpdump -i eth0 port 80
```

This command filters the traffic to capture only packets associated with HTTP traffic (typically using port 80) on the `eth0` interface.

To save the captured packets for later analysis, you can use the `-w` option:

```bash
$ tcpdump -i eth0 -w capture_file.pcap
```

This command saves the captured packets to a file named `capture_file.pcap`, which can be opened and analyzed with packet analysis tools like Wireshark.

### Output and Interpretation

The output of `tcpdump` includes a timestamp, source and destination IP addresses, protocol used, and depending on the protocol, additional information like port numbers, sequence numbers, flags, etc. Analyzing this output can provide insights into the details of network communication, including errors, security breaches, or performance issues.

#### Network Service Senerios

- DHCP  scope ranges need to consider gataway,printers, and other types of hosts to provide for IP reseverations
- MAC reservations can be used to define devices that have top priority for address assignment
- IPAM tools track and manage allotted IP addresses, keeping address requirement available for server and VM farms

## `net` 

The `net` command is a versatile command-line utility available in Windows operating systems that allows users to view, configure, and troubleshoot network settings and resources. It provides a wide range of functionalities, including managing network drives, printers, user accounts, and services. The `net` command can be used to administer local and remote machines, making it a valuable tool for system administrators.

### Key Uses and Syntax of the `net` Command

The `net` command comprises several subcommands, each tailored for specific networking and administrative tasks. Below are some of the commonly used subcommands and their purposes:

1. **`net user`**
    
    - **Purpose**: Manages user accounts on the computer.
    - **Example**: To add a new user named "John" with a password of "password":
        
```bash
$ net user John password /add
```
        
2. **`net view`**
    
    - **Purpose**: Displays a list of computers or network resources shared by the specified computer.
    - **Example**: To view shared resources on a computer named "Server01":
        
```bash
$ net view \\Server01
```
        
3. **`net use`**
    
    - **Purpose**: Connects, disconnects, and displays information about shared network resources, such as mapping network drives.
    - **Example**: To map the network share `\\Server01\SharedFolder` as the Z: drive:
        
```bash
$ net use Z: \\Server01\SharedFolder
```
        
4. **`net localgroup`**
    
    - **Purpose**: Manages local groups on computers.
    - **Example**: To add a user named "John" to the "Administrators" group:
        
```bash
$ net localgroup Administrators John /add
```
        
5. **`net start` and `net stop`**
    
    - **Purpose**: Starts or stops a Windows service.
    - **Example**: To start the Print Spooler service:
        
```bash
$ net start "Print Spooler"
```
        
- **Example**: To stop the Print Spooler service:
        
```bash
$ net stop "Print Spooler"
```
        
6. **`net share`**
    
    - **Purpose**: Creates, removes, or manages shared resources on the computer.
    - **Example**: To share the folder `C:\SharedFolder` as "SharedFolder":
        
```bash
$ net share SharedFolder=C:\SharedFolder
```
        
7. **`net session`**
    
    - **Purpose**: Manages or displays information about sessions between the computer and clients connected to it.
    - **Example**: To list sessions:
        
```bash
$ net session
```
        
8. **`net statistics`**
    
    - **Purpose**: Displays the network statistics log for the Server or Workstation service.
    - **Example**: To display statistics for the Workstation service:
        
```bash
$ net statistics workstation
```
        
### Execution and Privileges

- Many `net` command operations, especially those that modify system settings or configurations, require administrative privileges. You might need to run the Command Prompt as an administrator to execute them successfully.
- The exact syntax and available options can vary between different versions of Windows, so it's a good idea to consult the official documentation or use the `net help <command>` syntax for guidance on specific commands and options.

# `nbtstat`

`nbtstat` is a command-line utility available on Windows operating systems that is used to diagnose and troubleshoot NetBIOS (Network Basic Input/Output System) over TCP/IP (NetBT) networking issues. NetBIOS is a networking protocol that allows applications on different computers to communicate within a local area network (LAN). While its use has diminished in favor of newer networking protocols, NetBIOS remains a component of the networking configuration on many Windows systems, especially in environments where older versions of Windows are in operation or where legacy applications require NetBIOS services.

### Key Features and Uses of `nbtstat`

The `nbtstat` command is particularly useful for displaying current NetBIOS over TCP/IP connections, updating the NetBIOS name cache, and resolving NetBIOS names to their corresponding IP addresses. It can help identify issues with network connectivity and name resolution in a network using NetBIOS.

### Common `nbtstat` Commands

- **`nbtstat -n`**: Displays a list of names registered locally with NetBIOS on the system. This can help you see what NetBIOS names your computer has claimed on the network.
- **`nbtstat -r`**: Shows the number of NetBIOS names resolved to IP addresses and the number of failed attempts to resolve names. This can be useful for troubleshooting name resolution problems.
- **`nbtstat -A <IP address>`**: Performs a NetBIOS adapter status command on the IP address specified. This command returns a list of NetBIOS names registered with the remote device identified by the IP address. It's helpful for determining the NetBIOS names of a remote machine.
- **`nbtstat -a <NetBIOS name>`**: Similar to the `-A` option but queries a remote machine based on its NetBIOS name rather than its IP address. This can be useful for verifying the IP address associated with a known NetBIOS name.
- **`nbtstat -c`**: Displays the contents of the NetBIOS name cache, which includes recently resolved NetBIOS names and their IP addresses. This is useful for seeing what names have been resolved and are cached by the system.

### Usage Scenario

`nbtstat` is particularly valuable in environments where NetBIOS is a significant component of the network infrastructure or in troubleshooting scenarios where name resolution issues might be causing connectivity problems. For instance, if a user is unable to access a shared folder on a networked computer, running `nbtstat` could reveal whether the NetBIOS name of the target computer is correctly resolved to an IP address.

### Moving Beyond NetBIOS

While `nbtstat` and NetBIOS play roles in certain Windows networking environments, it's important to note that modern Windows networks rely more on DNS (Domain Name System) for name resolution and network services. However, understanding and being able to use `nbtstat` remains beneficial for administrators working in mixed or legacy environments where NetBIOS names are still in use.

# `dig`

The `dig` (Domain Information Groper) command is a versatile tool used for querying DNS (Domain Name System) servers. It is widely used by network administrators for troubleshooting DNS problems and by researchers for querying DNS information. Available on Unix and Unix-like operating systems, such as Linux and macOS, `dig` is known for its flexibility and the extensive amount of information it can provide.

### Key Features of `dig`

- **Versatility**: `dig` can query DNS records of various types, including A (IPv4 address), AAAA (IPv6 address), MX (mail exchange), NS (name server), TXT (text records), and more.
- **Detailed Output**: It provides detailed responses from DNS queries, including the question section, answer section, authority section, and additional section, along with query time and server used.
- **Batch Mode**: `dig` can operate in batch mode, allowing it to process multiple query requests from a file.
- **Query Customization**: Users can specify the DNS server to query, change the query type, and modify other query parameters to customize the output as needed.

### Common Uses of `dig`

- **Checking Domain IP Addresses**: To find out the IP address(es) associated with a domain.
- **Investigating Mail Server Settings**: To query MX records of a domain to understand its email service configuration.
- **Diagnosing DNS Delegations**: To examine NS records and ensure that a domain's name servers are correctly set up.
- **Verifying DNS Propagation**: To confirm that updated DNS records have propagated across the internet by querying different DNS servers.

### Example Usage of `dig`

1. **Basic Query**:
    
```bash
$ dig example.com
```
    
This command performs a standard DNS lookup for the domain `example.com`, returning the A record (IPv4 address) by default.
    
2. **Query Specific Record Type**:
    
```bash
$ dig example.com MX
```
    
This queries for the MX records of `example.com`, which are used for email routing.
    
3. **Query a Specific DNS Server**:
    
```bash
$ dig @8.8.8.8 example.com
```
    
This forces `dig` to perform the query using a specific DNS server (`8.8.8.8` in this example, which is one of Google's DNS servers).
    
4. **Short Answer Format**:
    
```bash
$ dig example.com +short
```
    
This option simplifies the output to show just the answer section of the DNS query.
    
5. **Reverse DNS Lookup**:
    
```bash
$ dig -x 8.8.8.8
```
    
This performs a reverse DNS lookup, returning the domain name associated with the IP address `8.8.8.8`.
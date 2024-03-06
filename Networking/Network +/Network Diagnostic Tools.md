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
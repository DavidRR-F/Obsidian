## **ping**
    
- **Description**: The `ping` command is used to test the reachability and round-trip time of a network host or IP address by sending ICMP (Internet Control Message Protocol) echo requests and receiving echo replies.
- **Example**: To ping a host, simply open a terminal and enter:
        
```bash
$ ping www.example.com
```
        
	This will send ICMP echo requests to "[www.example.com](http://www.example.com/)" and display the responses, including round-trip times.
### **ifconfig**
    
- **Description**: The `ifconfig` (interface configuration) command is used to display or configure network interfaces on a Unix-like system. It provides information about network interfaces and allows you to change their configuration.
- **Example**: To display information about all network interfaces, use:
        
```bash
$ ufconfig
```
        
To configure an interface with a specific IP address (e.g., eth0 with IP 192.168.1.2):
        
```bash
$ sudo ifconfig eth0 192.168.1.2
```
        
### **ifup** and **ifdown**
    
- **Description**: `ifup` is used to bring a network interface up (activate it), while `ifdown` is used to take a network interface down (deactivate it). These commands are often used to enable or disable network interfaces.
- **Example**: To bring up an interface (e.g., eth0), use:
        
```bash
$ sudo ifup eth0
```
        
To take down the same interface, use:
        
```bash
$ sudo ifdown eth0
```
        
### **netstat**
    
- **Description**: The `netstat` (network statistics) command is used to display various network-related information, including network connections, routing tables, interface statistics, and more.
- **Example**: To display a list of all network connections, use:
        
```bash
$ netstat -tuln
```
        
This command shows listening (-l) TCP (-t) and UDP (-u) ports with numeric (-n) addresses and port numbers.

- **Example**: To display a list gateway traffic and interface traffic is coming from:
        
```bash
$ netstat -rnv
```

### **tcpdump**
    
- **Description**: `tcpdump` is a packet analyzer that allows you to capture and display network packets on a network interface. It's a powerful tool for network troubleshooting and analysis.
- **Example**: To capture and display incoming and outgoing packets on interface eth0:
        
```bash
$ sudo tcpdump -i eth0
```
        
This command captures and prints network packets on the specified interface, which can be useful for diagnosing network issues and analyzing network traffic.
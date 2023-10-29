A NIC, or Network Interface Card, is a hardware component that allows a computer or other device to physically connect to a network and communicate with other devices on that network. It is sometimes referred to as a network adapter or network interface controller (NIC).

**Basic NICs**
- **enp0s3**: main interface, used to communicate to other computers or the outer world
	- **en**: This prefix typically indicates Ethernet, which means the network interface is an Ethernet interface, used for wired network connections.
    
	- **p0**: The "p" stands for port, and "0" refers to the physical location or slot where the network interface is located on the motherboard or expansion card. In this case, it's the first port or slot.
	    
	- **s3**: The "s" stands for slot, and "3" refers to the slot number within the device. In this example, it's the third slot within that port.
	
- **lo**: the loopback device is a special interface that your computer uses to communicate with itself. It is used mainly for diagnostics and troubleshooting and to connect to servers running on the local machine

- **virb0**: the virbr0, or "Virtual Bridge 0" interface is used for NAT (Network Address Translation). Virtual environments sometimes use it to connect to the outside network

Here are the key points to understand about NICs:

1. **Physical Hardware**: A NIC is a physical expansion card that can be installed in a computer's expansion slot (such as PCI or PCIe) or integrated directly into the motherboard of a computer or device. In the case of laptops and mobile devices, the NIC is often integrated onto the motherboard.
    
2. **Network Connectivity**: NICs are responsible for providing the physical and data link layer functionality required for network communication. They enable devices to connect to various types of networks, such as Ethernet (wired) or Wi-Fi (wireless).
    
3. **Interface to Network Media**: NICs have one or more ports or connectors that correspond to the type of network media they support. For example, Ethernet NICs typically have RJ-45 connectors for Ethernet cables, while Wi-Fi NICs have antennas for wireless connectivity.
    
4. **MAC Address**: Each NIC has a unique MAC (Media Access Control) address, which is a hardware-based identifier burned into the NIC's firmware or EEPROM. The MAC address is used for addressing and communication on a local network segment.
    
5. **Driver Software**: To function properly, NICs require driver software. This software communicates with the operating system to manage network traffic and provide a software interface for configuring network settings.
    
6. **Types of NICs**:
    
    - **Ethernet NIC**: These NICs are used for wired network connections and are commonly found in desktop computers and servers.
    - **Wi-Fi NIC**: Wi-Fi NICs enable wireless network connections and are found in laptops, smartphones, tablets, and other mobile devices.
    - **Fiber Optic NIC**: These NICs are designed for high-speed, long-distance connections using optical fibers.
    - **Specialized NICs**: In some cases, specialized NICs are used for specific purposes, such as network acceleration, load balancing, or capturing network traffic (e.g., capture cards).
    
1. **Network Speed and Standards**: NICs are available in various speeds and standards, such as 10/100/1000 Mbps (Fast Ethernet and Gigabit Ethernet) or even higher speeds like 10 Gbps or 100 Gbps for high-performance data centers.
    
8. **Role in Network Communication**: NICs play a crucial role in data transmission and reception. They encapsulate data into packets, manage the flow of data to and from the network, and handle error checking and correction.

## `ethtool`

`ethtool` is a command-line utility in Linux and Unix-like operating systems that allows users to query and configure settings for network interface cards (NICs). It provides detailed information about network interfaces and enables users to change various parameters to optimize network performance and troubleshoot network issues.

1. **Display Interface Information**: You can use `ethtool` to view detailed information about a specific network interface, including its driver, link status, speed, duplex mode, and more. For example:

```bash
$ ethtool <interface_name>
```

2. **Check Link Status**: `ethtool` can be used to determine whether a network cable is plugged in and if the link is up or down. This information can be valuable when diagnosing network connectivity problems.

3. **Change Interface Settings**: `ethtool` allows you to modify various network interface settings. For instance, you can change the speed and duplex mode to match the requirements of the network infrastructure:

```bash
$ sudo ethtool -s eth0 speed 100 duplex full
```

- `-s`: This option is used to set or modify the configuration of the network interface.
    
- `eth0`: This is the name of the network interface for which you want to change the settings. `eth0` is a common name for the first Ethernet interface on a Linux system.
    
- `speed 100`: This part of the command is specifying that you want to set the speed of the `eth0` network interface to 100 Mbps. The "speed" parameter defines the desired link speed.
    
- `duplex full`: This part of the command is specifying that you want to set the duplex mode of the `eth0` network interface to "full." The "duplex" parameter defines how data is transmitted and received on the network link. "Full" duplex means that data can be transmitted and received simultaneously, which is typically used for optimal performance in most cases.

4. **View and Set Wake-on-LAN (WoL) Settings**: You can use `ethtool` to configure Wake-on-LAN settings, which control whether a NIC can wake up the system from a sleep or powered-off state when it receives a specific network packet.

5.  **Gather Network Statistics**: `ethtool` can provide statistics related to network traffic, errors, and performance metrics, helping you monitor network performance and identify issues:

```bash
$ ethtool -S eth0
```

6. **Change Offload Features**: Many NICs support hardware offloading features that can improve network performance. `ethtool` allows you to enable or disable these features as needed.
    
7. **Testing and Diagnostics**: You can use `ethtool` for diagnostic purposes, such as testing link connectivity, cable quality, or network card functionality. It provides test options like `ethtool -t` for running self-tests.
    
8. **Query and Set Flow Control**: Flow control mechanisms can help manage network traffic. `ethtool` allows you to query and configure flow control settings for network interfaces.
    
9. **Query and Set Coalesce Settings**: Coalesce settings determine how network packets are processed by the NIC. `ethtool` enables you to query and adjust coalesce settings to optimize performance and reduce CPU utilization.

## NIC Bonding

The aggregation or combination of multiple NIC into a single bond interface mainly used for high availability and redundancy

![[Pasted image 20231029175810.png]]

### **Redundancy**

In a redundant NIC bonding configuration, multiple NICs are used to provide backup or failover in case one NIC or its connection fails. This ensures that network connectivity remains available even if one of the NICs or its associated network path becomes unavailable. Here's how redundancy is achieved:

- **Active-Backup Mode (Failover)**: In this mode, one NIC (the active or primary NIC) is actively used for network traffic, while the other NICs (backup or secondary NICs) remain inactive. If the active NIC fails or loses its connection, one of the backup NICs automatically takes over to maintain network connectivity.
    
- **Monitoring and Failover Mechanisms**: NIC bonding typically includes mechanisms to monitor the status of the active NIC. If the active NIC fails or becomes unavailable, the bonding driver detects this and switches to one of the backup NICs. The failover is usually seamless and transparent to network applications.
    

### **High Availability Link Aggregation**

In addition to redundancy, NIC bonding can be used to increase network bandwidth and achieve high availability through link aggregation. In this mode, multiple NICs are used together to increase throughput and provide load balancing. Here's how high availability link aggregation works:

- **Load Balancing**: Multiple NICs are actively used for network traffic simultaneously. Incoming and outgoing network packets are distributed across the NICs, balancing the load and maximizing network bandwidth utilization.
    
- **Fault Tolerance**: Even in link aggregation mode, NIC bonding provides fault tolerance. If one or more NICs in the bond fail, the remaining NICs continue to handle network traffic. This ensures that network connectivity is maintained, albeit at a reduced bandwidth if NICs fail.
    
- **Link Aggregation Protocols**: Various link aggregation protocols, such as IEEE 802.3ad (LACP - Link Aggregation Control Protocol), are used to manage the link aggregation. These protocols help in negotiating and configuring the link aggregation between the NICs and the connected network switch.
    
- **Switch Configuration**: To utilize link aggregation, the network switch or switches to which the bonded NICs are connected must also be configured to support link aggregation. The switch and NICs communicate using the chosen link aggregation protocol to create a high-bandwidth link.

## NIC Bonding Procedure

![[Pasted image 20231029180451.png]]

1. Add a new NIC if one does not exist then Install bonding driver `modprobe bonding` if bonding is not enabled. To list the bonding module info run `modinfo bonding`
	
2. Create a bond interface file

```bash
$ vi /etc/sysconfig/network-sctips/ifcfg-bond0

# File Content Example
DEVICE=bond0
TYPE=Bond
NAME=bond0
BONDING_MASTER=yes # bonding of the master is itself
BOOTPROTO=none # none or static if you want to assign a static IP
ONBOOT=yes
IPADDR=192.168.1.80
NETMASK=255.255.255.0
GATEWAY=192.168.1.1
BONDING_OPTS="mode=5 milmon"
```

3. Edit the first NIC file (enp0s3)

```bash
$ vi /etc/sysconfig/network-scripts/ifcfg-en0s3

# Replace the Content with the following
DEVICE=enp0s3
TYPE=Ethernet
BOOTPROTO=none # none or static if you want to assign a static IP
ONBOOT=yes
HWADDR="MAC from the ifconfig command"
MASTER=bond0
SLAVE=yes
```

4. Edit the second NIC file (enp0s8)

```bash
$ vi /etc/sysconfig/network-scripts/ifcfg-en0s8

# Replace the Content with the following
DEVICE=enp0s8
TYPE=Ethernet
BOOTPROTO=none # none or static if you want to assign a static IP
ONBOOT=yes
HWADDR="MAC from the ifconfig command"
MASTER=bond0
SLAVE=yes
```

5. Restart network `systemctl restart network`

6. Test and verify the configuartion with `ifconfig`



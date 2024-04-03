### IP

An **IP Address** is a 32-bit signature broken represented as four Octets (0-255) that is then convert into a number.

![[Pasted image 20240216165044.png]]

## Classful Addressing

Classful addressing is an early method for the allocation of IP addresses. Developed to facilitate the assignment of IP addresses to networks in a standardized manner, classful addressing divides the IP address space into five classes: A, B, C, D, and E. Each class was designed with a different network size in mind, from very large networks to smaller ones. This system was used before the introduction of Classless Inter-Domain Routing (CIDR) in 1993, which allowed for a more flexible allocation of IP addresses.

- **Class A**: Designed for very large organizations or networks requiring millions of IP addresses. The first bit of a Class A address is always '0', followed by a 7-bit network portion and a 24-bit host portion. This allows for 128 possible networks (0-127 in the first octet), but the 0 and 127 networks are reserved, reducing the usable range to 1-126.
- **Class B**: Intended for medium-sized networks. Class B addresses start with '10', followed by a 14-bit network portion and a 16-bit host portion, allowing for 16,384 networks (128.0.0.0 to 191.255.0.0).
- **Class C**: Suited for small organizations or networks requiring up to 254 hosts. Class C addresses begin with '110', with a 21-bit network portion and an 8-bit host portion. This results in 2,097,152 possible networks (192.0.0.0 to 223.255.255.0).
- **Class D**: Reserved for multicast addressing and does not divide into network and host portions. Class D addresses start with '1110', ranging from 224.0.0.0 to 239.255.255.255.
- **Class E**: Reserved for future use, experimental purposes, and starts with '1111', ranging from 240.0.0.0 to 255.255.255.255.
## ARP

#### Address Resolution Protocol (ARP)

1. **ARP Request**: When a client host needs to communicate with another host on the same local network (but does not know its MAC address), it broadcasts an ARP request on the network. This request contains the IP address of the target host (the server in this case) and asks, "Who has this IP address?"
    
2. **Broadcast**: The ARP request is broadcasted to all devices on the local network segment. Even though the request reaches all devices, only the host with the matching IP address will respond.
    
3. **ARP Reply**: The server host, recognizing its IP address in the ARP request, sends an ARP reply back to the client. This reply contains the server's MAC address, effectively saying, "I have the IP address you're asking about, and here is my MAC address."
    
4. **Updating ARP Cache**: Upon receiving the ARP reply, the client updates its ARP cache, a table where IP addresses are mapped to MAC addresses. This cache reduces the need to broadcast ARP requests for the same host in the future, thereby minimizing network traffic.
    
5. **Data Transmission**: With the server's MAC address now known, the client can encapsulate the data packet with the correct destination MAC address in the Ethernet frame's header. This allows the packet to be correctly delivered to the server at the Data Link layer.

![[Pasted image 20240221122008.png]]


# Subnet Masks

![[Pasted image 20240301155210.png]]

A subnet mask is a 32-bit number that masks an IP address and divides the IP address into network address and host address components. Subnet masks are used in IP networking to differentiate the network portion of an IP address from the host portion. This differentiation is crucial for routing IP packets on a network and for defining the size of a network or subnet.

### How Subnet Masks Work

An IP address consists of two main parts: the network portion and the host portion. The network portion identifies the specific network on which a device is located, while the host portion identifies the specific device on that network.

- **Binary Representation**: Both IP addresses and subnet masks are written as four octets separated by periods in decimal form for human readability (e.g., 255.255.255.0). However, within a computer or network device, they are processed in binary form.
- **Masking Process**: The subnet mask works by applying a bitwise AND operation between the IP address and the subnet mask. The result reveals the network address, enabling devices and routers to determine whether an IP address is on a local network or an external network.

![[Pasted image 20240301155832.png]]
### Explanation

Consider an IP address of 192.168.1.10 with a subnet mask of 255.255.255.0:

- In binary, the IP address is `11000000.10101000.00000001.00001010`.
- The subnet mask in binary is `11111111.11111111.11111111.00000000`.
- Performing a bitwise AND operation between the IP address and the subnet mask yields the network address: `11000000.10101000.00000001.00000000`, which corresponds to 192.168.1.0 in decimal form.

This indicates that the device with IP address 192.168.1.10 is on the network 192.168.1.0.

### Example

255.255.255.0 or /24 --> xxx.xxx.xxx.1 -->xxx.xxx.xxx.254

When a subnet is defined The Highest IP Address is reserved for the **Broadcast Address** and The Lowest IP is reserved for the **Network ID**

On a Network the subnet mask helps define if traffic is inside or outside of the Network for inbound traffic any place there is a 1 the number in the bits of a subnet mask the number have to be the same for example if you have a subnet 192.168.11.0/24 inbound traffic is defined by the IP range 192.168.11.1 -> 192.168.11.254 otherwise traffic is sent to the Default Gateway

### Purpose and Benefits

- **Network Organization**: Subnet masks allow a larger network to be divided into smaller sub-networks (subnets), making network management more efficient and reducing congestion.
- **Security and Performance**: By dividing a network into subnets, network traffic can be isolated within subnets, improving performance and security.
- **IP Address Utilization**: Subnetting enables the efficient use of IP addresses by allowing the creation of appropriately sized networks based on the actual number of hosts needed.

### Types of Subnet Masks

- **Default Subnet Mask**: Assigned based on the class (A, B, or C) of the IP address and assumes no custom subnetting. For example, Class C IP addresses have a default subnet mask of 255.255.255.0.
- **Custom Subnet Mask**: Used in subnetting to create subnets of different sizes within a network. This is essential in CIDR (Classless Inter-Domain Routing) to maximize the efficient use of IP addresses.

## Subnetting with CIDR

![[Pasted image 20240301160342.png]]

Classless Inter-Domain Routing (CIDR) is a method for allocating IP addresses and routing IP packets. Introduced in 1993 to replace the older classful IP addressing system, CIDR allows for more efficient and flexible allocation of IP addresses. This efficiency is achieved by varying the length of the subnet mask, which, in turn, allows for a wider range of IP address assignments and helps slow the exhaustion of IPv4 addresses.

| Subnet | Address Size |
| :----- | ------------ |
| /24    | 254          |
| /25    | 126          |
| /26    | 62           |
| /27    | 30           |
| /28    | 14           |
| /29    | 6            |
| /30    | 2            |

### Key Features of CIDR

- **Variable-Length Subnet Masking (VLSM)**: CIDR uses VLSM to divide the Internet into variable-sized blocks of IP addresses. This approach allows for the creation of subnets of almost any size, making it possible to allocate IP addresses more efficiently according to the actual needs of organizations and networks.
- **Notation**: CIDR notation simplifies the representation of IP addresses and their associated routing prefix. It uses a slash (`/`) followed by a number (e.g., `192.168.1.0/24`) to indicate the network portion of the address. The number after the slash represents the number of bits in the subnet mask that are set to 1, starting from the left. In the example, `/24` means the first 24 bits are the network part of the address, leaving the last 8 bits for host addresses within that network.
- **Supernetting**: CIDR supports the aggregation of several smaller networks into a single, larger address block, known as supernetting. This reduces the number of routing entries in the global routing table and simplifies the routing process.

### Benefits of CIDR

- **Efficient Use of IP Space**: By allowing the creation of subnets that precisely fit an organization's size, CIDR minimizes the wastage of IP addresses.
- **Reduction in Routing Table Size**: CIDR's ability to aggregate routes into supernets decreases the number of entries in routing tables, making internet routing more efficient.
- **Slows IP Address Exhaustion**: CIDR's efficient allocation has helped to slow down the rate at which the available IPv4 address space is used up, although the long-term solution to address exhaustion is the adoption of IPv6, which provides a vastly larger address space.
- **Flexibility**: Organizations can receive an IP address block based on their size and growth predictions, rather than being constrained by the fixed blocks defined by classful addressing.

### Transition to IPv6

While CIDR has extended the usability of IPv4, the continued growth of the internet and the proliferation of connected devices have led to the depletion of available IPv4 addresses. IPv6 was developed to address this limitation, offering a significantly larger address space (128-bit addresses compared to IPv4's 32-bit addresses) and incorporating features for improved performance and security. Transitioning to IPv6 is considered the ultimate solution to address space exhaustion, but CIDR remains a critical technology for managing the remaining IPv4 address space efficiently.

# Dynamic and Static IP Addressing

DHCP - Dynamic Host Configuration Protocol

A DHCP Server provides a IP, Subnet mask, Default Gateway, and DNS Server IP for any client. Whenever a host connects to a new network it sends a DHCP discover message the DHCP server can then respond with the information required to connect to the internet

![[Pasted image 20240223095332.png]]

# Special IP Addresses

## Private IP Addresses

Private IP addresses are reserved IP addresses used within private networks, not directly accessible from the internet. They are defined by the Internet Assigned Numbers Authority (IANA) and are set aside specifically for use in private networks, such as those within homes, schools, and businesses. The main purpose of private IP addresses is to allow multiple devices within a network to communicate with each other without using a public IP address for each device. This helps in conserving the limited number of available public IP addresses and enhances network security by hiding internal network addresses from the external network.

There are specific IP ranges designated for private use:

- **10.0.0.0 to 10.255.255.255**: This is a single Class A network with a 8-bit block size, providing up to 16 million private IP addresses.
- **172.16.0.0 to 172.31.255.255**: This range is a set of 16 contiguous Class B networks with a 12-bit block size, offering over 1 million addresses.
- **192.168.0.0 to 192.168.255.255**: This is a set of 256 contiguous Class C networks with a 16-bit block size, allowing for approximately 65,000 addresses.

Devices within the same private network can communicate with each other using private IP addresses. However, to access the internet or communicate with devices outside their local network, they must go through a network address translation (NAT) process typically performed by a router. The router translates private IP addresses to a public IP address for outgoing traffic and then back to the appropriate private IP address for incoming traffic, enabling seamless internet access and communication with external services.

## Loopback Address

A loopback address is a special IP address that is used to test network software and hardware. It is designated for use in diagnostics and troubleshooting within the local host. The most common loopback address is `127.0.0.1` for IPv4 and `::1` for IPv6. When you send data to the loopback address, the network stack of the operating system processes the data as if it had been received from the network, but instead, it immediately loops it back to the sending side. This allows developers and network administrators to test the network interface and the stack without needing to physically transmit packets over the network.

The entire `127.0.0.0/8` network (meaning any address from `127.0.0.1` to `127.255.255.254`) is reserved for loopback purposes, but `127.0.0.1` is the most commonly used address. Using a loopback address is a standard way to refer to the local system in network testing and software development, as it allows for a reliable method of sending messages to the same device.

This mechanism is particularly useful for testing network software, configuring software applications, and diagnosing problems within the network interface or the network stack itself. It ensures that the network interface and software can send and receive data correctly without involving the physical network interface, which can be helpful for initial setup, development, or troubleshooting scenarios.

## APIPA - Automatic Private IP Addressing

  
APIPA stands for Automatic Private IP Addressing. It is a feature used by Microsoft Windows operating systems to automatically assign a unique IP address to a computer's network interface when it fails to obtain a static IP address from a DHCP (Dynamic Host Configuration Protocol) server or when no manual IP address has been configured. This feature enables computers on a local network to communicate with each other even in the absence of a DHCP server or manual network configuration.

The IP addresses assigned by APIPA are in the range of **169.254.0.1 to 169.254.255.254** with a subnet mask of 255.255.0.0 (or a /16 network prefix). This address range is specifically reserved for Automatic Private IP Addressing and is recognized across different operating systems for the same purpose.

APIPA is particularly useful in small networks, such as a home or small business network, where there is no DHCP server to assign IP addresses and manual configuration is not feasible or desired. When a device configured to use DHCP starts up and cannot find a DHCP server, it assigns itself an IP address from the APIPA range. This allows the device to communicate with other devices on the same local network that have also been assigned an APIPA address.

However, because APIPA addresses are only valid for local network segments, they cannot be used to communicate with devices outside the local network or the internet. This means that while APIPA allows for basic network connectivity and communication between devices on the same subnet, it does not provide full network functionality without further configuration or the presence of a DHCP server.
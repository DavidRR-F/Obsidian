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

A subnet mask is a 32-bit number that masks an IP address and divides the IP address into network address and host address components. Subnet masks are used in IP networking to differentiate the network portion of an IP address from the host portion. This differentiation is crucial for routing IP packets on a network and for defining the size of a network or subnet.

### How Subnet Masks Work

An IP address consists of two main parts: the network portion and the host portion. The network portion identifies the specific network on which a device is located, while the host portion identifies the specific device on that network.

- **Binary Representation**: Both IP addresses and subnet masks are written as four octets separated by periods in decimal form for human readability (e.g., 255.255.255.0). However, within a computer or network device, they are processed in binary form.
- **Masking Process**: The subnet mask works by applying a bitwise AND operation between the IP address and the subnet mask. The result reveals the network address, enabling devices and routers to determine whether an IP address is on a local network or an external network.

### Explanation

Consider an IP address of 192.168.1.10 with a subnet mask of 255.255.255.0:

- In binary, the IP address is `11000000.10101000.00000001.00001010`.
- The subnet mask in binary is `11111111.11111111.11111111.00000000`.
- Performing a bitwise AND operation between the IP address and the subnet mask yields the network address: `11000000.10101000.00000001.00000000`, which corresponds to 192.168.1.0 in decimal form.

This indicates that the device with IP address 192.168.1.10 is on the network 192.168.1.0.

### Example

255.255.255.0 or /24 --> xxx.xxx.xxx.1 -->xxx.xxx.xxx.254

On a Network the subnet mask helps define if traffic is inside or outside of the Network for inbound traffic any place there is a 1 the number in the bits of a subnet mask the number have to be the same for example if you have a subnet 192.168.11.0/24 inbound traffic is defined by the IP range 192.168.11.1 -> 192.168.11.254 otherwise traffic is sent to the Default Gateway

### Purpose and Benefits

- **Network Organization**: Subnet masks allow a larger network to be divided into smaller sub-networks (subnets), making network management more efficient and reducing congestion.
- **Security and Performance**: By dividing a network into subnets, network traffic can be isolated within subnets, improving performance and security.
- **IP Address Utilization**: Subnetting enables the efficient use of IP addresses by allowing the creation of appropriately sized networks based on the actual number of hosts needed.

### Types of Subnet Masks

- **Default Subnet Mask**: Assigned based on the class (A, B, or C) of the IP address and assumes no custom subnetting. For example, Class C IP addresses have a default subnet mask of 255.255.255.0.
- **Custom Subnet Mask**: Used in subnetting to create subnets of different sizes within a network. This is essential in CIDR (Classless Inter-Domain Routing) to maximize the efficient use of IP addresses.

## Subnetting
## IP address
a unique string of numbers separated by periods that identifies each computer using the internet protocol to communicate over a network

## Subnet Mask
a 32-bit number that masks an IP address, and divides the IP address into network address and host address. Subnet Mask is made by setting network bit to all 1's and setting host gits to all 0's

|Address Class|Bits for Subnet Mask|SubnetMask|
|:--------------|:-----------------------|:-------------|
|Class A|11111111 00000000 00000000 00000000|255.0.0.0|
|Class B|11111111 11111111 00000000 00000000|255.255.0.0|
|Class C|11111111 11111111 11111111 00000000|255.255.255.0|
## Gateway

device or software component that serves as a bridge or link between two different networks, allowing data to flow between them. It plays a crucial role in connecting networks with different architectures, protocols, or communication technologies. Here are some key aspects of network gateways:

1. **Interconnection**: A network gateway can connect networks of various types, such as a local area network (LAN) to the internet, two LANs, or a LAN to a wide area network (WAN).
    
2. **Protocol Translation**: Gateways often perform protocol translation, converting data from one network protocol to another. For example, it can translate data from Ethernet to Wi-Fi, or from TCP/IP to UDP.
    
3. **Address Translation**: In many cases, network gateways perform Network Address Translation (NAT). NAT allows multiple devices on a LAN to share a single public IP address for accessing the internet. It masks the internal IP addresses from external networks.
    
4. **Firewall Functionality**: Some network gateways also function as firewalls, providing security by filtering incoming and outgoing traffic based on predefined rules and policies.
    
5. **Routing**: Gateways can route data between networks based on information from routing tables, ensuring that data packets are directed to the correct destination.
    
6. **Proxy Services**: Some gateways offer proxy services, which allow them to act as intermediaries between clients and servers, often caching content to improve performance.
    
7. **VPN (Virtual Private Network) Support**: Gateways can facilitate secure remote access to a network by providing VPN services, allowing remote users to connect to the network securely over the internet.
    
8. **Load Balancing**: In more advanced scenarios, gateways may perform load balancing, distributing network traffic across multiple servers or paths to optimize performance and redundancy.
    
9. **Monitoring and Logging**: Network gateways often include monitoring and logging capabilities to track network activity, detect issues, and generate logs for analysis and troubleshooting.
    
10. **Management**: They typically have management interfaces for configuration and maintenance, allowing administrators to set up and manage network gateway settings.
    

Common examples of network gateways include:

- **Router**: A router is a common type of network gateway used to connect a local network to the internet. It performs tasks like routing, NAT, and firewalling.
    
- **Firewall**: Firewalls can act as network gateways, providing security features to control incoming and outgoing traffic.
    
- **Proxy Server**: A proxy server can function as a gateway for web traffic, forwarding requests and responses between clients and web servers.
    
- **VPN Gateway**: A VPN gateway connects remote users or branch offices to a corporate network securely over the internet.

## Static vs. DHCP

**Static IP (Static Address Assignment):**

1. **Manually Assigned**: In a network with static IP addressing, each device on the network is manually configured with a specific IP address. This means that network administrators or users must assign IP addresses to devices individually.
    
2. **IP Address Remains Constant**: Once a static IP address is assigned to a device, it does not change unless manually reconfigured. This stability can be useful for servers, network devices, and devices that need consistent IP addresses for specific purposes.
    
3. **Predictability**: Static IP addresses provide predictability as you always know which IP address a particular device will have. This can simplify network management and troubleshooting.
    
4. **Less Network Overhead**: Since IP addresses are not dynamically assigned, there is no need for the DHCP server to manage and allocate addresses, reducing network overhead.
    
5. **Configuration Control**: Administrators have full control over IP address assignments and can tailor them to specific requirements.
    

**DHCP (Dynamic Host Configuration Protocol):**

1. **Automatic Address Assignment**: DHCP is a network protocol that automatically assigns IP addresses to devices when they join a network. A DHCP server manages the distribution of IP addresses.
    
2. **Dynamic IP Assignment**: Devices receive IP addresses dynamically, and these addresses may change each time a device connects to the network. DHCP leases IP addresses for a specified period, after which the device may request a renewal of the lease or be assigned a new address.
    
3. **Simplifies IP Management**: DHCP simplifies IP address management in large networks by automating the process. It eliminates the need for manual configuration and reduces the risk of address conflicts.
    
4. **Efficient Resource Utilization**: DHCP helps efficiently utilize available IP addresses by only assigning addresses when needed. When devices disconnect or are no longer in use, their IP addresses can be recycled and assigned to other devices.
    
5. **Scalability**: DHCP is well-suited for networks with a large number of devices, as it scales easily without the need for manual address configuration.
    

- **Static IP** is best when you need devices to have fixed, predictable IP addresses, and you want full control over address assignment. It is commonly used for servers, network devices, and specific devices with static networking requirements.
    
- **DHCP** is preferred in larger networks where automatic IP address assignment and management efficiency are important. It simplifies administration and helps prevent address conflicts, making it well-suited for general-purpose devices like computers, smartphones, and IoT devices.

## Network Interface

A network interface, often abbreviated as NIC (Network Interface Card) or simply as "network adapter," is a hardware component or a software interface that allows a computer or other device to physically connect to a network and communicate with other devices on that network. Network interfaces play a fundamental role in enabling data transmission over networks. Here are key points about network interfaces:

1. **Hardware Network Interface**:
    
    - **Network Adapter Card**: In most cases, a physical network interface is a network adapter card that can be installed in a computer's expansion slot or is integrated directly into the motherboard. Examples include Ethernet cards, Wi-Fi cards, and fiber optic network adapters.
    - **Physical Ports**: Network adapters often have physical ports, such as Ethernet ports (RJ-45) for wired connections or antennas for wireless connections.
2. **Software Network Interface**:
    
    - In some cases, a network interface can be a purely software-based construct. For example, virtual machines (VMs) may have virtual network interfaces that are created and managed by virtualization software.
3. **Functions of a Network Interface**:
    
    - **Data Link Layer**: The network interface operates at the data link layer (Layer 2) of the OSI model. It is responsible for tasks such as framing data into packets, addressing, and error detection.
    - **Media Access Control (MAC) Address**: Each network interface typically has a unique MAC address, which is a hardware-based identifier used for addressing and communication within a local network segment.
    - **Network Protocol Support**: Network interfaces are designed to work with specific network protocols, such as Ethernet, Wi-Fi (802.11), Bluetooth, etc.
4. **Types of Network Interfaces**:
    
    - **Ethernet Interface**: Common for wired LAN connections, using Ethernet cables and connectors.
    - **Wireless Interface**: Used for Wi-Fi connections, allowing devices to connect to wireless access points or routers.
    - **Fiber Optic Interface**: Used in high-speed, long-distance networks, utilizing optical fibers for data transmission.
    - **Loopback Interface**: A virtual interface (usually identified as "lo" or "localhost") that allows a device to communicate with itself, often used for testing network functionality.
5. **Network Configuration**:
    
    - Network interfaces require configuration settings, such as IP addresses, subnet masks, and gateway addresses, to function properly within a network.
6. **Drivers and Software**: Network interface hardware requires appropriate drivers or software to communicate with the operating system and manage network connections.
    
7. **Role in Network Communication**: When a device wants to send or receive data over a network, the data is processed and transmitted/received through the network interface. It plays a critical role in encapsulating data into packets, managing communication with other devices, and handling data transmission/reception.
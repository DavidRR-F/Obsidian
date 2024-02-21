
# Hosts on the same network

### 1. Client Host Acquires Server Hosts IP Address (Layer 3)

Both hosts are configured with an IP and a Subnet Mask. The Client Host can determine that the Server Host is on the same network by comparing the Servers IP and Subnet to its own. On a local network, a client host can obtain the IP address of a server host through several mechanisms, depending on the network configuration and the services available. Once the information is gathered it then adds the information in the Level 3 header.

- **DHCP (Dynamic Host Configuration Protocol)**: Automatically assigns IP addresses to devices and can inform clients about IPs of specific services, though not typically used for direct server discovery.

- **DNS (Domain Name System)**: Resolves domain names to IP addresses; clients query a DNS server with a domain name to get the corresponding server IP.

- **mDNS (Multicast DNS)**: Allows devices on the same local network to discover each other without a centralized DNS server; useful for resolving hostnames to IPs locally.

- **LLMNR (Link-Local Multicast Name Resolution)**: Similar to mDNS, allows local network devices to resolve names of other hosts without a DNS server, primarily used in Windows networks.

- **Static Configuration**: IP addresses of servers are manually configured or provided to clients, bypassing the need for discovery protocols.

### 2. Client Host acquires Server Hosts MAC Address (Layer 2)

A client host obtains the server host's MAC address to add to the Level 2 (Data Link layer) header through the Address Resolution Protocol (ARP), which is essential for communication within the same local network.

#### Address Resolution Protocol (ARP)

1. **ARP Request**: When a client host needs to communicate with another host on the same local network (but does not know its MAC address), it broadcasts an ARP request on the network. This request contains the IP address of the target host (the server in this case) and asks, "Who has this IP address?"
    
2. **Broadcast**: The ARP request is broadcasted to all devices on the local network segment. Even though the request reaches all devices, only the host with the matching IP address will respond.
    
3. **ARP Reply**: The server host, recognizing its IP address in the ARP request, sends an ARP reply back to the client. This reply contains the server's MAC address, effectively saying, "I have the IP address you're asking about, and here is my MAC address."
    
4. **Updating ARP Cache**: Upon receiving the ARP reply, the client updates its ARP cache, a table where IP addresses are mapped to MAC addresses. This cache reduces the need to broadcast ARP requests for the same host in the future, thereby minimizing network traffic.
    
5. **Data Transmission**: With the server's MAC address now known, the client can encapsulate the data packet with the correct destination MAC address in the Ethernet frame's header. This allows the packet to be correctly delivered to the server at the Data Link layer.

![[Pasted image 20240221122008.png]]

# Hosts on different networks

Communication of hosts across different networks has the added layer of communicating through routers that connect the Client and Server networks.

![[Pasted image 20240221131041.png]]

1. The Client, Server, and Router(s) have MAC and IP addresses
	- /24 is a Subnet Mask - 255.255.255.0

2. The Client already knows the Servers IP Address through one of the methods defined earlier. If it registers that the IP address is on a different network it will try sending the data to the router through the default gateway instead of a host IP directly

3. The Client Uses ARP to resolve the MAC address of the Routers IP
	- The Client Already knows the Router IP address because it is configured as the Default Gateway

4. With the level 2 header completed after the ARP request retrieves the Routers MAC Address the data can then be sent to the Router which will then continue the chain until the data reaches the Server Host

**Note**: Once a MAC Address is discovered by a host  through a arp request the information is stored in the ARP Cache so that arp does not need to be called on the same IP every time the Client host wants to send data to it


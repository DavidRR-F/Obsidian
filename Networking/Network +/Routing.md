**Routing** is the process of moving data between networks. A **Router** is a device whose primary purpose is Routing.

Routers are connected to the network and have an IP address and a MAC address just like hosts. The difference between a router and a host based on the RFC standards is that Routers, unlike hosts, forward packets that are not explicitly addressed to itself.

Since Routers can have IP and MAC addresses on multiple networks, Routers maintain a map of all networks they know about known as a routing table

![[Pasted image 20240222091555.png]]
## Routing Table

a Routing Table can be populated via three methods.

- **Directly Connected**: Routes for the Networks which are attached

![[Pasted image 20240222092210.png]]

- **Static Route**: Route manually provided by an Administrator

![[Pasted image 20240222093501.png]]

- **Dynamic Route**: Route learned automatically from other Routers

![[Pasted image 20240222094745.png]]

**Note** If a router receives a packet that it doesn't know how to deliver the route will discard the packet. Thus, the Routing Table needs to be pre populated before traffic can flow through it.
### Dynamic Routing Protocols

Dynamic routing protocols are algorithms designed for routers to communicate information about the best paths through a network dynamically. Key protocols include:

1. **Routing Information Protocol (RIP):** A distance-vector routing protocol that uses hop count as a routing metric to find the shortest path between the source and destination.
2. **Open Shortest Path First (OSPF):** A link-state routing protocol that uses a method of flooding to exchange link information within an Autonomous System (AS), creating a map of the network to determine the shortest path.
3. **Border Gateway Protocol (BGP):** An exterior gateway protocol designed to exchange routing and reachability information among autonomous systems on the internet.
4. **Intermediate System to Intermediate System (IS-IS):** A link-state routing protocol, similar to OSPF, used to determine the best path for data through a network of packet-switched communication systems.
5. **Enhanced Interior Gateway Routing Protocol (EIGRP):** An advanced distance-vector routing protocol that is used on a computer network for automating routing decisions and configuration.

### ARP Tables

Routers also have **ARP Tables** that maintain a mapping IP -> MAC Addresses.

![[Pasted image 20240222101055.png]]

Unlike Routing Tables ARP Tables start out empty and get populated dynamically as needed with traffic flowing through the network

![[Pasted image 20240222105953.png]]


# Router Hierarchies

Routers are typically connected in a hierarchy. This makes them easier to scale and gives us more consistent connectivity

![[Pasted image 20240222141939.png]]

## Route Summarization

Routes configured in a hierarchy allow for **Route Summarization** which reduces the routes in a routing table by identifying routes in higher order Octets of the IP space

![[Pasted image 20240222143619.png]]

When a packet shows up that matches multiple routing table options the router choice the more specific option by default as shown below

![[Pasted image 20240222144850.png]]

#### Default Route

`0.0.0.0 /0` - every IPv4 address

in are previous example shown since Router 8 has to go through Router 5 no matter what packet is sent we can give it the default route to Router 5 `0.0.0.0/0 --> R5`

#### Metric

a metric in a routing table is a value used by routers to determine the best path for sending packets to their destination. The metric helps the routing algorithm decide which of several possible routes to use when forwarding packets, particularly when there are multiple routes to the same destination. Metrics can be based on various factors, including hop count (the number of steps through routers on a network), bandwidth, delay, cost, load, or a combination of these and other factors. The specific metric used can vary depending on the routing protocol in operation (e.g., RIP, OSPF, BGP).

![[Pasted image 20240304191536.png]]

# Understanding Ports

Source and destination ports are integral components of the transport layer within the TCP/IP network protocol suite, which is used to manage the delivery of data packets from the source to the destination application on a network. These ports are used by protocols like TCP (Transmission Control Protocol) and UDP (User Datagram Protocol) to distinguish between multiple connections or sessions between devices.

### Source Port

- The source port is a numerical identifier assigned by the sending device's operating system or application to identify the sending process or application within the device. It's like the return address on a letter, telling the recipient where to send the reply.
- In many cases, the source port number is dynamically assigned from the range of ephemeral ports, which are temporary port numbers used for the duration of a session.
- The source port serves as a unique identifier for the session from the perspective of the sending device, allowing the device to manage multiple concurrent sessions.

### Destination Port

- The destination port is a numerical identifier that specifies the receiving application or service on the destination device. It's akin to the address on a letter, directing the packet to the correct application waiting to receive data.
- Well-known port numbers (port 0-1023) are often associated with specific services; for example, HTTP traffic typically uses port 80, and HTTPS uses port 443. These well-known ports are standardized and recognized across the internet for common services.
- The destination port tells the receiving device's operating system which application should receive the incoming packet.

![[Pasted image 20240304212744.png]]
### How They Work Together

When a device initiates a communication session over the network, it sends packets with both source and destination port numbers specified in the header of each TCP or UDP packet. This information, along with the source and destination IP addresses, ensures that data sent over the network reaches the correct application on the intended device. Once the data arrives at the destination device, the destination port number is used to deliver the data to the correct application, and the source port number is used by the receiving application to send a response back to the correct application on the original sending device.

# Network Address Translation (NAT)

Network Address Translation (NAT) is a method used in networking to modify network address information in the header of IP packets while they are in transit across a traffic routing device. The primary purpose of NAT is to limit the number of public IP addresses an organization or network must use, for both economy and security reasons. This is crucial in today's Internet because it helps alleviate the problem of IP address exhaustion under IPv4 by allowing multiple devices on a private network to share a single or a few public IP addresses.

NAT operates at the border of a network, typically on a router or firewall, and works by translating the private (local) IP addresses to a public (global) IP address and vice versa. This process involves re-writing the source and/or destination addresses of IP packets as they pass through the NAT device.

### Types of NAT

There are several types of NAT, including:

1. **Static NAT:** Maps one private IP address to one public IP address. This is often used for web hosting or any other service that needs to be accessible from the outside network.
    
2. **Dynamic NAT:** Maps an unregistered IP address to a registered IP address from a pool of registered IP addresses. Unlike static NAT, dynamic NAT does not guarantee the same public IP address for a private IP address on each connection, which makes it less suitable for hosting services accessible from the external network but more scalable for general Internet access for internal users.
    
3. **Port Address Translation (PAT):** Also known as "NAT overload," PAT is a type of dynamic NAT that allows multiple devices on a local network to be mapped to a single public IP address but with a different port number for each session. This is the most common type of NAT and is often what is referred to when someone mentions NAT in a home or small office network setting. It significantly reduces the need for multiple public IP addresses.
    

### How NAT Works

1. **Outbound Traffic (Internal to External):** For traffic going from the internal network to the Internet, the NAT device replaces the source IP address (internal private address) with the public IP address of the NAT device and changes the source port to a unique port number. This information is kept in a NAT translation table so that return traffic can be correctly directed back to the originating device.
    
2. **Inbound Traffic (External to Internal):** For traffic initiated from the external network, the NAT device looks at its translation table to determine the correct internal IP address and port number to which the traffic should be forwarded.

# Forwarding Ports

Port forwarding, also known as port mapping, is a technique used in networking to redirect a communication request from one address and port number combination to another while the packets are traversing a network gateway, such as a router or firewall. This is commonly used in scenarios where you want to make a computer or service within a private local-area network (LAN) accessible from the external internet or another network.

### How Port Forwarding Works

When a device on the internet sends data to the port number defined in the port forwarding rule, the router at the edge of the receiving network handles this data. The router, configured with port forwarding rules, will redirect the incoming connection to the specified internal LAN address and port number. This process allows external devices to connect to a specific device within a private network, even though the network is behind a NAT (Network Address Translation) device or firewall that typically blocks such direct connections for security reasons.

![[Pasted image 20240304214945.png]]
## Common Uses of Port Forwarding

- **Gaming:** Many online games and gaming consoles require port forwarding to connect with other players over the internet, especially for hosting multiplayer games.
- **Servers:** Hosting a web, FTP, or gaming server on your home network usually requires port forwarding so that users from outside your network can access the services provided by the server.
- **Remote Access:** Applications like remote desktop software may require port forwarding to allow a user to connect to a computer within a private network from a remote location over the internet.
## Port Range Forwarding

Port range forwarding, similar to basic port forwarding, is a network configuration process used to redirect external communications from a range of port numbers through a router or firewall to a specific device within a private local network (LAN). Instead of forwarding a single port, port range forwarding allows you to specify a range of ports, making it more efficient and convenient when multiple ports need to be opened for a particular application or service.

### Use Cases for Port Range Forwarding

Port range forwarding is particularly useful in scenarios where an application or service operates over multiple ports. Here are some common examples:

- **Online Gaming Servers:** Some games or game servers might use a range of ports instead of a single port to manage game traffic, matchmaking, voice communication, and updates.
- **Peer-to-Peer (P2P) Applications:** P2P applications, including some file-sharing or video streaming services, may use a range of ports to optimize connections and data transfer.
- **Video Surveillance Systems:** Some video surveillance and security camera systems require multiple ports to be open for live streaming, recording, and management functionalities.

## Port Triggering

Port triggering is a networking feature used in some routers that allows for the automatic forwarding of specific ports based on outgoing traffic from a network. It's somewhat similar to port forwarding but with a key difference: port triggering does not require the specification of a specific internal IP address to which the incoming packets should be directed. Instead, the router dynamically opens the incoming port(s) for the device that initiated the outgoing traffic. This makes port triggering more flexible and secure than static port forwarding, especially for environments where IP addresses are assigned dynamically.

### How Port Triggering Works

1. **Trigger:** An internal device makes an outgoing connection using a specified trigger port. The router notes the IP address of this device.
    
2. **Opening Ports:** Based on the outgoing trigger, the router temporarily opens a specified range or specific incoming ports.
    
3. **Connection:** External devices can then connect to the network through these open ports, and the router directs this incoming traffic to the device that initiated the outgoing connection.
    
4. **Timeout:** After a certain period of inactivity or when the connection is terminated, the router automatically closes the open ports.
### Advantages of Port Triggering

- **Dynamic Management:** Port triggering automatically opens and closes ports as needed, eliminating the need for manual configuration of port forwarding for devices with dynamic IP addresses.
- **Enhanced Security:** Since ports are not permanently open, the risk of unauthorized access to network resources is reduced.
- **Flexibility:** It supports applications that use multiple ports or dynamic port assignments without the need for complex configuration.

## DMZ

A DMZ, or Demilitarized Zone in network architecture, is a physical or logical subnetwork that contains and exposes an organization's external-facing services to an untrusted network, typically the Internet. The primary purpose of a DMZ is to add an additional layer of security to an organization's local area network (LAN); a DMZ allows external networks to access only the services that are exposed in the DMZ, while the rest of the organization's network remains secured behind a firewall.

### How a DMZ Works

In a typical DMZ setup, there are at least three network segments:

1. **The Internal Network (LAN):** This is the core network where sensitive data and resources are stored. Access to this area is highly restricted and monitored.
2. **The External Network (Internet):** The wide area network (WAN) that is not trusted and potentially harmful.
3. **The DMZ Itself:** Sits between the internal and external networks. Servers and services that need to be accessible from the Internet are placed here. While the DMZ is more exposed to the Internet than the LAN, it still has protective measures in place to prevent unauthorized access to the internal network.

### Common DMZ Use Cases

- **Web Servers:** Websites that need to be accessible from the Internet are hosted on servers within the DMZ.
- **Email Servers:** To allow external emails to be received and sent while keeping the internal network secure.
- **FTP Servers:** For sharing files with external entities in a controlled manner.
- **VPN Endpoints:** VPN servers are often placed in the DMZ to allow remote users secure access to the internal network.

### Advantages of Using a DMZ

- **Enhanced Security:** By isolating external access to a controlled area of the network, the DMZ provides an additional layer of security, helping to prevent attackers from directly accessing the internal network.
- **Service Availability:** It allows organizations to offer services to external users without exposing their internal network.
- **Network Segmentation:** Acts as a buffer zone, segregating different types of traffic and reducing the risk of internal network exposure.

### Security Considerations

While a DMZ provides an added layer of security, it also requires careful configuration and management to ensure that it does not become a vulnerability. This includes:

- Regularly updating and patching systems within the DMZ to protect against known vulnerabilities.
- Minimizing the number of services and openings to reduce potential attack vectors.
- Monitoring traffic to and from the DMZ for suspicious activity.


## Routing Table

a Routing Table can be populated via three methods.

- **Directly Connected**: Routes for the Networks which are attached

![[Pasted image 20240222092210.png]]

- **Static Route**: Route manually provided by an Administrator

![[Pasted image 20240222093501.png]]

- **Dynamic Route**: Route learned automatically from other Routers

![[Pasted image 20240222094745.png]]

**Note** If a router receives a packet that it doesn't know how to deliver the route will discard the packet. Thus, the Routing Table needs to be pre populated before traffic can flow through it.
## Dynamic Routing Protocols

Dynamic routing protocols are algorithms designed for routers to communicate information about the best paths through a network dynamically.
### **Routing Information Protocol (RIP)**

A distance-vector routing protocol that uses hop count as a routing metric to find the shortest path between the source and destination.

![[Pasted image 20240305134406.png]]

- RIP's max hop count is 15
- RIP1 used only classful networking

#### Distance-Vector Routing Protocol

Distance-vector routing protocols determine the best path to a destination based on distance metrics (like hop count) and direction (vector). Routers using distance-vector protocols periodically exchange information with their immediate neighbors, containing the distances to all destinations they know of. This information is used to update their routing tables accordingly.

- **Key Features**:
    
    - Simplicity and ease of implementation.
    - Routers only know the next hop and the distance (in terms of a metric like hop count) to reach any destination.
    - Slow convergence and susceptibility to routing loops, although mechanisms like split horizon, route poisoning, and hold-down timers are used to mitigate these issues.
- **Examples**: RIP (Routing Information Protocol) and IGRP (Interior Gateway Routing Protocol, a precursor to EIGRP) are examples of distance-vector routing protocols.
### **Open Shortest Path First (OSPF)** 

A link-state routing protocol that uses a method of flooding to exchange link information within an Autonomous System (AS), creating a map of the network to determine the shortest path.

![[Pasted image 20240305142143.png]]

- OSPF uses Area IDs
- OSPF converges very quickly

#### Link-State Routing Protocol

Link-state routing protocols operate by maintaining a complete map or topology of the network. Each router independently discovers its neighbors and the status of the links to those neighbors. This information is then compiled into link-state advertisements (LSAs) that are flooded to all routers in the network area, allowing each router to build a complete, consistent view of the network topology.

- **Key Features**:
    
    - Utilizes Dijkstra's algorithm to calculate the shortest path to each node.
    - Rapid convergence due to immediate flooding of topology changes.
    - Scales well in larger networks with the use of areas or zones to limit the scope of LSAs.
- **Examples**: OSPF (Open Shortest Path First) and IS-IS (Intermediate System to Intermediate System) are two well-known link-state routing protocols.
### **Border Gateway Protocol (BGP)** 

An exterior gateway protocol designed to exchange routing and reachability information among autonomous systems on the internet.

#### Exterior Gateway Protocol (EGP)

Exterior Gateway Protocols are designed to route data between autonomous systems (ASes), which are distinct networks managed by different organizations. EGPs are crucial for internet connectivity, as they enable the exchange of routing information between independently managed networks.

- **Key Features**:
    
    - Focuses on policy-based routing decisions rather than just the shortest path.
    - Manages routing between autonomous systems with scalability to support the global internet.
- **Example**: BGP (Border Gateway Protocol) is the de facto EGP used on the internet today. While "EGP" refers to a specific protocol that was used historically for routing between networks, BGP is the standard protocol currently in use for this purpose.

### Conclusion

**Static routing** involves manually configuring the routes in a network device's routing table. Network administrators explicitly set the paths that data packets take through the network by specifying the next hop address or specific interface for each destination network. These routes do not change unless manually updated or removed by the administrator.

**Dynamic routing** uses protocols to automatically discover and update routing information between routers. This method enables the network to adapt to changes, such as link failures or network expansions, without manual intervention. Dynamic routing protocols, such as OSPF (Open Shortest Path First), EIGRP (Enhanced Interior Gateway Routing Protocol), and BGP (Border Gateway Protocol), exchange information between routers to determine the best paths for data packet forwarding.

### IGP (Interior Gateway Protocol)

IGPs are used within a single autonomous system (AS). An autonomous system is a collection of IP networks and routers under the control of one or more network operators that presents a common routing policy to the internet. IGPs distribute routing information among routers within the same autonomous system.

**Key Characteristics of IGPs:**

- **Scope**: Operate within a single autonomous system.
- **Purpose**: Manage routing within a network, ensuring data packets are efficiently distributed among routers in the same AS.
- **Examples**: Common IGPs include:
    - **RIP (Routing Information Protocol)**: Uses hop count as a routing metric, with a maximum limit of 15 hops.
    - **OSPF (Open Shortest Path First)**: A link-state protocol that quickly converges and scales well within large or complex networks.
    - **EIGRP (Enhanced Interior Gateway Routing Protocol)**: A Cisco proprietary protocol that combines the best features of link-state and distance-vector protocols.

### EGP (Exterior Gateway Protocol)

EGP is specifically designed for routing between autonomous systems, facilitating the exchange of routing information between different networks operated by separate organizations. While EGP historically refers to a specific protocol, the term is more broadly used to describe protocols that function between autonomous systems.

**Key Characteristics of EGPs:**

- **Scope**: Operate between autonomous systems.
- **Purpose**: Manage routing between separate networks, enabling internet connectivity and data exchange across the global internet.
- **Examples**: The most notable EGP is:
    - **BGP (Border Gateway Protocol)**: The de facto EGP used on the internet, managing routing between different autonomous systems. It ensures data packets find their way across the complex interconnections of the global internet.

### Key Differences

- **Operational Scope**: IGPs are concerned with routing within a single AS, focusing on internal network efficiency and optimization. EGPs, particularly BGP, handle routing between ASes, dealing with policy, scalability, and redundancy on a global scale.
- **Routing Policies**: IGPs typically optimize for metrics like distance, cost, or speed. EGPs must consider policy decisions, which may include routing preferences, load balancing, and avoiding certain networks due to business or political reasons.
- **Complexity and Scalability**: EGPs must manage more complex routing tables and deal with a wider range of routing policies and relationships than IGPs.
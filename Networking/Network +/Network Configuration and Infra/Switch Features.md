# VLAN

A VLAN (Virtual Local Area Network) is a network technology used to logically separate network segments without requiring physical separation of the network infrastructure. VLANs allow network administrators to group hosts together even if they are not directly connected to the same network switch, enabling more efficient use of resources and improved security.

Divides Switch Ports into isolated groups
Divides Switches into multiple "mini-switches"
Each VLAN will contain its own MAC Address Table and perform the 3 switch actions independently of one another

![[Pasted image 20240221162352.png]]

**Note**: In a MAC Address Table a single port value can be assigned multiple MAC Addresses so in a Multi-Switch Setup we would see tables as follows using the same switch actions as previous

![[Pasted image 20240221164159.png]]
### How VLANs Work

VLANs operate at Layer 2 (Data Link layer) of the OSI model. They work by tagging network traffic with a VLAN identifier (VLAN ID) that indicates the virtual network to which the traffic belongs. When a packet is sent from a device in one VLAN to a device in another, the network infrastructure—such as switches and routers—uses this tag to determine how to forward the packet.

### Key Features and Benefits of VLANs

- **Segmentation**: By dividing a network into smaller, isolated segments, VLANs reduce broadcast traffic. Devices in one VLAN do not see traffic for devices in another VLAN, unless explicitly permitted by routing.
    
- **Security**: VLANs can enhance network security by isolating sensitive data and devices into separate VLANs, limiting access to resources and reducing the risk of data breaches.
    
- **Flexibility**: VLANs provide the flexibility to group devices according to logical categories (such as department, project team, or application type) rather than their physical location, making network management and reconfiguration easier.
    
- **Cost Efficiency**: VLANs can reduce the need for expensive network upgrades or additional hardware by making more efficient use of existing infrastructure.
    

### VLAN Tagging

VLAN tagging is crucial for the operation of VLANs. There are two main methods:

- **IEEE 802.1Q (Dot1Q)**: The most common VLAN tagging method. It inserts a VLAN tag into the Ethernet frame header, specifying the VLAN ID.
    
- **ISL (Inter-Switch Link)**: A Cisco proprietary VLAN tagging protocol that encapsulates the entire frame, adding a VLAN identifier. ISL is less commonly used today compared to 802.1Q.
    

### Types of VLAN Ports on a Switch

- **Access Ports**: Connect to devices with network adapters that do not understand VLAN tags (like computers or printers). Access ports remove VLAN tags from incoming packets and forward them to only one VLAN.
    
- **Trunk Ports**: Used to connect switches to each other and support traffic from multiple VLANs. Trunk ports can carry traffic for multiple VLANs simultaneously using tagging to distinguish between them.
    

## Inter VLAN Routing

InterVLAN routing, also known as VLAN routing, is the process of forwarding network traffic from one VLAN to another using a router or a layer 3 switch. This process is essential for communication between devices on different VLANs, as by default, VLANs are isolated from each other to segment network traffic and enhance security.

### Traditional InterVLAN Routing

In traditional InterVLAN routing, an external router is used. Each VLAN is connected to a physical port on the router, requiring separate interfaces for each VLAN. The router uses these interfaces to route traffic between VLANs based on its routing table.

**Steps**:

1. **VLAN Configuration**: VLANs are configured on the switches, and each VLAN is assigned to specific switch ports.
2. **Physical Connection**: Each VLAN is connected to a different interface on the router.
3. **Routing**: The router is configured with routes that allow traffic to move between the VLANs. When a device in one VLAN needs to communicate with a device in another VLAN, the traffic is sent to the router. The router then forwards the traffic to the appropriate VLAN.

### Router-on-a-Stick

Router-on-a-stick is a type of InterVLAN routing that uses a single interface on the router to manage traffic between multiple VLANs. This is achieved using subinterfaces and VLAN tagging (IEEE 802.1Q).

**Steps**:

1. **Trunk Connection**: A trunk link is established between the switch and the router. This trunk carries traffic for multiple VLANs.
2. **Subinterfaces Configuration**: On the router, a single physical interface is configured with multiple virtual subinterfaces, each corresponding to a VLAN.
3. **VLAN Tagging**: VLAN tags are used to distinguish traffic from different VLANs over the trunk link.
4. **Routing Between Subinterfaces**: The router uses these subinterfaces to route traffic between VLANs, removing the need for multiple physical router interfaces.

### Layer 3 Switches

Layer 3 switches can perform InterVLAN routing internally without the need for external routers. These switches have routing capabilities in addition to traditional layer 2 switching functionalities.

**Steps**:

1. **VLAN Configuration**: VLANs are configured on the layer 3 switch.
2. **Virtual Interface (SVI) Configuration**: For each VLAN, a virtual interface (Switch Virtual Interface - SVI) is created on the switch. The SVI acts as the default gateway for the VLAN's devices.
3. **InterVLAN Routing**: The layer 3 switch uses its internal routing capabilities to route traffic between the SVIs and, therefore, between VLANs.

### Advantages of InterVLAN Routing

- **Efficiency**: Reduces the need for physically separate networks and simplifies network design.
- **Flexibility**: Allows for better control over network traffic, enabling policies for security, load balancing, and more.
- **Scalability**: Facilitates network expansion and reorganization without major infrastructure changes.

## Trunking 

Trunking, in the context of networking, is a method used to facilitate the transmission of traffic from multiple VLANs (Virtual Local Area Networks) across a single physical link between switches or between a switch and a router. Trunking allows for the efficient use of network infrastructure by eliminating the need for separate physical connections for each VLAN, thereby reducing hardware costs and simplifying network design.

### Key Concepts of Trunking

- **Tagging**: To distinguish between traffic from different VLANs on a trunk link, frames are "tagged" with a VLAN identifier (VLAN ID) as they enter the trunk. This tag is used to identify which VLAN the frame belongs to at the receiving end. The most common tagging protocols are IEEE 802.1Q (Dot1Q) and, historically, Inter-Switch Link (ISL), which is Cisco proprietary and less commonly used today.
- **Native VLAN**: On an 802.1Q trunk, one VLAN can be designated as the "native VLAN." Traffic from this VLAN is sent over the trunk without a VLAN tag. It’s important for both ends of the trunk link to agree on the native VLAN ID to avoid misdirected traffic.
- **DTP (Dynamic Trunking Protocol)**: A Cisco proprietary protocol that enables switches to negotiate trunking automatically on a link-by-link basis. While convenient, DTP may not be supported on non-Cisco switches, and for security reasons, manual trunk configuration is often preferred.

### How Trunking Works

1. **Configuration**: Trunk ports are configured on both ends of the physical link connecting the switches or the switch and router. This setup designates the link as capable of carrying traffic for multiple VLANs.
2. **Traffic Tagging**: When a frame destined for another switch or network device enters the trunk port, the switch tags the frame with the appropriate VLAN ID (unless it's from the native VLAN).
3. **Transmission**: The tagged frames are transmitted over the trunk link.
4. **Receiving and Forwarding**: The receiving switch reads the tag to determine the frame's VLAN membership and forwards the frame to the appropriate port(s) belonging to that VLAN.

### Benefits of Trunking

- **Cost-Effective Network Design**: Reduces the need for multiple physical links by allowing a single link to carry traffic for multiple VLANs.
- **Simplified Network Management**: Facilitates easier management and configuration of network switches and VLANs by consolidating traffic.
- **Improved Bandwidth Utilization**: Makes better use of available bandwidth by consolidating traffic, which can lead to improved performance for network applications.
- **Scalability**: Makes it easier to add new VLANs and extend the network without significant changes to the physical infrastructure.

# Switch Port Protection

Switch port protection mechanisms are crucial in maintaining the stability, security, and performance of a network. Cisco switches offer several features to protect against various types of attacks and misconfigurations. Here's an overview of Root Guard, BPDU Guard, and DHCP Snooping:

### Root Guard

**Purpose**: Root Guard is used to prevent external switches from becoming the root bridge in a Spanning Tree Protocol (STP) topology. It ensures the designated root bridge remains the root bridge, maintaining the intended hierarchical structure of the STP topology.

**How It Works**: Root Guard is applied on a per-port basis. When Root Guard is enabled on a port, that port will not become the root port. If a BPDU (Bridge Protocol Data Unit) is received on that port from a switch advertising a better bridge priority (indicating it could become the new root bridge), Root Guard puts the port into a root-inconsistent STP state. The port remains in this state, effectively blocking all traffic, until BPDUs cease or until BPDUs from the legitimate root bridge are received again.

**Example Scenario**: Root Guard is useful in enterprise networks where the network topology is carefully designed, and the root bridge's location is strategically chosen for optimal performance. Applying Root Guard on ports connected to access switches can prevent these switches from unintentionally becoming the root bridge due to misconfiguration or malicious intent.

### BPDU Guard

**Purpose**: BPDU Guard protects the network from potential loops by shutting down STP PortFast-enabled ports that receive BPDUs. PortFast is typically enabled on ports connected to end devices (like computers or printers) where BPDUs are not expected.

**How It Works**: When BPDU Guard is enabled on a PortFast port, and the port receives a BPDU, the guard immediately puts the port into an error-disabled state, effectively shutting it down. This action prevents the potential for accidental or malicious STP topology changes that could result in network loops.

**Example Scenario**: BPDU Guard is particularly useful on access layer ports in an office environment where users might inadvertently connect a switch to the network, causing unexpected STP recalculations or loops.

### DHCP Snooping

**Purpose**: DHCP Snooping is a security feature that acts as a firewall between untrusted hosts and trusted DHCP servers. It protects against DHCP-based attacks, such as rogue DHCP server attacks, where an attacker attempts to distribute incorrect IP address information to clients.

**How It Works**: DHCP Snooping differentiates between trusted and untrusted ports. Trusted ports are typically those connected to legitimate DHCP servers, while all other ports are considered untrusted. DHCP Snooping inspects DHCP messages received on untrusted ports, filtering out responses from unauthorized DHCP servers. It also builds a DHCP snooping binding table, which tracks the MAC address, IP address, lease time, binding type, and interface information for each client, ensuring that only valid DHCP replies are forwarded to clients.

**Example Scenario**: DHCP Snooping is valuable in environments with high client mobility or where there is a risk of unauthorized devices attempting to act as DHCP servers, such as in public Wi-Fi networks or large enterprise LANs.

# Port Bonding

Port bonding, also known as link aggregation, NIC (Network Interface Card) teaming, or EtherChannel (Cisco terminology), is a method used to combine multiple network connections in parallel to increase throughput beyond what a single connection could sustain, and to provide redundancy in case one of the links fails. This technique allows for the aggregation of several physical network links into a single logical link between two network devices, such as switches, routers, or between a switch and a server.

### Key Features of Port Bonding

- **Increased Bandwidth**: By combining multiple network interfaces, port bonding can significantly increase the bandwidth available for network traffic. For example, aggregating four 1Gbps links can theoretically provide up to 4Gbps of throughput.
- **Failover and Redundancy**: Port bonding provides redundancy for network connections. If one link in the bonded group fails, traffic can automatically be rerouted over the remaining links, maintaining the network connection and minimizing downtime.
- **Load Balancing**: Traffic can be distributed across the aggregated links, optimizing the utilization of each link based on various algorithms, such as source and destination MAC addresses, IP addresses, or port numbers. This helps in balancing the load and avoiding congestion on a single link.

### How Port Bonding Works

1. **Configuration**: Both ends of the link (e.g., a switch and a server) must be configured to recognize the multiple physical interfaces as part of a single logical connection. This involves specifying which ports are included in the bonded group.
    
2. **Link Aggregation Control Protocol (LACP)**: Often, LACP (part of the IEEE 802.3ad standard) is used as a dynamic method of configuring and maintaining the aggregated links. LACP allows devices to negotiate the automatic bundling of links by exchanging packets to form a LACP group.
    
3. **Distribution and Collection**: The system distributes outgoing traffic among the available links in the bonded group based on a defined algorithm. Incoming traffic is collected across the links in the group and directed to the upper-layer protocol.
    

### Requirements and Considerations

- **Compatibility**: Both ends of the links must support port bonding and be configured correctly for the aggregation to function.
- **Switch Configuration**: When configuring port bonding between a server and a switch or between two switches, the switch ports involved must be configured to form an aggregated link, either statically or dynamically using LACP.
- **Same Speed and Duplex Settings**: All links in the bonded group typically need to operate at the same speed and duplex settings to ensure proper operation.

# Port Mirroring

Port mirroring, also known as SPAN (Switched Port Analyzer) in Cisco terminology, is a network monitoring technique used on a switch or router. It involves copying the traffic from one or more network ports (or an entire VLAN) and sending the copied traffic to another port on the switch that has been designated as the mirror port. This technique allows network administrators to analyze and debug the network traffic using a network analyzer or monitoring device connected to the mirror port without interrupting the flow of traffic on the source ports.

### Key Features of Port Mirroring

- **Non-Intrusive Monitoring**: Port mirroring allows for the monitoring of network traffic in real time without affecting the network's performance or operations, as the actual traffic is not altered or slowed down.
- **Traffic Analysis**: Administrators can use port mirroring to troubleshoot network issues, monitor compliance with network policies, detect network intrusions, or gather data for performance analysis.
- **Flexibility**: It can be configured to mirror ingress traffic (incoming), egress traffic (outgoing), or both from the source ports to the destination port.

### How Port Mirroring Works

1. **Configuration**: The network administrator configures port mirroring on the switch or router, specifying the source ports (or VLAN) whose traffic should be mirrored and the destination port where the copied traffic will be sent.
2. **Traffic Copying**: The switch or router copies the packets passing through the source ports, creating an exact replica of the traffic without modifying the original packets.
3. **Forwarding**: The copied traffic is forwarded to the designated mirror port, where it can be connected to a network analyzer, intrusion detection system, or any other monitoring tool for analysis.

### Types of Port Mirroring

- **Local Port Mirroring**: Both the source and destination ports are on the same switch, allowing for the monitoring of traffic within the same device.
- **Remote Port Mirroring (RSPAN)**: The source and destination ports are on different switches, which requires the mirrored traffic to be sent across the network to the monitoring device. This is useful for centralized monitoring of multiple switches.
- **Encapsulated Remote Mirroring (ERSPAN)**: Similar to RSPAN but supports encapsulation of mirrored traffic, allowing it to be sent across Layer 3 networks. This enables remote monitoring across different segments of a network or between geographically dispersed locations.

# IDS vs IPS

Intrusion Detection Systems (IDS) and Intrusion Prevention Systems (IPS) are critical components of network security infrastructure, designed to detect and respond to malicious activities and threats within a network. While they share the common goal of identifying potential security incidents, their capabilities, and the manner in which they operate, differ significantly.

### Intrusion Detection Systems (IDS)

**Purpose**: IDS are designed to passively monitor network traffic and system activities for suspicious actions and security policy violations. Their primary function is to detect potential threats and alert network administrators or security personnel.

**How It Works**:

- **Network-based IDS (NIDS)** monitors network traffic for all devices on a network.
- **Host-based IDS (HIDS)** monitors and analyzes the internals of a computing system, or network packets targeting it.

**Key Features**:

- **Detection and Alerting**: IDS identifies known threats and abnormal behavior based on signatures, heuristics, or anomalies and generates alerts for further investigation.
- **Passive Operation**: Operates in a passive mode, meaning it does not take action to block or prevent the threat it detects.

**Use Cases**: Ideal for monitoring and alerting purposes where prevention is not immediately required or in environments where it's critical to minimize disruptions to legitimate traffic.

### Intrusion Prevention Systems (IPS)

**Purpose**: IPS extends the capabilities of IDS by not only detecting threats but also taking preventive action to block or mitigate them automatically, often in real-time.

**How It Works**:

- **Network-based IPS (NIPS)** is placed inline with the network traffic flow and can actively block or take specific actions against detected threats.
- **Host-based IPS (HIPS)** operates on individual hosts and can prevent malicious activities by configuring rules and policies.

**Key Features**:

- **Active Prevention**: IPS can automatically take actions such as blocking traffic, dropping packets, or closing connections to prevent attacks.
- **Inline Deployment**: To block malicious activities, IPS devices are typically deployed inline, meaning traffic passes through the IPS for inspection and action.

**Use Cases**: Suited for environments where security is paramount, and the organization is willing to accept the risk of potential false positives leading to the blocking of legitimate traffic.

### Comparison

- **Positioning and Deployment**: IDS are deployed out-of-band and are designed for detection and alerting, while IPS are deployed inline and can actively block or mitigate threats.
- **Action vs. Alert**: The fundamental difference lies in their response to threats. IDS alerts administrators to potential threats, requiring manual intervention, whereas IPS takes automated pre-defined actions to prevent or mitigate the threats.
- **Risk of False Positives**: IPS carries a higher risk of false positives affecting legitimate traffic because of its active blocking capabilities. Careful tuning and configuration are essential to minimize this risk.

# Proxy Servers

A proxy server acts as an intermediary between a client (such as a web browser) and the internet. It receives requests from clients, forwards those requests to the target server (for example, a website), and then returns the server's response back to the client. Proxy servers provide various functionalities, security, and privacy benefits depending on their configuration and intended use.

### Key Functions of Proxy Servers

- **Anonymity and Privacy**: By hiding the client's IP address and using its own instead, a proxy server can increase user privacy and help protect users from network surveillance or web tracking.
- **Content Filtering**: Proxy servers can be configured to block access to certain websites or content based on organizational policies, enhancing security and compliance.
- **Caching**: Some proxies cache frequently accessed web resources, reducing bandwidth usage and improving access speed for users by serving content from the cache rather than retrieving it from the internet each time.
- **Access Control**: Proxies can enforce access control policies, restricting what resources users within a network can access.
- **Load Balancing**: By distributing incoming requests across multiple servers, proxy servers can help balance load, ensuring no single server becomes overwhelmed, which improves the overall performance of web services.

### Types of Proxy Servers

- **Forward Proxy**: Positioned between the client and the internet, forward proxies are typically used within private networks to monitor and regulate internet traffic going out to the internet.
- **Reverse Proxy**: Positioned in front of web servers and forwards requests from the internet to those servers. Reverse proxies are used for load balancing, web acceleration, and as an additional security layer.
- **Transparent Proxy**: Transparently intercepts all network traffic between clients and the internet without requiring any client configuration, often used for content filtering and caching.
- **Anonymous Proxy**: Specifically designed to anonymize the client's web browsing sessions, making it difficult for websites to track the user's information.
- **SOCKS Proxy**: A more generic proxy protocol that can handle any type of internet traffic, making it useful for scenarios not limited to web browsing, such as streaming or using P2P applications.

### How Proxy Servers Work

1. **Request Forwarding**: When a client makes a request (e.g., accesses a website), the request is sent to the proxy server first.
2. **Processing Request**: The proxy server can process the request in several ways—by modifying it, blocking it based on filtering rules, or retrieving the requested content from its cache.
3. **Communicating with the Target Server**: If the content is not cached or needs to be updated, the proxy forwards the request to the target server on the internet.
4. **Response Handling**: The proxy server receives the response from the target server, may cache it for future requests, and then passes the response back to the original client.




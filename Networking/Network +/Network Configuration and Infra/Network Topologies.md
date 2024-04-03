
### 1. **Bus Topology**

In a bus topology, all devices are connected to a single central cable, called the bus or backbone. Data is transmitted in both directions from any device and can be received by all others, but only one device can transmit at a time. Terminators are used at both ends of the bus to prevent signal reflection. Bus topology is easy to set up and extend but can become problematic as the network grows or if the bus fails.

![[Pasted image 20240226201629.png]]
### 2. **Ring Topology**

Ring topology connects each device to two other devices, forming a circular data path. Data travels in one direction (clockwise or counterclockwise), passing through each device until it reaches its destination. This topology can manage high amounts of traffic due to the unidirectional flow of data. However, if one device or connection fails, the entire network can be affected unless there are redundant or bypass paths.

![[Pasted image 20240226201742.png]]
### 3. **Star Topology**

In a star topology, all devices are connected to a central hub or switch. Data between devices flows through this central node. This setup simplifies network management and fault isolation—problems in a cable or device don’t affect others directly. However, the central node becomes a critical point of failure; if it fails, the entire network goes down.

![[Pasted image 20240226202008.png]]
### 4. **Star-Bus Topology**

Star-bus topology is a hybrid that combines elements of star and bus topologies. In this arrangement, devices are connected in star configurations to hubs or switches, which are then interconnected using a bus-like backbone. This topology leverages the advantages of both star (easy troubleshooting and isolation of devices) and bus (ease of network extension), offering flexibility and scalability.

![[Pasted image 20240226202235.png]]
### 5. **Mesh Topology**

Mesh topology features devices that are interconnected, with each device having one or multiple direct connections to other devices. This can be a full mesh, where every device is connected to every other device, or a partial mesh, where some devices have multiple connections but not all. Mesh networks are highly resilient, as multiple paths exist for data between any two points, enhancing redundancy and fault tolerance. However, this topology can be complex and expensive to implement due to the high number of required connections.

![[Pasted image 20240226202544.png]]

### 6. Hybrid Topology
  
A Hybrid Topology combines two or more different network topologies to form a resultant topology that inherits features, strengths, and weaknesses of the combined topologies. This approach allows for flexibility, scalability, and optimization of network performance based on specific requirements and constraints. Hybrid topologies are commonly used in large-scale networks, such as those of enterprises or campuses, where diverse connectivity needs and redundancy are important

### Examples of Hybrid Topology

1. **Star-Bus Hybrid**: Combines star and bus topologies, where individual stars are interconnected through a central bus. This setup benefits from the simplicity and manageability of star topologies, while the bus facilitates broader connectivity.
    
2. **Star-Ring Hybrid**: Integrates star and ring topologies, possibly by connecting various star networks into a larger ring configuration. This provides the manageability of star networks with the data routing efficiency of a ring.
### LAN (Local Area Network)

- **Scale and Scope**: LANs are networks confined to a small geographic area, such as a single building, office, or home. They are designed for short-distance communication.
- **Ownership and Management**: Typically owned, operated, and managed by a single organization or individual. The management of a LAN is under the control of its owner or a designated administrator.
- **Data Transfer Speed**: LANs offer high data transfer speeds, usually ranging from 100 Mbps to 10 Gbps, depending on the technology used (e.g., Ethernet, Wi-Fi).
- **Purpose and Use Cases**: Used for connecting computers and other devices within a limited area to share resources (like printers and file servers) and provide access to intranets or the Internet. LANs are ideal for facilitating communication and data transfer among devices in close proximity.

### WAN (Wide Area Network)

- **Scale and Scope**: WANs cover a broad geographic area, potentially spanning cities, countries, or continents. They are used to connect smaller networks, like LANs, over long distances.
- **Ownership and Management**: Often owned and operated by multiple stakeholders, including telecommunications companies and service providers. The underlying infrastructure may include leased lines, satellite links, or public networks.
- **Data Transfer Speed**: Generally slower than LANs due to the greater distances involved and the complexity of routing data across disparate networks. Speeds can vary widely based on the technology and service level agreements (SLAs).
- **Purpose and Use Cases**: WANs enable communication and data transfer over long distances, supporting business operations among geographically dispersed locations. Examples include corporate networks that connect offices worldwide and academic networks linking universities.

![[Pasted image 20240305130552.png]]
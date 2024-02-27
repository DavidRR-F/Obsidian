
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
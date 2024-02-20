## Overview

- **Hosts**: are any device which sends or receives traffic
- **IP Address**: is the identity of each host
- **Network**: what transports traffic between hosts
	- Logical grouping of hosts which require similar connectivity
	- subnetworks, subnets
- **Repeaters**: regenerate signals
- **Hubs**: simply multi-port repeaters
- **Bridges**: sit between hub-connected hosts
- **Switches** facilitate communication within a network
	- **Switching**: is the process of moving data within networks. a Switch is a device whose primary purpose is switching
- **Routers**: facilitate communication between networks
	- Gateways, Routes, Routing Table, Routing
	 - **Routing**: is the process of moving data between networks. a Router is a devices whose primary purpose is routing
- There are many other network devices and All of these devices perform some sort of Routing and/or Switching
	- Access Points
	- Firewalls
	- Load Balancers
	- Layer 3 Switches
	- IDS/IPS
	- Proxies
	- Virtual Switches 
	- Virtual Routers

# Host

**Hosts** are any device which *sends* of *retrieves* traffic. i.e. computers, laptops, phones, printers, servers, IoT devices, etc...

Hosts fall into one of two categories:
- **Clients**: The host initiating the requests
- **Servers**: The host that responds to the request

![[Pasted image 20240216160642.png]]

**Note**: The Client/Server relation is relative to a specific communication that is occurring.

![[Pasted image 20240216161237.png]]

# IP Address

An **IP Address** is the identity of each host. When sending or receiving requests, the request specifies:
- **Source IP Address**: The identity of the machine sending the request
- **Destination IP Address**: The Identity of the machine to receive the request

![[Pasted image 20240216164103.png]]

### IP Schema

An **IP Address** is a 32-bit signature broken represented as four Octets (0-255) that is then convert into a number.

![[Pasted image 20240216165044.png]]

### Hierarchically assigned

IP Addressed are assigned in a hierarchical way in a process called subnetting

![[Pasted image 20240216165604.png]]

# Network

A **Network** is what actually transports traffic between Hosts. Anytime two hosts are connected, you have a network. It is that automation of sharing data without the need for a external physical device like a USB Drive.

### Subnets

A network is just a logical grouping of hosts which require similar connectivity. These can be further divided into subgroups or subnets. The purpose of subnets is to improve network performance, security, and manageability by segmenting network traffic and allowing for more efficient routing and administration.

![[Pasted image 20240219192359.png]]


# Repeater

A **Repeater** is a device that regenerates signals. In a network the larger distance 2 devices are from each other the more signal decay they will have when communicating to each other. At a certain distance these devices signal decay will be so great that they will not be able to communicate with one another. This is were repeaters come in.

![[Pasted image 20240220084237.png]]

**Repeaters** allow you to connect devices together that span greater distances
# Hub

A **Hub** is a multiply port repeater that can handle routing network traffic to devices on the network rather than having to connect all hosts to one another (which doesn't scale).

![[Pasted image 20240220084816.png]]

When a device send out a packet the hub will duplicate that packet and send it out to the  available ports

![[Pasted image 20240220085419.png]]

# Bridge

A **Bridge** sits in between hub connected hosts. Bridges only have 2 ports, one for each set of hub connected devices.

![[Pasted image 20240220090312.png]]

Bridges learn which hosts are on each side of it to determine weather or not to block traffic from the other side of the bridge.

![[Pasted image 20240220090755.png]]
# Switch

**Switches** are a combination of Hubs and Bridges. They have multiple ports and learn which hosts are on each port

![[Pasted image 20240220092058.png]]

A **Switch** facilitates communication within a network.

![[Pasted image 20240220093055.png]]
## Router

**Routers** facilitate communication between networks. Routers provide a traffic control point (security, filtering, redirecting). Routes are then stored in the routers routing table which is a list of networks that the router knows.


![[Pasted image 20240220093647.png]]

### Default Gateway

Routers learn which networks they are attached to, known as routes, it accomplishes this by having a IP Address in every network it is connected to. This IP Address is then used as the **Default Gateway** meaning any traffic that needs to go outside of the network uses this IP

![[Pasted image 20240220094821.png]]

Routers are actually what create the Hierarchy in Networks and the entire internet

![[Pasted image 20240220100833.png]]
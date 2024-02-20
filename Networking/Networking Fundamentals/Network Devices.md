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

# Hub

# Bridge

# Switch

## Router
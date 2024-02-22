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
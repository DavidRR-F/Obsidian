## EGP vs. IGP

**EGP**: External Gateway Protocol, is a routing protocol used to connect different autonomous systems on the internet

**IGP**: Internal Gateway Protocol, a type of routing protocol used for exchanging routing table information between gateways within a autonomous system

**AS**: Autonomous System, a very large network or group of networks with a single routing policy

![[Pasted image 20240424182606.png]]

## Internal Vs. External Protocol Diagram

![[Pasted image 20240424181709.png]]


1. **RIP (Routing Information Protocol)**
    
    - **Explanation:** RIP is one of the oldest distance-vector routing protocols which employs the hop count as a routing metric. The maximum number of hops allowed for RIP is 15, making it unsuitable for larger networks.
    - **Administrative Distance:** 120

2. **OSPF (Open Shortest Path First)**
    
    - **Explanation:** OSPF is a link-state routing protocol widely used in large enterprise networks. It quickly converges and is capable of scaling efficiently to larger network architectures. OSPF calculates the shortest path using the Dijkstra algorithm.
    - **Administrative Distance:** 110


3. **EIGRP (Enhanced Interior Gateway Routing Protocol)**
    
    - **Explanation:** Developed by Cisco, EIGRP is an advanced distance-vector routing protocol that uses its own algorithm called the Diffusing Update Algorithm (DUAL) to ensure rapid convergence and loop-free operation at every instant.
    - **Administrative Distance:** 90


4. **BGP (Border Gateway Protocol)**
    
    - **Explanation:** BGP is the protocol backing the Internet. It is used for routing between autonomous systems (AS) and is crucial for Internet-wide IP routing. BGP uses path vectors as its primary routing metric.
    - **Administrative Distance:** 20 (for eBGP) and 200 (for iBGP)


5. **IS-IS (Intermediate System to Intermediate System)**
    
    - **Explanation:** Like OSPF, IS-IS is a link-state routing protocol designed to efficiently manage network traffic and topology changes within a network. It uses Dijkstra’s algorithm to compute the shortest path through the network.
    - **Administrative Distance:** 115

6. **IGRP (Interior Gateway Routing Protocol)**
    
    - **Explanation:** Developed by Cisco to overcome the limitations of RIP, IGRP is a distance-vector routing protocol designed for autonomous systems. It uses bandwidth, delay, load, and reliability as metrics.
    - **Administrative Distance:** 100
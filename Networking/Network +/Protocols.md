### TCP (Transmission Control Protocol)

TCP is a connection-oriented protocol, meaning it establishes a connection between the sender and receiver before data transmission begins. It ensures that data is delivered exactly as it is sent, without errors, in the correct order, and without duplication.

### Steps of the TCP 3-way Handshake

The TCP 3-way handshake involves three steps:

1. **SYN (Synchronize)**:
    
    - The client initiates the connection by sending a TCP segment with the SYN (synchronize) bit set to 1. This segment includes an initial sequence number (ISN), which is a random number chosen by the client to start the sequence of data segments being sent to the server.
    - This step is essentially the client saying, "I want to start a conversation, and here's my starting sequence number."

2. **SYN-ACK (Synchronize-Acknowledgment)**:
    
    - The server responds to the client's request by sending back a TCP segment with both the SYN bit and the ACK (acknowledgment) bit set to 1. The acknowledgment number is set to one more than the received sequence number. The server also chooses its own initial sequence number for the data it will send to the client.
    - This step is the server saying, "I received your request to start a conversation and agree. Here's my sequence number, and I acknowledge your sequence number."

3. **ACK (Acknowledgment)**:
    
    - The client sends a TCP segment with the ACK bit set to 1 to the server, acknowledging the receipt of the server's SYN-ACK message. The acknowledgment number is set to one more than the server's sequence number.
    - This final step completes the handshake, with the client saying, "I received your acknowledgment and am ready to proceed with data transfer."

**Key Features of TCP:**

- **Reliable Delivery**: TCP uses acknowledgments (ACKs), sequence numbers, and checksums to ensure data is delivered reliably and in order.
- **Flow Control**: TCP manages the rate of data transmission based on the network capacity and the receiver's ability to process data, preventing network congestion.
- **Error Checking and Correction**: It uses checksums to detect errors in the data. If an error is detected, the erroneous data is retransmitted.
- **Congestion Control**: TCP reduces its data transfer rate when network congestion is detected, aiming to minimize the congestion.
- **Ordered Data Transfer**: TCP sequences packets using a sequence number, ensuring that data is read in the order it was sent.

**Use Cases**: TCP is used in applications where reliable data transmission is crucial, such as web browsing (HTTP/HTTPS), email (SMTP, POP3, IMAP), and file transfers (FTP).

### UDP (User Datagram Protocol)

UDP is a connectionless protocol, which means it sends data without establishing a connection with the receiver and without any guarantee that the data will reach its destination. It is a simpler, faster protocol that does not provide the error checking and correction mechanisms that TCP does.

**Key Features of UDP:**

- **Low Overhead**: Lacks the handshake, reliability, ordering, and error correction features of TCP, making it faster and more efficient for certain purposes.
- **No Error Recovery**: UDP does not retransmit lost packets or guarantee the order of packet delivery.
- **Unicast, Multicast, and Broadcast**: Supports sending messages to single recipients (unicast), multiple recipients (multicast), or all devices on a network (broadcast).
- **Real-time Applications**: Its simplicity and speed make it suitable for real-time applications where latency is a critical factor.

**Note**: TCP and UDP work on the network layer (3) in the OSI model

### ICMP (Internet Control Message Protocol)

ICMP is a protocol used for sending diagnostic or control messages between network devices. It operates within the Internet Protocol Suite (IP), specifically used with IPv4 (for IPv6, ICMPv6 provides similar functionality). ICMP is instrumental in error reporting and operational queries in IP networks.

![[Pasted image 20240305210135.png]]

**Key Functions of ICMP:**

- **Error Reporting**: ICMP communicates issues back to the source IP address, such as when a requested service is unavailable, a router or destination host cannot be reached, or a network segment is congested.
- **Diagnostic Tools**: ICMP is used by utilities like `ping` (which sends ICMP Echo Request messages to check the reachability of a host on an IP network) and `traceroute` (which maps the route data packets take to their destination).

ICMP messages contain a type and code field that specify the purpose of the message, such as destination unreachable, time exceeded, and echo request/reply. Despite its usefulness, ICMP can also be exploited for network attacks, such as ICMP flooding (a type of Denial-of-Service attack).

### IGMP (Internet Group Management Protocol)

IGMP is used in IP networks to establish multicast group memberships. It allows a network device to report its multicast group membership to adjacent routers. Multicast is the transmission of data to multiple destinations simultaneously, using a specific IP multicast group address.

![[Pasted image 20240305210312.png]]

**Key Functions of IGMP:**

- **Multicast Group Management**: IGMP manages the membership of Internet Protocol multicast groups. It is used by IP hosts and adjacent multicast routers to establish multicast group memberships.
- **Efficiency in Multicast**: By informing routers about the interest of hosts in receiving multicast traffic, IGMP allows routers to forward multicast traffic intelligently only to networks that contain interested receivers, thereby conserving bandwidth.
- 224.xx.xx.xx - Multicast Address

**Versions of IGMP**: There are several versions of IGMP (IGMPv1, IGMPv2, and IGMPv3), with each version introducing improvements in efficiency and capabilities for managing multicast group memberships.

**Note**: ICMP and IGMP work on the internet layer (2) in the TCP/IP model
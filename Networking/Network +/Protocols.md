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

# FTP - File Transfer Protocol

FTP, or File Transfer Protocol, is a standard network protocol used to transfer files from one host to another over a TCP-based network, such as the Internet. FTP is defined by the Internet Engineering Task Force (IETF) in RFC 959 and has been used since the early days of the Internet to upload and download files.

### How FTP Works

FTP operates on a client-server model, where an FTP server hosts the files to be shared, and an FTP client is used to access and transfer files to and from the server. FTP requires users to authenticate themselves with a username and password, although anonymous FTP access is also possible where users can log in with a generic username like "anonymous" or "ftp" and their email address as the password.

FTP uses two channels for communication:

- **Command Channel (Control Connection)**: Operates on TCP port 21 by default and is used for sending commands between the client and server (such as login credentials and commands to change the directory, list files, or transfer files).
- **Data Channel (Data Connection)**: Used for the actual transfer of files. FTP can operate in two modes for data transfer:
    - **Active Mode**: The server initiates the data connection back to the client. The client listens on a random port and tells the server to connect to it.
    - **Passive Mode**: Used to solve issues encountered with firewalls and NAT on the client side blocking incoming connections. In passive mode, the client initiates both the command and data connections to the server.

### FTP Commands

FTP clients use a set of standardized commands to interact with the server. Some common commands include:

- `USER`: Specify the username for login.
- `PASS`: Specify the password for login.
- `LIST`: List files in the current directory.
- `CWD`: Change the working directory.
- `PASV`: Enter passive mode.
- `RETR`: Retrieve (download) a file.
- `STOR`: Store (upload) a file.

# SMTP - Simple Mail Transfer Protocol

Simple Mail Transfer Protocol (SMTP) is a protocol used on the Internet for sending emails from one server to another. SMTP is defined by the Internet Engineering Task Force (IETF) in RFC 821 (the original specification) and RFC 5321 (the protocol's current specification). It specifies how email messages are transmitted between mail servers, as well as the process for sending mail from a mail client to a mail server. This protocol is a part of the application layer of the TCP/IP suite.

### How SMTP Works

SMTP operates on a client-server model, where:

- **SMTP servers** act as mail carriers, receiving outgoing mail from clients and routing them to their destination. These servers can also relay mail to other SMTP servers if the destination address is not within the same domain.
- **SMTP clients**, which can be email applications or mail transfer agents, use SMTP to send mail to the server.

SMTP uses TCP as its transport protocol, defaulting to port 25, though port 587 is also commonly used for email submission by clients to servers, especially when authentication and encryption are involved.

- POP3 (Post Office Protocol v3) - port 110
- IMAP (Internet Message Access Protocol v4) - port 143
### Process of Sending an Email with SMTP

1. **Connection and Identification**: The sending server initiates a TCP connection to the receiving server's SMTP port. The servers exchange identification information using SMTP commands.
2. **Mail Transfer**: The sender issues commands to specify the sender and recipient(s) of the message, followed by the message itself. Basic commands include:
    - `MAIL FROM`: Specifies the sender's email address.
    - `RCPT TO`: Specifies the recipient's email address.
    - `DATA`: Indicates the start of the message body, which ends with a single period (`.`) on a line by itself.
3. **Session Termination**: Once the message is transferred, the session is closed with a `QUIT` command.

### SMTP and Email Delivery

- **Sending to Local Recipients**: If the recipient's domain is local, the SMTP server directly places the email in the recipient's mailbox.
- **Sending to External Recipients**: If the recipient is outside the sending server's local domain, SMTP relays the message to another SMTP server closer to the recipient's domain, possibly going through multiple relays.

### Use with Other Protocols

While SMTP handles sending and relaying email, the retrieval of emails from a server by a client uses different protocols, typically POP3 (Post Office Protocol 3) or IMAP (Internet Message Access Protocol). These protocols allow users to download messages to their local devices or manage their emails directly on the server, respectively.

### Encrypting Email (SMTPS)

**SMTP in itself does not include encryption**, so messages sent via plain SMTP can be intercepted and read. To address this, extensions and related protocols have been developed:

- **STARTTLS**: An SMTP command that initiates encryption of the connection using TLS (Transport Layer Security), protecting the data from eavesdropping. port (465 or 587).
- **SMTPS**: Refers to using SMTP over SSL/TLS for encryption, often on a dedicated port (465, 995, or 993).
- **SMTP Authentication (SMTP AUTH)**: Requires the client to authenticate with the server, helping to prevent unauthorized use of SMTP servers for sending spam.

# Telnet and SSH

### Telnet (Telecommunication Network)

- **Protocol Type**: Application layer protocol.
- **Security**: Telnet does not encrypt data, which means that all communications, including login credentials, are sent in clear text over the network. This makes it vulnerable to eavesdropping and man-in-the-middle attacks.
- **Port**: Typically uses TCP port 23.
- **Usage**: Historically used for remote command-line access and management of network devices and servers. Due to its lack of security, Telnet has largely been replaced by SSH for accessing sensitive or private systems over an unsecured network, like the Internet. However, it might still be used in controlled environments where security is not a concern, or on local networks.
- **Operation**: Establishes a virtual terminal (VTY) session, allowing users to interact with a remote device as if they were physically present at the terminal.

### SSH (Secure Shell)

- **Protocol Type**: Application layer protocol designed to provide secure remote login and other secure network services over an insecure network.
- **Security**: SSH provides robust security by encrypting the entire session, including login credentials and commands. It uses public-key cryptography for both authentication and data encryption, protecting against eavesdropping, connection hijacking, and other security threats.
- **Port**: Typically uses TCP port 22.
- **Usage**: Widely used for securely accessing and managing network devices, servers, and other systems remotely. SSH is also used for securely transferring files over the network using associated protocols like SFTP (SSH File Transfer Protocol) or SCP (Secure Copy Protocol).
- **Operation**: Like Telnet, SSH provides a command-line interface for interacting with a remote device. However, it includes mechanisms for negotiating encryption, authenticating users, and maintaining the integrity and confidentiality of the data being exchanged.

### Key Differences

- **Security**: The most significant difference is security. SSH was explicitly designed to address the security weaknesses of Telnet by providing encrypted communications.
- **Usage Context**: While SSH is universally recommended for all remote access over an insecure network due to its encryption and authentication features, Telnet might only be used in specific, secure, or legacy environments.
- **Features**: SSH supports more advanced features than Telnet, including port forwarding, which allows for secure tunneling of other protocols, and the ability to mount remote file systems securely over the network.

# NTP - Network Time Protocol


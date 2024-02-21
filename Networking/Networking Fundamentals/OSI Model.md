## Overview

OSI model divides rules of networking into 7 layers. Each layer serves a specific function. If all layers are functioning, hosts can share data.

- **Layer 1** - Physical layer - Transporting Bits
- **Layer 2** - Data Link Layer - Hop to Hop
- **Layer 3** - Network - End to End
- **Layer 4** - Transport - Service to Service
- **Layer 5-7** - Application

![[Pasted image 20240221104050.png]]
# Layer 1 - Physical

Responsible for the transmission and reception of unstructured raw data between a device and a physical transmission medium. It defines the electrical, mechanical, procedural, and functional specifications for activating, maintaining, and deactivating the physical link between devices. The goal of the physical layer is transporting bits (binary) between hosts.
### Layer 1 Technologies
- Ethernet
- Wi-Fi
- Fiber
- Coaxial
- Repeaters
- Hubs
# Layer 2 - Data Link - Hop to Hop

Provides node-to-node data transfer—a link between two directly connected nodes. It handles framing, error detection and correction, and flow control. This layer also includes MAC addressing which identifies devices on the same local network. i.e. Things that interact with layer 1 technologies that put and retrieve bits from layer 1.
### Layer 2 Technologies - Interacts with Layer 1
- NIC - Network Interface Cards / Wi-Fi Access Cards
- Switches
### Addressing Scheme - Mac Addresses
 - 48 bits, represented as 12 hex digits
	- 94:65:9C:3B:8A:E5
- Every NIC has a unique MAC address

### Hop to Hop Delivery

Often communication between hosts require multiple hops. Layer 2 handles taking data to the first mac address and delivering it to the next mac address (NIC to NIC)

![[Pasted image 20240220104442.png]]

# Layer 3 - Network - End to End Delivery

Manages device addressing, identifies the best paths for data transmission, and directs data packets from the source to the destination across multiple nodes and networks. It uses IP addressing to determine routing paths.

### Layer 3 Technologies
- Routers
- Hosts
- Anything with a IP Address

### Addressing Scheme - IP Addresses
 - 32 bits, represented as 4 octets, each 0-255
	- 10.20.20.1
- Every NIC has a unique MAC address

Layer 2 and 3 are used in data delivery while level 3 handles the final destination addressing of the data (IP to IP) level 2 handles the steps in between (Route to Route)

![[Pasted image 20240220110551.png]]

## ARP - Address Resolution Protocol
ARP links a Layer 3 address to a Layer 2 address

# Layer 4 - Transport - Service to Service

Distinguishes data streams and error recovery. It ensures complete data transfer through segmentation, transfer, and reassembly of data, and manages flow control and error checking. Layer 4 ensures that incoming packets are delivered to the correct services on the host

![[Pasted image 20240220161550.png]]
### Addressing Scheme - Ports
- 0-65535 - TCP - favors reliability
- 0-65535 - UDP - favors efficiency

![[Pasted image 20240220162506.png]]

### Service to Service
- **Servers** - listen for requests to a pre-defined ports
- **Clients** -  select a random port for each connection for both sending and receiving packets of a given connection

![[Pasted image 20240220163422.png]]

# Layer 5, 6, 7 - Session, Presentation, Application

The Application Layer is the topmost layer in both the Open Systems Interconnection (OSI) model and the Internet protocol suite, commonly known as the TCP/IP model. It provides the interface between the applications on a computer and the network. The Application Layer enables users and applications to interact with the network services to perform tasks such as file transfers, web browsing, email, and more. This layer deals with high-level protocols, issues of representation, encoding, and dialog control.

- **Communication with the Network:** It allows user applications to access network services and resources. The layer translates user requests into a format that can be understood by the lower layers of the network protocol stack for transmission across the network.
    
- **Data Exchange Formats:** It is responsible for ensuring that data is presented in a usable format. This includes data encoding, encryption, and compression to facilitate data transfer efficiency and security.
    
- **Session Management:** The Application Layer can initiate, manage, and terminate sessions between applications. This includes establishing a connection for data transfer and ensuring that data is delivered in sequence and without loss or duplication.
    
- **Application Services:** It provides a variety of network services directly to end-users or applications. These services include file transfer (FTP), web browsing (HTTP), email (SMTP, POP3, IMAP), remote login (SSH, Telnet), and many others.

![[Pasted image 20240220165613.png]]

### Encapsulation Process

Encapsulation refers to the method by which data from an upper layer or application is wrapped by protocol information of the current layer, as it descends through the layers of the OSI model or the TCP/IP stack before being transmitted over the network. Each layer adds its own header (and sometimes a footer) to the data, which contains control information relevant to the layer's protocol, to ensure proper delivery and management of the data.

1. **Application Layer:** The process begins with the creation of data at the application layer (Layer 7 in OSI, Application in TCP/IP). This could be an email message, a web page request, or any other type of data.
    
2. **Transport Layer:** The data is handed down to the transport layer (Layer 4 in OSI, Transport in TCP/IP), where it is segmented into smaller pieces if necessary and a transport layer header is added. This header includes source and destination port numbers, and, depending on the protocol (TCP or UDP), may also include sequence and acknowledgment numbers, as well as flow and congestion control information.
    
3. **Network Layer:** Next, the transport layer segments (now encapsulated with a transport layer header) are passed to the network layer (Layer 3 in OSI, Internet in TCP/IP). Here, an IP header is added, including source and destination IP addresses, ensuring that the data can be routed across the network.
    
4. **Data Link Layer:** The network layer packet is then encapsulated with a data link layer header (and possibly a footer) at Layer 2 in the OSI model (corresponding to the Link layer in TCP/IP). This header contains physical addresses (MAC addresses), and possibly error checking information (CRC).
    
5. **Physical Layer:** Finally, the encapsulated data is converted into electrical, radio, or optical signals by the physical layer (Layer 1 in OSI and TCP/IP) and transmitted over the physical medium (e.g., Ethernet cable, WiFi).
    

### De-encapsulation Process

De-encapsulation is the reverse process of encapsulation and occurs at the receiving end. As the data ascends through the layers from the physical medium to the application, each layer removes its corresponding header (and footer if applicable) added during encapsulation, interpreting the control information to perform necessary actions before passing the data up to the next layer.

1. **Physical Layer:** Signals received from the physical medium are converted back into digital data.
    
2. **Data Link Layer:** The data link layer header (and footer) are removed, and MAC addresses are used to confirm the data has reached the correct device. Error checking may also occur here.
    
3. **Network Layer:** The network layer removes its header, using the IP addresses to ensure the data is being delivered to the correct application on the destination device.
    
4. **Transport Layer:** The transport layer header is removed, and the data is reassembled from its segments if necessary. Port numbers are used to direct the data to the correct application process.
    
5. **Application Layer:** Finally, the data reaches the application layer, where it is presented to the application in a usable format.
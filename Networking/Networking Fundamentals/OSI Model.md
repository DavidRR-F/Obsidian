## Overview

OSI model divides rules of networking into 7 layers. Each layer serves a specific function. If all layers are functioning, hosts can share data.

- **Layer 1** - Physical layer - Transporting Bits
- **Layer 2** - Data Link Layer - Hop to Hop
- **Layer 3** - Network - End to End
- **Layer 4** - Transport - Service to Service
- **Layer 5-7** - Application

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

Distinction between these layers is somewhat vague

### Sending Encapsulation

- Data from a application is sent to layer 4 
- Segment - Adds a TCP/UDP Protocol header to data

### Receiving De-Encapsulation


![[Pasted image 20240220165613.png]]
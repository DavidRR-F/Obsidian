---
id: Final Review
aliases: []
tags: []
---

- [x] DNS Record Types/Steps
- [x] DHCP Steps
- [x] 802.11 memorize
- [x] 802.1 memorize
- [x] 802.3 memorize
- [x] Dynamic Routing Protocols AD/Types
- [x] STP States Blocking Listening Learning Forwarding
- [x] OC, T, E line memorize Mbps
- [x] Wireless Overview

### NAT Addresses

Inside global: Name of inside host after address translation
Inside local: Name of the inside source address before translation
outside local: name of the destination host before translation
outside global: name of the outside destination host after translation

### Wireless

#### Security

- **WEP**:
    - Encryption: RC4
    - Status: Deprecated due to significant security vulnerabilities.
- **WPA**:
    - Encryption: TKIP (which uses RC4)
    - Status: Improved over WEP but has known vulnerabilities; largely replaced by WPA2.
- **WPA2**:
    - Encryption: AES with CCMP
    - Status: The standard for wireless security, providing robust protection; gradually being complemented by WPA3.

#### Modulation
##### OFDM (Orthogonal Frequency-Division Multiplexing)
OFDM is a digital modulation technique used primarily in wireless communications, including Wi-Fi, LTE, and digital broadcasting.

##### OFDMA (Orthogonal Frequency-Division Multiple Access)
OFDMA is a multiple access technique that extends OFDM to allow multiple users to share the same frequency band simultaneously.

##### DSSS (Direct Sequence Spread Spectrum)
DSSS is a spread spectrum modulation technique used to spread a signal over a wider bandwidth.

### Lines

#### OC (Optical Carrier) Lines

OC lines are used in optical fiber networks and are based on the Synchronous Optical Networking (SONET) standard in North America.

| OC Level | Data Rate    | Electrical Equivalent |
| -------- | ------------ | --------------------- |
| OC-1     | 51.84 Mbps   | STS-1                 |
| OC-3     | 155.52 Mbps  | STS-3                 |
| OC-12    | 622.08 Mbps  | STS-12                |
| OC-24    | 1.244 Gbps   | STS-24                |
| OC-48    | 2.488 Gbps   | STS-48                |
| OC-192   | 9.953 Gbps   | STS-192               |
| OC-768   | 39.813 Gbps  | STS-768               |
| OC-3072  | 159.252 Gbps | STS-3072              |
#### T (Twisted Pair) Lines

T-carrier lines are used in North America for digital transmission over twisted-pair copper cables.

| T Level | Data Rate    | Number of Voice Channels |
| ------- | ------------ | ------------------------ |
| T1      | 1.544 Mbps   | 24 DS0 channels          |
| T2      | 6.312 Mbps   | 96 DS0 channels          |
| T3      | 44.736 Mbps  | 672 DS0 channels         |
| T4      | 274.176 Mbps | 4032 DS0 channels        |

#### E (European) Lines

E-carrier lines are used in Europe and internationally for digital transmission over copper and other media.

| E Level | Data Rate    | Number of Voice Channels |
| ------- | ------------ | ------------------------ |
| E1      | 2.048 Mbps   | 32 DS0 channels          |
| E2      | 8.448 Mbps   | 128 DS0 channels         |
| E3      | 34.368 Mbps  | 512 DS0 channels         |
| E4      | 139.264 Mbps | 2048 DS0 channels        |
| E5      | 565.148 Mbps | 8192 DS0 channels        |

### 802.1
#Q 
What is 802.1Q?
***
Defines standard for single vlan tagging on ethernet frames

#Q 
What is 802.1d?
***
Defines Mac Bridging and STP, how data frames are forwarded between network segments

#Q
What is 802.1af?
***
Provides a framework for distributing and managing crpyt-keys for secure communication

#Q 
What is 802.1ad?
Extends vlan tagging to support multiple layers of tags (double tagging)

#Q 
What is 802.1ax?
***
Link Aggregation, Specifies protocols for combining multiple physical ports (LACP)

#Q 
What is 802.1x?
Provides mechanism for authenticating devices that connect to a LAN or WLAN (EAP)

#Q 
What is 802.1i?
***
Defines priority levels of traffic, enabling QoS
### 802.3

#Q 
What is 802.3af?
***
PoE, 15.4W over Cat5

#Q 
What is 802.3at?
***
PoE+, 25.5W over Cat5

#Q 
In the 802.3 IEEE Ethernet Standard What does 10BASE mean?
***
10 Mbps

#Q 
In the 802.3 IEEE Ethernet Standard What does 100BASE mean?
***
100 Mbps

#Q 
In the 802.3 IEEE Ethernet Standard What does 1000BASE mean?
***
1 Gbps

#Q 
In the 802.3 IEEE Ethernet Standard What does 10GBASE mean?
***
10 Gbps

#Q 
In the 802.3 IEEE Ethernet Standard What does `-T` mean?
***
Twisted Cable Pair Cabling

#Q 
In the 802.3 IEEE Ethernet Standard What does `-X` or `-F` mean?
***
Fiber Optic Cabling

#Q 
In the 802.3ae IEEE Ethernet Standard What does `10GBASE-SR` mean?
***
Short Range:
- **Media**: Multimode fiber (MMF)
- **Distance**: Up to 300 meters on OM3 fiber and up to 400 meters on OM4 fiber
- **Wavelength**: 850 nm
- **Application**: Primarily used for short-distance communication within data centers and local area networks (LANs)

#Q 
In the 802.3ae IEEE Ethernet Standard What does `10GBASE-LR` mean?
***
Long Range:
- **Media**: Single-mode fiber (SMF)
- **Distance**: Up to 10 kilometers
- **Wavelength**: 1310 nm
- **Application**: Designed for longer distance communication such as campus backbones and metropolitan area networks (MANs)

#Q 
In the 802.3ae IEEE Ethernet Standard What does `10GBASE-ER` mean?
***
Extended Range:
- **Media**: Single-mode fiber (SMF)
- **Distance**: Up to 40 kilometers
- **Wavelength**: 1550 nm
- **Application**: Used for very long-distance communication, typically in wide area networks (WANs)

#Q 
In the 802.3ae IEEE Ethernet Standard What does `10GBASE-SW` mean?
***
Short Range for WAN:
- **Media**: Multimode fiber (MMF)
- **Distance**: Similar to 10GBASE-SR (up to 300 meters on OM3 fiber)
- **Wavelength**: 850 nm
- **Application**: Designed to work with SONET/SDH equipment for WAN applications, operates over MMF

#Q 
In the 802.3ae IEEE Ethernet Standard What does `10GBASE-LW` mean?
***
Long Range for WAN:
- **Media**: Single-mode fiber (SMF)
- **Distance**: Up to 10 kilometers
- **Wavelength**: 1310 nm
- **Application**: Designed to work with SONET/SDH equipment for WAN applications, operates over SMF

#Q 
In the 802.3ae IEEE Ethernet Standard What does `10GBASE-LW` mean?
***
Extended Range for WAN:
- **Media**: Single-mode fiber (SMF)
- **Distance**: Up to 40 kilometers
- **Wavelength**: 1550 nm
- **Application**: Designed to work with SONET/SDH equipment for WAN applications, operates over SMF

#Q 
In the 802.3 IEEE Ethernet Standard What does `100BASE-T` mean?
***
- **Media**: Twisted pair cabling (Category 5)
- **Distance**: Up to 100 meters
- **Connector**: RJ45
- **Description**: Generic term often used to refer to both 100BASE-TX and 100BASE-T4. Not a specific standard by itself.

#Q 
In the 802.3 IEEE Ethernet Standard What does `100BASE-TX` mean?
***
- **Media**: Twisted pair cabling, typically Cat 5 or better (Cat 5e, Cat 6)
- **Distance**: Up to 100 meters
- **Connector**: RJ45
- **Signaling**: Uses two pairs of wires (one pair for transmitting and one pair for receiving)
- **Description**: The most commonly used Fast Ethernet standard, utilizing two pairs of Cat 5 or higher cabling.

#Q 
In the 802.3 IEEE Ethernet Standard What does `100BASE-T4` mean?
***
- **Media**: Twisted pair cabling, specifically Cat 3 or better
- **Distance**: Up to 100 meters
- **Connector**: RJ45
- **Signaling**: Uses four pairs of wires (three pairs for transmitting and receiving and one pair for collision detection)
- **Description**: Designed to allow Fast Ethernet over lower-quality Cat 3 cabling, but it is rarely used in practice due to the widespread adoption of Cat 5 and higher cabling, which supports 100BASE-TX.

#Q 
In the 802.3 IEEE Ethernet Standard What does `100BASE-T2` mean?
***
- **Media**: Twisted pair cabling, Cat 3 or better
- **Distance**: Up to 100 meters
- **Connector**: RJ45
- **Signaling**: Uses two pairs of wires with advanced signal processing techniques to achieve 100 Mbps
- **Description**: Allows 100 Mbps Ethernet over Cat 3 cabling with two pairs. Not widely adopted due to complexity and preference for Cat 5 cabling.

#Q 
In the 802.3 IEEE Ethernet Standard What does `1000BASE-CX` mean?
***
- **Media**: Copper (shielded balanced copper cabling)
- **Distance**: Up to 25 meters
- **Connector**: HSSDC (High-Speed Serial Data Connector)
- **Description**: Used for short-distance connections within equipment racks.

#Q 
In the 802.3 IEEE Ethernet Standard What does `1000BASE-SX` mean?
***
- **Media**: Multimode fiber (MMF)
- **Distance**: Typically up to 550 meters (depends on the type of MMF)
- **Connector**: Various (commonly SC, LC)
- **Wavelength**: 850 nm
- **Description**: Commonly used for short-range fiber optic connections within buildings.

#Q 
In the 802.3 IEEE Ethernet Standard What does `1000BASE-SX` mean?
***
- **Media**: Single-mode fiber (SMF) and Multimode fiber (MMF)
- **Distance**: Up to 10 kilometers on SMF, shorter distances on MMF (up to 550 meters with mode conditioning patch cable)
- **Connector**: Various (commonly SC, LC)
- **Wavelength**: 1310 nm
- **Description**: Used for longer-distance fiber optic connections, suitable for campus backbones.

### 802.11

#Q 
What is 802.11a?
***
WLAN Standard:
- **Frequency**: 5 GHz band.
- **Maximum Data Rate**: 54 Mbps.
- **Modulation**: Orthogonal Frequency Division Multiplexing (OFDM).

#Q 
What is 802.11b?
***
WLAN Standard: 
- **Frequency**: 2.4 GHz band.
- **Maximum Data Rate**: 11 Mbps.
- **Modulation**: Direct Sequence Spread Spectrum (DSSS).

#Q 
What is 802.11g?
***
WLAN Standard:
- **Frequency**: 2.4 GHz band.
- **Maximum Data Rate**: 54 Mbps.
- **Modulation**: OFDM.

#Q 
What is 802.11n
***
WLAN Standard: Wi-Fi 4
- **Frequency**: 2.4 GHz and 5 GHz bands (dual-band).
- **Maximum Data Rate**: Up to 600 Mbps (with 4 spatial streams).
- **Modulation**: OFDM.

#Q 
What is 802.11ac?
***
WLAN Standard: Wi-Fi 5
- **Frequency**: 5 GHz band.
- **Maximum Data Rate**: Up to 6.93 Gbps (with 8 spatial streams).
- **Modulation**: OFDM.

#Q 
What is 802.11.ax?
***
WLAN Standard: Wi-Fi 6/6E
- **Frequency**: 2.4 GHz, 5 GHz, and 6 GHz bands (Wi-Fi 6E includes 6 GHz).
- **Maximum Data Rate**: Up to 9.6 Gbps.
- **Modulation**: OFDMA (Orthogonal Frequency Division Multiple Access).

#Q 
What is 802.11ad?
***
WLAN Standard: WiGig
- **Frequency**: 60 GHz band.
- **Maximum Data Rate**: Up to 7 Gbps.
- **Modulation**: OFDM.

### DHCP

![[Pasted image 20240603200426.png]]
#### Steps

- **DHCP Discover**: new device sends a broadcast to networks broadcast address (0.0.0.0:udp port 68 -> 255.255.255.255:udp port 67) to find the DHCP Server(s)
- **DHCP Offer**: the dhcp server sends an offer message from its IP to the broadcast address (<ip_address>:udp port 67 -> 255.255.255.255:udp port 68) with a IP configuration that the new device can use
- **DHCP Request**: the new device sends a request (0.0.0.0:udp port 68 -> 255.255.255.255:udp port 67) to confirm the use of the IP configuration
- **DHCP Acknowledgement**: the DHCP server sends a acknowledgement message at which point on recieving the new device configures itself with the IP configuration

#### DHCP Relay/IP Helper

Since DHCP uses broadcasting to configure new devices on a network. It would not work if the is no DHCP server on a particular network. To solve this networks can configure a DHCP Relay to Forward Broadcast requests to a DHCP Server on a different network

#Q 
What happens on `DHCPDISCOVER`?
***
new device sends a broadcast to networks broadcast address (0.0.0.0:udp port 68 -> 255.255.255.255:udp port 67) to find the DHCP Server(s)

#Q 
What happens on `DHCPOFFER`?
***
the dhcp server sends an offer message from its IP to the broadcast address (<ip_address>:udp port 67 -> 255.255.255.255:udp port 68) with a IP configuration that the new device can use

#Q 
What happens on `DHCPREQUEST`?
***
the new device sends a request (0.0.0.0:udp port 68 -> 255.255.255.255:udp port 67) to confirm the use of the IP configuration

#Q 
What happens on `DHCPACKNOWLEDGE`?
***
the DHCP server sends a acknowledgement message at which point on recieving the new device configures itself with the IP configuration

#Q 
What is a DHCP Relay?
A Service that forwards DHCP Request Traffic between the current network and the network the DHCP Server is located
### STP - Spanning Tree Protocol (802.1D)

![[Pasted image 20240603194408.png]]
#### Ports
- Root: The Interface that is closest to the root on the network
- Designated: All Other operational ports
- Blocked: Ports disabled by STP to prevent loops

#### States 

- Blocking: Not forwarding to prevent loop 
- Listening: Not forwarding and cleaning MAC table
- Learning: Not forwarding and adding to mac table 
- Forwards: Data passes through and is fully operational
- Disabled: Administrator has turned off the port

#Q 
What is the STP Blocking State?
***
Not Forwarding traffic to prevent a loop from occurring

#Q 
What is a STP Listening State?
***
Not forwarding traffic to clean the MAC table

#Q 
What is the STP Learning State?
***
Not forwarding traffic and adding to MAC Table

#Q 
What is the STP Forwarding State?
***
Data passes through and is fully operational

#Q 
What is a Root Port in STP?
***
The Interface that is closest to the root on the network

#Q 
What is a Designated Port in STP?
***
All Other operational ports that are not a Root Port

#Q 
What is a Blocked Port in STP?
***
Ports disabled by STP to prevent loops

### DNS

#### Records
- A - Map domain to IPv4 Address
- AAAA - Map domain to IPv6 Address
- CNAME - Allowing multiple domain names to map to the same IP address
- MX - Specifies Mail server responsible for accepting email messages on behalf of the domain
- NS - Specifies the authoritative name servers for a domain
- PTR - Used for reverse DNS lookups, Mapping an IP Address back to a host name
- SOA - Specifies Authoritative Information about a DNS zone
- SRV - Identifies the hostname and port number of the servers offering specific services
- TXT - Allows admins to insert arbitrary text into a DNS record
- SPF - Specifies which email servers are permitted to email on bahalf of a domain(prevents spoofing emails)
- DKIM - Digitally sign your outgoing mail

#Q 
What is a DNS CNAME Record?
***
The "canonical" domain name, allowing multiple domain names to map to the same IP address

#Q
What is a DNS A and AAAA Record?
***
**A**: Maps domain to IPv4 Address 
**AAAA**: Maps domain to IPv6 Address 

#Q 
What is a DNS MX Record?
***
Specifies the mail servers for a domain

#Q  
What is a DNS NS Record?
*** 
Specifies which server contains the actual DNS Reocrd, i.e. tells the internat
where to go to find out a domains IP Address 

#Q 
What is a DNS PTR Record?
***
Used for reverse DNS lookups IP -> Domain 

#Q 
What is a DNS SRV Record?
***
Identifies the hostname and port number of the servers offering specific
services

#Q 
What is a DNS SPT Record?
***
Specifies which email servers are permitted to email on behalf of a domain often
using a DKIM key to validate the origin to the sender

#Q What is a DNS TXT Record?
Allows admins to add arbitrary text to a DNS entry

### Dynamic Routing Protocols

![[Pasted image 20240602141302.png]]

#Q 
What is the Routing Metric for Link State Routing Protocols?
***
Cost

#Q 
What is the Routing Metric for Distance Vector Protocols?
***
Bandwidth

#Q 
What is OSPF?
***
IGP: Link State Routing Protocol
AD: 110

#Q 
What is IS-IS?
***
IGP: Link State Routing Protocol
AD: 115

#Q 
What is RIP?
***
IDGP: Distance Vector Routing Protocol
AD: 120

#Q 
What is IGRP?
***
IGP: Distance Vector Routing Protocol
AD: 100

#Q 
What is EIGRP?
***
IGP: Hybrid Routing Protocol
AD: 170

#Q 
What is BGP?
***
EGP: Path Vector Routing Protocol
AD: 20
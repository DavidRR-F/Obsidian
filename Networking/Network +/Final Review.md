---
id: Final Review
aliases: []
tags: []
---

- [x] DNS Record Types/Steps
- [x] DHCP Steps
- [x] 802.11 memorize
- [x] 802.1 memorize
- [ ] 802.3 memorize
- [x] Dynamic Routing Protocols AD/Types
- [x] STP States Blocking Listening Learning Forwarding
- [ ] OC, T, E line memorize Mbps
- [ ] Wireless Overview

### Wireless

#### Modulation


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
Combination of hardware, software, policies, and practices that organizations use to protect information

## Ports and Protocols

### Ports

Logical communication endpoint that exists on a computer or server 

- **Inbound**: Logical communication opening on a server that is listening for a connection from a client. (Sitting and waiting for someone to connect to it) 

- **Outbound**: Logical communication opening created on a client in order to call out to a server that is listening for a connection

![[Pasted image 20240730142414.png]]

#### Port Ranges

Ports can be any number between 0-65,535 and are subdivided into groups

**Well Known Ports**: Ports 0 to 1023 are considered well-known and are assigned by the Internet Assigned Numbers Authority (IANA)
- HTTPS: 443
- Telnet: 23

**Registered Ports**: Ports 1024 to 49151 are considered registered and are usually assigned to proprietary protocols
- MSSQL: 1433
- RDP: 3389

**Dynamic and Private Ports**: Port 49152 to 65535 can be used by any application without being registered with IANA
- commonly used in gaming, instant messaging, and chat for connections were a application needs a temporary outbound port

#### Protocols
Rules governing device communication and data exchange

| Protocol       | Port #        | Support | Description                                                                                                                                               |     |
| :------------- | ------------- | ------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- | --- |
| FTP            | 21            | TCP     | Used to transfer files from host to host                                                                                                                  |     |
| SSH, SCP, SFTP | 22            | TCP     | Provides secure remote terminal access and file transfer capabilities provides secure copy functions provides secure file transfers                       |     |
| Telnet         | 23            | TCP     | Provides insecure remote control of another machine using a text-based environment                                                                        |     |
| SMTP           | 25            | TCP     | Provides the ability to send emails over the network                                                                                                      |     |
| DNS            | 53            | TCP/UDP | Translates domain names into IP addresses                                                                                                                 |     |
| TFTP           | 69            | UDP     | Used as a lightweight file transfer method for sending configuration files or network booting of an operating system                                      |     |
| HTTP           | 80            | TCP     | Used for insecure web browsing                                                                                                                            |     |
| Kerberos       | 88            | UDP     | Network authentication protocol                                                                                                                           |     |
| POP3           | 110           | TCP     | Responsible for retrieving email from a sever                                                                                                             |     |
| NNTP           | 119           | TCP     | Used for accessing newsgroups                                                                                                                             |     |
| RPC            | 135           | TCP/UDP | Facilitates communication between different system processes                                                                                              |     |
| NetBIOS        | 137, 138, 139 | TCP/UDP | Networking protocol suite                                                                                                                                 |     |
| IMAP           | 143           | TCP     | Allows access to email messages on a server                                                                                                               |     |
| SNMP           | 161           | UDP     | Manages network devices                                                                                                                                   |     |
| SNMP Trap      | 162           | UDP     | Responsible for sending SNMP trap messages                                                                                                                |     |
| LDAP           | 389           | TCP     | Facilitates directory services                                                                                                                            |     |
| HTTPS          | 443           | TCP     | Provides secure web connections                                                                                                                           |     |
| SMB            | 445           | TCP     | Used for file and printer sharing over a network                                                                                                          |     |
| SMTPS          | 465, 587      | TCP     | Provides secure SMTP communication                                                                                                                        |     |
| Syslog         | 514           | UDP     | Used for sending log messages                                                                                                                             |     |
| LDAPS          | 636           | TCP     | LDAP communication over SSL/TLS                                                                                                                           |     |
| IMAPS          | 993           | TCP     | Used for secure email retrieval                                                                                                                           |     |
| POP3S          | 995           | TCP     | Used for secure email retrieval                                                                                                                           |     |
| MSSQL          | 1433          | TCP     | Used to facilitate communication with Microsoft SQL Server                                                                                                |     |
| RADIUS TCP     | 1645, 1646    | TCP     | Used for remote authentication, authorization, and accounting                                                                                             |     |
| RADUIS UDP     | 1812, 1813    | UDP     | Used for authentication and accounting as defined by the Internet Engineering Task Force (IETF)                                                           |     |
| RDP            | 3389          | TCP     | Enables remote desktop access                                                                                                                             |     |
| Syslog TLS     | 6514          | TCP     | Used in a secure syslog that uses SSL/TLS to encrypt the IP packets using a certificate before sending them across the IP network to the syslog collector |     |

#### Port Security

Common security feature found on network switches that allows administrators to restrict which devices connect to a specific port based on the network interface card's MAC address

Port security links MAC addresses to specific network interfaces for enhanced network security. aka only allow a verified list of mac addresses access to a specific port

**Content Addressable Memory - CAM Table**: Used to store information about the MAC addresses that are available on any given port of the switch
- ***MAC Flooding***: Threat actors can flood a switch with mac addresses to overflow the CAM table which causes the switch to behave as if it was a hub
- Enabling port security or MAC filtering on switch ports prevent attacks such as mac flooding

**Persistent (Sticky) MAC Learning**: Feature in network port security where the switch automatically learns and associated MAC addresses with specific interfaces 
- ***MAC Spoofing***: Attackers can bypass this security measure by resetting their devices mac address to a known good mac address
- You can additionally implement 802.1x Authentication to prevent this attack vector

**802.1x Protocol**: Standardized framework that is used for port-based authentication foe both wired and wireless networks
- Utilizes other authentication mechanisms such as RADIUS and TACACS+
- For 802.1x to work it requires the use of 3 different roles
	- ***Supplicant***: Device or user requesting access to your network
	- ***Authenticator***: Device in which the supplicant is attempting to access the network through (Network Switch, WAP, VPN)
	- ***Authentication Service***: Centralized device that performs the authentication (RADIUS/TACACS+ server)

**EAP - Extensible Authentication Protocol***: Framework in a series of protocols that allows for numerous different ways to conduct authentication
- ***EAP-MD5***: Variant that utilizes simple passwords and the challenge handshake authentication process to provide remote access authentication (Oneway-Authentication)
- ***EAP-TLS***: Form of EAP that uses public key infrastructure with a digital certificate being installed on both the client and the server as the method of authentication (Mutual-Authentication)
- ***EAP-TTLS***: Variant that requires a digital certificate on the server, but not on the client
- ***EAP-FAST***: Variant that uses a protected access credential, instead of a certificate, to establish mutual authentication between devices
- ***PEAP***: Variant that supports mutual authentication by using server certificates and the Microsoft AD databases for it to authenticate a password from the client
- ***LEAP***: Variant of EAP that only works on Cisco-based devices




## Firewalls

Safeguards networks by monitoring and controlling traffic based on predefined security rules

**Screened Subnet**: Acts as a security barrier between external untrusted networks and internal trusted networks, using a protected host with security measures like a packet-filtering firewall

![[Pasted image 20240730152300.png]]

**Packet Filtering Firewall**: Checks packet headers for traffic allowance based on IP addresses and port numbers
- Cannot prevent certain attacks due to limited inspection capabilities in the packet header. Like IP spoofing or packet fragmentation attacks

**Stateful Firewall**: Monitors all inbound and outbound network connections and requests

**Proxy Firewall**: Acts as an intermediary between internal and external connections, making connections on behalf of other endpoints
- ***Circuit Level***: Like a SOCKS firewall, operates at the Layer 5 or the OSI model
- ***Application Level***: Conducts various proxy functions for each type of application at the Layer 7 of the OSI model

**Kernel Proxy Firewall**: Has minimal impact on network performance while thoroughly inspecting packets across all layers

**NGFW - Next Generation Firewall**: Aims to address the limitations of traditional firewalls by being more aware of applications and their behaviors

**UTM - Unified Threat Management Firewall**: Provides the ability to conduct multiple security functions in a single appliance

**WAF - Web Application Firewall**: Focuses on the inspection of the HTTP traffic
#### ACL - Access Control List

A rule set that is placed on firewalls, routers, and other network infrastructure devices that permit or allow traffic through a particular interface

- Order matters - the order in which the access controls are listed are the order in which they will be applied in a top down manner
- If traffic matches a condition the rule will be applied and no other controls with be accessed (i.e. big if else statement table)
##### Best Practice 
- Specific Rules (Top) -> Generic Rules (Bottom)
- Include a deny all rule at the end of the ACL
- Log Actions taken - Type, Source, Destination, and Action or traffic

### IDS and IPS

**NIDS/NIPS - Network IDS/IPS**: Responsible for detecting unauthorized network access or attacks. Monitoring the traffic coming in and out of the network

**HIDS/HIPS - Host IDS/IPS**: Piece of software that looks at suspicious network traffic going to or from a single server or endpoint

**WIDS/WIPS - Wireless IDS/IPS**: Detects attempts to cause a denial of service, de-authentication, and disassociation attacks on a wireless network

##### Types

**Signal-Based**: Analyzes traffic based on defined signatures and can only recognize attacks based on previously identified attacks in its database
- ***Pattern-matching***: Specific pattern of steps - NIDS, WIDS
- ***Stateful-matching***: Known system baseline - HIDS

**Anomaly/Behavioral based IDS**: Analyzes traffic and compares it to a normal baseline of traffic to determine whether a threat is occurring based on:
 - ***Statistics***
 - ***Protocols***
 - ***Traffic***
 - ***Rules/Heuristics***
 - ***Applications***

#### Architecture Placement

**NIPS**: Should be placed right behind the firewall near the border of the network

**NIDS**: Should be connected via a mirrored port off the backbone switch to passively analyze traffic

![[Pasted image 20240731154747.png]]

### Network Appliances

Dedicated hardware device with pre-installed software that is designed to provide specific networking services

**Load Balancers**: Crucial component in any high-availability network or system that is designed to distribute network or application traffic across multiple servers
- ***ADC - Application Delivery Controller***: Includes additional features such as SSL Termination, HTTP Compression, and Content Caching

**Proxy Server**: Intermediary between a client and a server to provide various functions like content caching, request filtering, and login management. Also provides obscurity crucial to shield the server from direct attacks

**Network Sensors**: Designed to monitor, detect, and analyze traffic and data flow across a network in order to identify any unusual activities, potential security breaches, or performance issues

**Jump Server/Box**: Dedicated gateway used by system administrators to securely access devices located in different security zones within the network

### Securing Network Communications

**VPN - Virtual Private Networks**: Extends a private network over a public one, enabling users to securely send and receive data
- ***Site-to-site***: Establishes secure tunnels over the public internet for interconnecting remote sites
- ***Client-to-site***: Connects individual devices directly to the organization's headquarters, enabling remote users to access the network
- ***Clientless***: Secures remote access through browser-based VPN tunnels without needing client software or hardware configuration
- ***Full Tunnel***: Maximizes security by encrypting all traffic to the headquarters while integrating clients with the network
- ***Split Tunnel***: Divides traffic and network requests and then routes them to the appropriate network

**TLS - Transport Layer Security**: A protocol that provides cryptographic security for secure connections and is used for secure web browsing and data transfer
- ***TCP - Transmission Control Protocol***: Used by TLS to establish secure connections between a client and a server, but it may slow down the connection
- ***DTLS - Datagram Transport Layer Security***: a UDP-based version of TLS protocol that offers the same security level as TLS while maintaining faster operations
	- Primarily used in things like video streaming over secure tunnel in clientless VPN connections

**IPsec - Protocol Security**: A protocol suite for secure communication through authentication and data encryption in IP networks
- ***Steps***: 
	- Request to start IKE (Internet Key Exchange)
	- IKE Phase 1 - (ISAKMP) tunnel
	- IKE Phase 2
	- Data transfer - One of 2 modes
		- *Transport Mode*: Employs the original IP header, ideal for `client-to-site` VPNs and is advantageous when dealing with MTU constraints
		- *Tunneling Mode*: Employed for `site-to-site` VPNs and adds an extra header that can increase packet size and exceed the MTU
	- Tunnel termination
- ***AH - Authentication Header***: Offers connectionless data integrity and data origin authentication for IP datagrams using cryptographic hash as identification information
- ***ESP - Encapsulating Security Payload***: Employed for providing authentication, integrity, replay protection, and data confidentiality by encrypting the packet's payload

### SD-WAN and SASE

These architectures are used for cloud based networking for modern enterprise needs

**SD-WAN - Software Define WAN**: Virtualized approach to managing and optimizing wide area network connections to efficiently route traffic between remote sites, data centers, and cloud environments
- Employs a centralized control function to securely and intelligently route traffic across the WAN
- Decouples the control mechanism from the physical WAN

![[Pasted image 20240801094901.png]]

**SASE - Secure Access Service Edge**: Used to consolidate numerous networking and security functions into a single cloud-native service to ensure that secure and seamless access for end-users can be achieved
- Uses software defined networking to provide security and networking services form the cloud rather than transitional hardware based appliances 
- Include Firewalls, VPNs, Zero-trust Network Access, and CASBs
- Ensures secure and efficient user-device connections to applications and services
- Services such as AWS VPC, Azure Virtual WAN, Google Cloud Interconnect

### Infrastructure Considerations

#### Device Placement

The location of your devices including Routers, switches, and access points can greatly influence both performance and security of the network. The configuration needs to be configured with:
- Optimized Data flow
- Minimized latency
- Robust Defense
#### Security Zones

**Security Zone**: Distinct segment within a network, often created by logically isolating the segment using a firewall or other security device
- Public-facing services
- Internal employee resources
- Sensitive data storage

**Screened Subnet**: Hosts public-facing services such as web servers, email servers, and DNS servers and safeguards against security breaches by preventing attackers from gaining direct access to the sensitive core internal network

#### Attack Surfaces

Refers to all the points where an unauthorized user can try to enter data to or extract data from an environment. The more complex the network architecture becomes the larger the attack surface becomes. You need to take into consideration the potential risks that can occur due to:
- Improper device placement
- Improperly configured devices
- Outdated software
- Unnecessary open ports
- Weak access controls

#### Connectivity

Refers to how different components of a network communicate with each other and with other external networks:
- Wifi
- Ethernet
- Fiber
- Hybrid

Consider the following when designing connectivity architecture
- Scalability
- Speed requirements
- Security considerations
- Budgetary constraints

#### Device Attributes

**Active Devices**: devices that are actively interacting with network traffic (IPS)

**Passive Devices**: devices that are passively on the network such as monitoring devices (IDS)

**Inline Device**: Sits in the network traffic path, and is able to control or block traffic as it passes through this device (IPS)

**Tap-Based Configuration**: Operate discreetly outside the network path, capturing data for analysis without impacting traffic (IDS)

#### Failure Mode

The use of these modes is dependent on your organization's security policy and the criticality of the network segment

**Fail-Open**: Allows all traffic in the event of a failure to ensure no disruption to the network service

**Fail-Closed**: blocks all traffic in the event of a failure 

### Selecting Infrastructure Controls

**Control**: A protective measure put in place to reduce potential risks and safeguard an organization's assets

##### Key Principals 

**Least Privilege**: Users or systems are granted only the necessary access rights to perform their duties, reducing the attack surface

**Defense in Depth**: Emphasizes the use of multiple layers of security to mitigate threats even if one control fails

**Risk-based Approach**: Prioritizing controls based on potential risks and vulnerabilities specific to the infrastructure to make efficient use of resources

**Lifecycle Management**: Regularly reviewing, updating, and retiring controls to adapt to evolving threat landscapes

**Open Design Principle**: Ensuring transparency and accountability through rigorous testing and scrutiny of infrastructure and controls

##### Methodology Steps

1. Assessing the current state
2. Conducting gap analysis
3. Setting clear objectives
4. Benchmarking
5. Conducting cost-benefit analysis
6. Ensuring stakeholder involvement
7. Implementing monitoring and feedback loops
# Review Questions

```aosr-deck-config
{
	"rule": {
		"conditions": {
			"all": [{
				"fact": "card",
				"operator": "regexMatch",
				"value": "Security Infrastructure",
				"path": "$.path"
			}]
		},
		"event": {
			"type": "match"
		}
	}
}
```

## Questions


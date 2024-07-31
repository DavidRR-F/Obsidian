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


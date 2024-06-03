---
id: Final Review
aliases: []
tags: []
---

- [x] DNS Record Types/Steps
- [ ] DHCP Steps
- [ ] 802.11 memorize
- [ ] 802.1 memorize
- [ ] 802.3 memorize
- [x] Dynamic Routing Protocols AD/Types
- [ ] STP States Blocking Listening Learning Forwarding
- [ ] OC, T, E line memorize Mbps
- [ ] Wireless Overview

### STP - Spanning Tree Protocol (802.1D)

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


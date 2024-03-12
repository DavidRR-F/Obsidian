DNS, or Domain Name System, is a hierarchical and decentralized naming system used to identify computers, services, and other resources reachable through the Internet or private networks. It associates various information with domain names assigned to each of the participating entities. Most notably, it translates more readily memorized domain names to the numerical IP addresses needed for locating and identifying computer services and devices with the underlying network protocols.

FQFN - Fully Qualified Domain Name:

![[Pasted image 20240310164630.png]]
### How DNS Works

DNS operates as a distributed database system across numerous servers worldwide, functioning somewhat like an internet phone book. It allows users to access websites using domain names, like `www.example.com`, instead of having to remember complex numerical IP addresses such as `192.0.2.1` (IPv4) or more complex sequences in IPv6.

The process of resolving a domain name to an IP address involves several steps and components:

1. **DNS Query**: When you try to access a website by typing its domain name, your computer sends a DNS query to a DNS server to request the IP address associated with that domain name.
    
2. **Recursive Resolver**: Usually, the query first goes to a recursive resolver (typically provided by your internet service provider), which has the job of tracking down the IP address for the domain name. If the resolver does not have the record cached, it will start a process to find the IP address.
    
3. **Root Nameservers**: The query is sent to the root nameservers if the recursive resolver does not have the information cached. The root server responds with a referral to the Top-Level Domain (TLD) DNS servers (e.g., `.com`, `.net`, `.org` servers), which manage the next level of the hierarchy.
    
4. **TLD Nameservers**: The resolver then queries the TLD nameservers, which respond with a referral to the domain's authoritative nameservers, which have been configured by the domain owner.
    
5. **Authoritative Nameservers**: Finally, the recursive resolver queries the authoritative nameservers for the IP address of the requested domain. The authoritative server holds the DNS records for the domain, including the A record (for IPv4 addresses) or AAAA record (for IPv6 addresses) which contains the IP address of the domain.
    
6. **Response to Client**: The recursive resolver sends the IP address back to the user's computer. The browser can then use the IP address to access the website.
    

### Key Components of DNS

- **Domain Name**: A human-readable address used to access websites.
- **IP Address**: A unique numerical label assigned to each device connected to a computer network.
- **Nameserver**: A server that contains a list of domain names and the corresponding IP addresses.
- **DNS Record**: Entries within the DNS that provide information about a domain, including IP addresses (A and AAAA records), mail servers (MX records), and others.

# Internal DNS

internal DNS infrastructure is designed to resolve hostnames and manage DNS queries within a corporate or private network. This system allows devices within the network to communicate with each other using domain names that are not accessible or resolvable from the outside world.

### Key Features of Internal DNS

- **Private Name Resolution**: Internal DNS servers resolve names that are meaningful only within the organization. For example, a server might be accessible within a company's network as `server.company.local`, a domain name that does not exist on the public internet.
- **Security and Control**: By managing DNS queries internally, organizations can enhance security, control traffic flow within their networks, and enforce policies related to data access and network usage.
- **Efficiency**: Internal DNS can improve network efficiency by caching frequently accessed internal resources, reducing the need for external DNS queries, and thereby decreasing latency.
- **Integration with Active Directory**: In Windows environments, internal DNS is often integrated with Active Directory for authentication and authorization, allowing for seamless resource access and management.

### Components of Internal DNS

- **Internal DNS Server**: A server within the private network that hosts the DNS records for internal resources. This server responds to DNS queries from devices within the network, directing them to the appropriate internal resources.
- **DNS Records**: Just like in public DNS, internal DNS utilizes records (such as A, AAAA, CNAME, MX) to map hostnames to IP addresses and provide information about services and resources within the network.
- **Forwarders**: Internal DNS servers may use forwarders to direct queries for external domain names to public DNS servers, allowing users within the network to access internet resources while keeping internal resources private.

# Implementing DNS

  
Implementing a DNS (Domain Name System) server involves setting up a system that can respond to DNS queries for domain names within zones it is authoritative for. This setup requires configuring DNS software (such as BIND on Linux, Microsoft DNS on Windows Server, or other DNS server software), defining zones, and specifying the records within those zones. Let's break down the key components and steps involved:

### Authoritative DNS Server

An authoritative DNS server is one that has the complete, definitive set of records for a domain. It responds to queries from other DNS servers and clients about domains or subdomains for which it has authority, providing the requested records such as A (address), AAAA (IPv6 address), MX (mail exchange), CNAME (canonical name), etc.

### Zones and Zone Files

A zone represents an administrative space within the domain namespace. A zone file is a text file that describes a portion of the domain name space using resource records. It includes information about the domains and subdomains that the DNS server has authority over.

- **Primary Zone**: The primary zone is the authoritative copy of the zone data.
- **Secondary Zone**: A secondary zone is a read-only copy of the zone that gets its data from the primary zone through zone transfers. Secondary zones are used for load balancing and redundancy.

## Records

DNS (Domain Name System) uses various types of records to provide essential information about domains and how they should be handled. Here are some of the key DNS record types:

#### 1. A (Address) Record

- **Purpose**: Maps a domain name to its corresponding IPv4 address.
- **Example**: `example.com IN A 192.0.2.1`

#### 2. AAAA (IPv6 Address) Record

- **Purpose**: Maps a domain name to its corresponding IPv6 address.
- **Example**: `example.com IN AAAA 2001:0db8:85a3:0000:0000:8a2e:0370:7334`

#### 3. CNAME (Canonical Name) Record

- **Purpose**: Used to alias one domain name to another (the "canonical" domain name), allowing multiple domain names to map to the same IP address.
- **Example**: `www.example.com IN CNAME example.com`

#### 4. MX (Mail Exchange) Record

- **Purpose**: Specifies the mail server responsible for accepting email messages on behalf of a domain.
- **Example**: `example.com IN MX 10 mail.example.com`

#### 5. NS (Name Server) Record

- **Purpose**: Specifies the authoritative name servers for a domain, used for delegating a subdomain to a set of name servers.
- **Example**: `example.com IN NS ns1.example.com`

#### 6. PTR (Pointer) Record

- **Purpose**: Used for reverse DNS lookups, mapping an IP address back to a host name.
- **Example**: `1.2.0.192.in-addr.arpa IN PTR example.com`

#### 7. SOA (Start of Authority) Record

- **Purpose**: Specifies authoritative information about a DNS zone, including the primary name server, the email of the domain administrator, the domain serial number, and timers relating to refreshing the zone.
- **Example**: `example.com IN SOA ns1.example.com hostmaster.example.com (2023101301 7200 3600 1209600 86400)`

#### 8. SRV (Service) Record

- **Purpose**: Identifies the hostname and port number of servers offering specific services, such as LDAP, SIP, or XMPP.
- **Example**: `_sip._tcp.example.com IN SRV 0 5 5060 sipserver.example.com`

#### 9. TXT (Text) Record

- **Purpose**: Allows administrators to insert arbitrary text into a DNS record; often used for verifying domain ownership, implementing email security measures like SPF (Sender Policy Framework), DKIM (DomainKeys Identified Mail), and DMARC (Domain-based Message Authentication, Reporting, and Conformance).
- **Example**: `example.com IN TXT "v=spf1 ip4:192.0.2.1 ~all"`

#### 10. SPF (Sender Policy Framework) Record

- **Purpose**: Used to specify which mail servers are permitted to send email on behalf of a domain, aiming to reduce spam. (Note: While SPF was historically implemented as a separate record type, it is now typically included as part of a TXT record.)
- **Example**: `example.com IN TXT "v=spf1 include:_spf.google.com ~all"`

#### 11. NAPTR (Naming Authority Pointer) Record

- **Purpose**: Used in dynamic delegation discovery systems that implement ENUM (E.164 Number Mapping) and other services to map telephone numbers and other identifiers to URIs (Uniform Resource Identifiers) and DNS records.
- **Example**: `2.1.2.0.4.4.1.e164.arpa IN NAPTR 100 10 "u" "E2U+sip" "!^.*$!sip:number@example.com!" .`


# DDNS - Dynamic DNS


Dynamic DNS (DDNS) is a service that automatically updates the DNS records for a domain name in real-time, reflecting changes in the IP address of a host that may frequently change. This service is particularly useful for home networks, small businesses, or any situation where the IP address of a device (such as a web server, camera, or remote access service) is assigned dynamically by an Internet Service Provider (ISP) and can change over time, commonly known as a dynamic IP address.

### How Dynamic DNS Works

1. **Initial Setup**: A user registers with a Dynamic DNS provider and chooses a domain name provided by the service or uses their own domain name if the service supports it.
    
2. **Configuration**: The user configures their network device (like a router, webcam, or server) or a software client to communicate with the Dynamic DNS service. This configuration includes the domain name, the Dynamic DNS provider's server information, and the credentials for the DDNS account.
    
3. **IP Address Update**: Whenever the IP address of the device changes (such as after a reboot, ISP change, or when DHCP lease is renewed), the configured device or software client automatically notifies the Dynamic DNS service of the new IP address.
    
4. **DNS Record Update**: The Dynamic DNS service immediately updates the corresponding DNS record with the new IP address. This ensures that the domain name always points to the current IP address of the device.
    

### Advantages of Dynamic DNS

- **Accessibility**: Allows easy access to devices or services hosted on a network with a dynamic IP address using a consistent domain name, without the need to know the current IP address.
- **Cost-Effectiveness**: Offers a cost-effective solution for remote access without the need for a static IP address, which may be expensive or not offered by some ISPs.
- **Ease of Use**: Simplifies the configuration and management of remote access to network devices, making it user-friendly for non-technical individuals.

### Common Uses

- **Remote Access**: Enables remote access to home networks, servers, or IoT (Internet of Things) devices without needing to track changing IP addresses.
- **Hosting Servers**: Facilitates hosting web servers, game servers, or any other type of server on a network with a dynamic IP address.
- **Surveillance Cameras**: Allows users to access IP cameras or security systems remotely, even when the IP address changes.

# DNS Troubleshooting

![[Pasted image 20240311124403.png]]

### Try an IP Address to test without DNS

If you are not able to access addresses using there FQDN use a known IP Address for the service/server your trying to reach or another known IP to an eternal server. I this connection is successful you has a DNS issue.

### Check Misconfigurations

Check if there is any misconfigured dns settings on your network

```bash
$ ipconfig /all
```

### Flushing DNS Cache

Your computer and local dns servers will cache copies of ip addresses associated with FQDN's. By whiping the cache  it compels the dns to recreate its tables

```bash
$ ipconfig /flushdns
```

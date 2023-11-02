  
DNS, or Domain Name System, is a fundamental technology used on the internet and other networks to translate human-friendly domain names into numeric IP addresses that computers and networked devices use to identify each other. Here's a brief description of DNS:

1. **Translation of Domain Names**: DNS serves as the "phone book" of the internet, converting user-friendly domain names (like [www.example.com](http://www.example.com/)) into numerical IP addresses (such as 192.0.2.1) that computers and servers can understand. This translation makes it easier for people to access websites and services on the internet.
    
2. **Hierarchical Structure**: DNS operates within a hierarchical structure. The internet's domain name space is organized into a tree-like structure, with the root domain at the top, followed by top-level domains (TLDs) like .com, .org, and .net, and then subdomains and individual domain names.
    
3. **Name Resolution**: When a user or application enters a domain name into a web browser or other networked software, the DNS system resolves the domain name by querying a distributed network of DNS servers. These servers work together to find the corresponding IP address for the requested domain.
    
4. **Caching**: DNS servers often cache (store) recently resolved DNS information for a certain period. This caching helps reduce the load on DNS servers and speeds up subsequent requests for the same domain name.
    
5. **Primary Functions**:
    
    - **Hostname to IP Address**: DNS resolves domain names to IP addresses, allowing users and devices to access websites and services by name.
    - **Reverse DNS**: It can also perform reverse DNS lookups, translating IP addresses back into domain names. This is often used for security and auditing purposes.
    - **Mail Server Resolution**: DNS is crucial for routing email messages to the correct mail servers based on recipient domain names (MX records).
    - **Load Balancing**: DNS can be used for load balancing by distributing traffic among multiple IP addresses associated with a domain name.
    - **Redundancy**: DNS can provide redundancy by allowing multiple IP addresses to be associated with a domain name, so traffic can be directed to an alternate server if one fails.

1. **DNS Servers**: DNS relies on a hierarchy of DNS servers, including root servers, TLD servers, authoritative DNS servers, and caching DNS resolvers. These servers work together to provide accurate and efficient domain name resolution.
    
7. **DNS Record Types**: DNS records contain various types of information, such as A records (for IPv4 addresses), AAAA records (for IPv6 addresses), MX records (for mail server addresses), CNAME records (for aliasing one domain to another), and more.
    
8. **Security Considerations**: DNS security is essential to prevent various attacks, such as DNS spoofing, cache poisoning, and distributed denial-of-service (DDoS) attacks. DNSSEC (DNS Security Extensions) is a set of extensions that provide data integrity and authentication for DNS responses.

### Record Types 

1. **A Record (Address Record)**:
    
    - **Purpose**: A records are used to map a hostname (e.g., [www.example.com](http://www.example.com/)) to an IPv4 address (e.g., 192.0.2.1). They provide the fundamental mapping that allows users and applications to resolve domain names to IP addresses.
    - **Example**:
        - A record for the hostname "www" pointing to the IPv4 address 192.0.2.1:
            
```bash
$ www.example.com.    IN  A   192.0.2.1
```
            
2. **PTR Record (Pointer Record)**:
    
    - **Purpose**: PTR records serve the opposite purpose of A records. They map an IP address to a hostname. PTR records are used for reverse DNS lookups. They are particularly useful for verifying the identity of an IP address or for logging purposes.
    - **Example**:
        - PTR record for the IPv4 address 192.0.2.1 pointing to the hostname "[www.example.com](http://www.example.com/)":
            
```bash
$ 1.2.0.192.in-addr.arpa.    IN  PTR   www.example.com.
```
            
3. **CNAME Record (Canonical Name Record)**:
    
    - **Purpose**: CNAME records are used to create an alias or canonical name for a hostname. They allow one hostname to be associated with another. When a DNS query is made for a CNAME, it's resolved by looking up the canonical name's corresponding A or AAAA record.
    - **Example**:
        - CNAME record that aliases "www" to "webserver," so both resolve to the same IP address:
            
```bash
$ www.example.com.    IN  CNAME   webserver.example.com.
```
            
- **Use Cases**: CNAME records are commonly used for:
        - Load balancing: Pointing multiple hostnames to a single server or service.
        - Managing subdomains: Creating subdomains like "blog.example.com" that alias to a main hostname.
        - Easy domain changes: If you need to change the underlying server or IP address of a hostname, you can update the CNAME record without changing all references to the alias.

### DNS Service and Files

`named` daemon, also known as BIND (Berkeley Internet Name Domain), is a widely used and highly configurable DNS (Domain Name System) server software for Unix-like operating systems. It is responsible for translating human-readable domain names (like [www.example.com](http://www.example.com/)) into IP addresses (like 192.0.2.1) and vice versa. Here's an explanation of the named daemon and related files:

1. **`named` Daemon**:
    
    - **Purpose**: The named daemon is the core component of the BIND DNS server software. It runs in the background as a service and listens for DNS queries, responding with the appropriate DNS information based on the configuration and zone data it manages.
    - **Functionality**:
        - It acts as a DNS resolver, forwarding DNS queries to other DNS servers if it doesn't have the information in its own database.
        - It can be configured to be authoritative for specific domains, meaning it has complete control over the DNS information for those domains.
        - It supports various DNS record types, zone transfers, and DNS security features like DNSSEC (DNS Security Extensions).
    - **Configuration**: The configuration for the named daemon is typically stored in the `/etc/named.conf` file, which specifies various settings, zones, and options for DNS resolution and zone management.

1. **/etc/named** (or /etc/bind in some systems):
    
    - **Directory Purpose**: This directory is used to store configuration files, zone files, and other data related to the named daemon.
    - **Configuration Files**:
        - `/etc/named.conf` (or `/etc/bind/named.conf`): This is the main configuration file for the named daemon. It contains global server options, zone definitions, logging settings, and more.
        - `/etc/named.rfc1912.zones`: This file provides predefined zone configurations based on RFC 1912 recommendations. It includes settings for common zones like the root hints, localhost, and reverse DNS zones.
    - **Zone Files**: The `/etc/named` directory may also contain zone files for domains that the DNS server is authoritative for. Zone files contain DNS resource records (RRs) that define the domain's DNS information.
    - **Logging and Other Data**: Various log files, DNS cache files, and other data related to DNS queries and server operation may be stored in this directory.

1. **/etc/named.conf** (or /etc/bind/named.conf):
    
    - **Purpose**: This is the main configuration file for the named daemon.
    - **Contents**: The `/etc/named.conf` file contains several sections and directives, including:
        - Global Options: These specify general server settings, such as the listening interfaces, recursion settings, and query logging.
        - Zone Definitions: Each zone definition specifies the type of zone (master, slave, or hint), the zone name, and the file location of the zone's data.
        - Included Configuration Files: You can use the `include` directive to include additional configuration files to keep the main configuration organized.
        - Logging: You can configure logging settings to record DNS server activities and errors.
    - **Customization**: Administrators can edit this file to customize the behavior of the DNS server, define authoritative zones, specify forwarders, and set up DNS security features.

## Configuring DNS Server 

#### Setup:
- Master DNS
- Secondary or Slave DNS
- Client

1. Install DNS package

```bash
$ yum install bind bind-utils -y
```

2. Configure DNS Server

```bash
$ vi /etc/named.conf

# Edit lines
listen-on port 53 { 127.0.0.1; <ip_address>; };

zone "<domain>" IN {
	type master;
	file "forward.lab";
	allow-update { none; };
};

zone "1.168.192.in-addr.arpa" IN {
	type master;
	file "reverse.lab";
	allow-update { none; };
};
```

3. Create Zone Files

```bash
$ cd /var/named

$ touch forward.lab

$ touch reverse.lab
```

- Modify forward zone file

```
$TTL 86400 
@ IN SOA masterdns.lab.local. root.lab.local. ( 
     2011071001 ;Serial 3600 ;
     Refresh 1800 ;Retry 604800 ;
     Expire 86400 ;Minimum TTL 
 ) 
@ IN NS masterdns.lab.local. 
@ IN A 192.168.1.29 masterdns IN A 192.168.1.29 
clienta IN A 192.168.1.240 
clientb IN A 192.168.1.241
```

- Modify Reverse zone file

```
$TTL 86400 @ IN SOA masterdns.lab.local. root.lab.local. ( 
	2011071001 ;
	Serial 3600 ;
	Refresh 1800 ;
	Retry 604800 ;
	Expire 86400 ;Minimum TTL 
) 
@ IN NS masterdns.lab.local. 
@ IN PTR lab.local. masterdns IN A 192.168.1.29 
29 IN PTR masterdns.lab.local. 
240 IN PTR clienta.lab.local. 
241 IN PTR clientb.lab.local.
```

- Update Configurations

```bash
$ vi /etc/sysconfig/network-scripts/ifcfg-enp0s3

# Edit File
DNS=192.168.1.29

$ vi /etc/resolv.conf

# Adit File
nameserver 192.168.1.29
```

- Start DNS Server

```bash
$ systemctl start named
$ systemctl enable named
```

- Enable firewall traffic

```bash
$ sudo firewall-cmd --add-port=53/tcp --permanent

$ sudo firewall-cmd --reload
```
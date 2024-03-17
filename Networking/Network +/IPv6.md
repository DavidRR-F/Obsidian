IPv6, or Internet Protocol version 6, is the most recent version of the Internet Protocol (IP), the communications protocol that provides an identification and location system for computers on networks and routes traffic across the Internet. It was developed to address the limitations of the previous version, IPv4, primarily its limited address space. Here are the key features and aspects of IPv6:

![[Pasted image 20240314123148.png]]

- `:0` - group of all zeros
- `::` - multiple groups of all zeros in succession (can only be used once per address)
### 1. **Expanded Address Space**

- **IPv4:** Uses 32-bit addresses, allowing for about 4.3 billion unique addresses. Given the growth of the internet and connected devices, this pool has been exhausted.
- **IPv6:** Uses 128-bit addresses, enabling approximately 3.4×10383.4×1038 addresses, a practically limitless number, ensuring the scalability of the internet for the foreseeable future.

### 2. **Address Format**

- IPv6 addresses are represented as eight groups of four hexadecimal digits, separated by colons, for example, `2001:0db8:85a3:0000:0000:8a2e:0370:7334`.
- It supports various types of addresses, including unicast (a single sender and a single receiver), multicast (a single sender and multiple receivers), and anycast (a single sender and the nearest of several receivers in terms of routing distance).

### 3. **Link-Local Address**

- **Purpose:** Link-Local addresses are used for communication between nodes on the same network segment or link. These addresses are not routable beyond their link, meaning they are not meant to be used for traffic that needs to travel through routers to reach different network segments.
- **Format:** Link-Local addresses always begin with the prefix `fe80::/10`. The rest of the address is usually generated automatically from the network interface's MAC address using a process called EUI-64, though it can also be manually configured.
- **Usage:** They are automatically configured on all IPv6-enabled interfaces and are used for network operations such as Neighbor Discovery Protocol (NDP), which is essential for the functioning of IPv6 networks. Since they are only valid within the context of a single link, they are ideal for local network services and communications.

![[Pasted image 20240314124540.png]]

### 4. **Global Unicast Address (GUA)**

- **Purpose:** Global Unicast Addresses are the IPv6 equivalent of public IP addresses in IPv4. They are globally unique and routable on the Internet, allowing devices to communicate over the internet.
- **Format:** The structure of a GUA is more complex and includes several parts, such as the global routing prefix, subnet ID, and interface ID. The global routing prefix is assigned by regional internet registries to organizations, and the subnet ID is used within organizations to identify subnets. The interface ID is similar to the host portion of an IPv4 address but is 64 bits long to ensure uniqueness within the subnet.
- **Usage:** These addresses are used for all internet-routable communications. They allow an IPv6-enabled device to communicate with other devices across the globe, assuming proper routing and firewall rules are in place to allow the traffic.

### 3. **Simplified Header Structure**

- The IPv6 header is more streamlined than its IPv4 counterpart, reducing the processing time of packets by routers. This is achieved by removing rarely used fields and options that are now optional extensions.

### 4. **Improved Routing**

- The simplified packet header and the hierarchical structure of IPv6 addresses improve the efficiency of routing through the internet.

### 5. **Auto-configuration**

- IPv6 supports stateless address autoconfiguration (SLAAC), allowing devices to automatically generate their own addresses using a combination of locally available information and router advertisements. This feature simplifies network configurations and reduces the need for manual configurations or DHCP (Dynamic Host Configuration Protocol).

### 6. **Better Security**

- IPv6 was designed with internet security in mind. IPsec, a suite of protocols for securing internet protocol communications by authenticating and encrypting each IP packet of a communication session, is an integral part of IPv6. While IPsec can also be used with IPv4, its use is optional and less straightforward.

### 7. **No Need for NAT**

- Network Address Translation (NAT) is widely used in IPv4 to alleviate address exhaustion by allowing multiple devices on a private network to share a single public IP address. The vast address space of IPv6 eliminates the need for NAT, enabling end-to-end connectivity at the IP layer, which simplifies networking models and improves performance.

### 8. **Transition Mechanisms**

- Given the vast differences between IPv4 and IPv6, several transition mechanisms have been developed to ensure compatibility and smooth transition. These include dual stack (running IPv4 and IPv6 in parallel), tunneling (encapsulating IPv6 packets within IPv4 packets), and translation (translating between IPv4 and IPv6 packets).

# IPv6 Actions
## Neighbor Solicitation

The Neighbor Solicitation method is part of the Neighbor Discovery Protocol (NDP) in IPv6, which operates within the Internet Layer of the Internet Protocol Suite. NDP is crucial for the functionality of IPv6, serving roles similar to what Address Resolution Protocol (ARP), ICMP Router Discovery, and Router Redirection do for IPv4. Specifically, Neighbor Solicitation is used for several purposes, including:

1. **Determining the link-layer address of a neighbor (similar to ARP in IPv4)**
2. **Verifying the reachability of a neighbor**
3. **Duplicate Address Detection (DAD)**

### How Neighbor Solicitation Works:

- **Address Resolution:** When an IPv6 node wants to send a packet to another node on the same local network but does not know the destination's physical MAC address, it sends a Neighbor Solicitation message. This message is sent to the solicited-node multicast address corresponding to the target IP address. The message essentially asks, "Who has this IP address?"
    
- **Neighbor Solicitation Message:** This ICMPv6 message contains the sender's IP address, the target's IP address for which the MAC address is solicited, and the sender's MAC address. It's sent as an ICMPv6 packet with a specific type value that indicates it is a Neighbor Solicitation message.
    
- **Duplicate Address Detection:** Before assigning an IP address to an interface, a device sends a Neighbor Solicitation message with its own prospective IP address as the target address. If another device responds with a Neighbor Advertisement, it means the address is already in use, indicating a duplicate address exists.
    
- **Reachability Confirmation:** Neighbor Solicitation messages are also used to check if a neighbor is still reachable via the same link-layer address. If the address has changed, or if the neighbor is no longer reachable, this can be detected through the lack of a valid Neighbor Advertisement response.
    

### Response to Neighbor Solicitation:

- **Neighbor Advertisement:** In response to a Neighbor Solicitation message, a Neighbor Advertisement message is sent. This response contains the MAC address of the solicited node if it is operational and accepting traffic. For address resolution, this message is the confirmation that the solicited IP address is in use, along with the link-layer address (MAC address) of that node.

## Router Solicitation

Router Solicitation is another important component of the Neighbor Discovery Protocol (NDP) in IPv6, designed to allow IPv6 hosts to quickly discover routers on the same local network (link). It's particularly useful when a device boots up or connects to a network and needs to obtain essential network configuration parameters.

### Purpose of Router Solicitation:

- **Discover Routers:** IPv6 hosts use Router Solicitation messages to request routers on the same link to announce their presence. This is crucial for a host to obtain information such as the network's address prefix, the default gateway, and other configuration parameters that are necessary for proper operation on the network.

### How Router Solicitation Works:

1. **Sending the Solicitation:** When an IPv6-enabled device connects to a network, it sends a Router Solicitation message as an ICMPv6 packet. This solicitation is typically broadcast to the all-routers multicast address, which is `ff02::2`. The message is essentially a request for routers on the local link to identify themselves.
    
2. **Router Advertisement Response:** Routers on the network respond to Router Solicitation messages with Router Advertisement messages. These advertisements provide the requesting hosts with critical network configuration information, such as:
    
    - The network prefixes that are being used on the local network, which the host can use to configure its own IPv6 address(es).
    - The lifetime of the prefix, indicating how long the host can use the address before needing to check for updates.
    - The address of the default gateway that the host should use for outbound traffic to the internet or other networks.
    - Various flags that control how the host should behave, such as whether it should use stateful (e.g., DHCPv6) or stateless address autoconfiguration.

3. **Automatic and Periodic Advertisements:** In addition to responding to solicitations, routers periodically send unsolicited Router Advertisement messages. This ensures that even if a solicitation message is missed or not sent by a host, it will eventually receive the necessary configuration information.

## Router Prefix 

In the context of IPv6, a router prefix refers to the part of an IP address that identifies the network segment within the larger internet structure. It's essential for both routing traffic to the correct network and for hosts on that network to configure their own IPv6 addresses. The prefix is distributed to hosts on the network primarily through Router Advertisement (RA) messages as part of the Neighbor Discovery Protocol (NDP).

### Understanding Router Prefixes:

- **Prefix Length:** IPv6 addresses are 128 bits long, divided into two primary parts: the network prefix and the interface identifier (host portion). The network prefix can vary in length, commonly 64 bits for most local networks, but the length can be different based on the allocation policies and network design. The prefix length is denoted after a slash following the IP address, such as `2001:db8::/48`, where `48` indicates the first 48 bits are the network prefix.
    
- **Router Advertisement and Prefix Information:** Routers use RA messages to inform hosts about the network's prefix(es). These messages contain:
    
    - **Prefix Information Option:** This option specifies the IPv6 prefix that is valid for the network. It includes the prefix length and flags that indicate how the address should be configured (e.g., whether stateless autoconfiguration is allowed).
    - **Valid Lifetime:** The time during which the prefix is valid for use in generating new addresses.
    - **Preferred Lifetime:** The time during which the prefix is preferred, meaning addresses generated with this prefix should be used for new connections. After this lifetime expires, existing connections using this prefix can continue, but new connections should use a different (newer) prefix.

### Purpose and Use of Router Prefixes:

1. **Address Configuration:** Hosts use the prefix information from RA messages to automatically configure their own IPv6 addresses using Stateless Address Autoconfiguration (SLAAC). By combining the received prefix with an interface identifier (often derived from the MAC address or generated through other means for privacy), a device can generate a complete, unique IPv6 address.
    
2. **Routing:** The prefix defines the network segment's address space, helping routers make forwarding decisions. Packets with destinations outside the local network are sent to the router advertised as the default gateway in RA messages.
    
3. **Subnetting and Network Management:** Network administrators use prefixes to design and manage network segments (subnets). By allocating specific prefixes to different parts of their networks, they can control routing, apply policies, and organize the network logically.

# IPv4 and IPv6 Tunneling

IPv4 and IPv6 tunneling are techniques used to enable the coexistence of and transition between IPv4 and IPv6 networks. Given the significant differences between IPv4 and IPv6, including incompatible address spaces, tunneling provides a way to transport IPv6 packets over an existing IPv4 infrastructure or vice versa. This is particularly important during the gradual global transition to IPv6, as it ensures interoperability between the two protocols.

### Types of Tunneling:

1. **IPv6 over IPv4 Tunneling:** This is the most common scenario during the transition phase to IPv6. IPv6 packets are encapsulated within IPv4 packets to traverse IPv4 networks. This method allows IPv6-enabled devices and networks to communicate through IPv4-only infrastructure.
    
    - **Manual Tunnels:** Configured explicitly by network administrators, specifying the endpoints of the tunnel. This is useful for static and stable connections between IPv6 islands through an IPv4 sea.
    - **Automatic Tunnels:** These tunnels are dynamically established without explicit configuration of the endpoints, using mechanisms like 6to4, Teredo, and ISATAP. Each of these has unique mechanisms for determining tunnel endpoints and addressing.

2. **IPv4 over IPv6 Tunneling:** Less common but increasingly relevant as IPv6 adoption grows, this method involves encapsulating IPv4 traffic within IPv6 packets. This approach is useful for service providers and organizations that have migrated to IPv6 but need to support IPv4 traffic.
    

### How Tunneling Works:

- **Encapsulation:** The original IP packet (IPv6 in IPv4 tunneling, or IPv4 in IPv6 tunneling) is encapsulated within the payload of an outer IP packet with a different version. The outer packet's header is used for routing through the incompatible network.
- **Decapsulation:** Upon reaching the tunnel's endpoint, the outer packet is removed to recover the original IP packet, which is then forwarded according to its destination.

# SLAAC

Stateless Address Autoconfiguration (SLAAC) is a method used in IPv6 networks that allows devices to automatically configure their own IP addresses and other necessary network settings without the need for a centralized server like DHCP. SLAAC is defined in RFC 4862 and is one of the key features that highlight the advancements of IPv6 over IPv4 in terms of simplifying network configuration and management.

### How SLAAC Works:

1. **Router Advertisement:** When a device connects to an IPv6 network, IPv6-enabled routers on the network send out Router Advertisement (RA) messages at regular intervals. These messages can also be solicited by a new device on the network through a Router Solicitation message. The RA messages contain network configuration information, including one or more network prefixes that are being used on the local network.
    
2. **Address Generation:** Upon receiving an RA message, the device uses the advertised prefix(es) to generate its own IPv6 address for each prefix. This is typically done using the EUI-64 format, where the device's 48-bit MAC address is modified to create a 64-bit interface identifier, which is then combined with the 64-bit network prefix obtained from the RA message. However, for privacy reasons, many operating systems now use random values to generate the interface identifier part of the address (RFC 7217).
    
3. **Duplicate Address Detection (DAD):** Before finalizing the use of an IP address, the device performs Duplicate Address Detection by sending a Neighbor Solicitation message to the network. If no other device responds indicating that the address is already in use, the address is considered unique, and the device configures it for its interface.
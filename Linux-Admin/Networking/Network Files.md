## Interface Configuration Files

### /etc/nsswitch.conf

Name Service Switch Configuration. defines how system databases are queried.

- This file specifies how various system databases, such as user information, group information, and hostname resolution, should be queried. It defines the order and sources used to resolve names and addresses.
- For example, it specifies whether to look into local files like /etc/hosts or query a network-based directory service like LDAP for user information.
### /etc/hosts

specifies the system's hostname.

- This file contains the hostname of the system. The hostname is the name by which the system is known on a network. It's used for identifying the local system and is often used in network communication.
- The contents of this file typically consist of a single line with the hostname.
### /etc/sysconfig/network

contains global network configuration settings.

- This file (or a similarly named file depending on the distribution) contains global network configuration settings for the system. It includes parameters like the hostname and domain name.
- This file may also include networking settings such as routing information and default gateway configuration.
### /etc/sysconfig/network-scripts/ifcfg-nic

configures network interface settings.

- This file is specific to each network interface on the system and is named based on the interface's name (e.g., ifcfg-eth0 for the first Ethernet interface).
- It contains configuration settings for that particular network interface, including the IP address, subnet mask, gateway, DNS server settings, and more.
- The "nic" in the file name represents the specific network interface (e.g., eth0, wlan0).
### /etc/resolv.conf

configures DNS resolver settings for domain name resolution.

- This file is used to configure the DNS (Domain Name System) resolver on the system. DNS is responsible for resolving domain names (like [www.example.com](http://www.example.com/)) to IP addresses.
- The /etc/resolv.conf file typically includes the IP addresses of DNS servers that the system should use for domain name resolution. It may also specify domain search suffixes.
- This file is used by the system to determine where to send DNS queries when resolving domain names.
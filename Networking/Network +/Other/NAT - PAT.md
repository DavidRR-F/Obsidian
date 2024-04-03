NAT (Network Address Translation) and PAT (Port Address Translation) are techniques used in computer networking to translate private IP addresses within a local network to public IP addresses that can be used on the Internet, and vice versa.

1. **NAT (Network Address Translation):** NAT allows devices on a local network with private IP addresses to communicate with devices on external networks, such as the Internet. It works by translating the private IP addresses of devices within the local network to a single public IP address assigned to the router or firewall that connects the local network to the Internet. This allows multiple devices within the local network to share the same public IP address when accessing resources on the Internet.
    
    NAT can operate in different modes, including:
    
    - Static NAT: Maps a private IP address to a specific public IP address on a one-to-one basis.
    - Dynamic NAT: Maps a private IP address to an available public IP address from a pool of public IP addresses on a one-to-one basis.
    - Overloaded NAT (or NAPT - Network Address Port Translation): Maps multiple private IP addresses to a single public IP address by using unique port numbers to distinguish between connections from different devices.
2. **PAT (Port Address Translation):** PAT is a variation of NAT that extends its functionality by also translating port numbers along with IP addresses. In addition to translating IP addresses, PAT assigns unique port numbers to each connection from devices within the local network. This allows multiple devices within the local network to share the same public IP address, with each device's connection being uniquely identified by a combination of the public IP address and port number.
    
    PAT is commonly used in home and small office networks where a single public IP address is shared among multiple devices. It enables these devices to access the Internet simultaneously without requiring each device to have its own public IP address.
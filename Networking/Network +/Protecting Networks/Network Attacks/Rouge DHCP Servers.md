**What It Is**: A rogue DHCP (Dynamic Host Configuration Protocol) server is an unauthorized DHCP server set up on a network, which can be maliciously intended or mistakenly configured. DHCP servers are crucial in networks for automatically assigning IP addresses to devices, along with other network configuration details like subnet masks, default gateways, and DNS servers. When a rogue DHCP server is present, it can distribute incorrect or malicious configuration information to clients, leading to a variety of security issues such as man-in-the-middle attacks, network disruption, or unauthorized access.

**Security Risks**:

- **Man-in-the-Middle (MitM) Attacks**: Rogue servers can redirect network traffic through malicious devices, intercepting sensitive information.
- **Denial of Service (DoS)**: By assigning incorrect network configurations, a rogue DHCP server can prevent legitimate network access, leading to service disruptions.
- **Network Infiltration**: Assigning IP addresses from unauthorized subnets can allow attackers to bypass network security measures.

**How to Protect Against It**:

- **DHCP Snooping**: Implement DHCP snooping on switches to filter untrusted DHCP messages and prevent unauthorized DHCP servers from operating on the network. This feature differentiates between trusted ports connected to legitimate DHCP servers and untrusted ports where rogue servers might be located.
- **Static IP Address Assignments for Critical Devices**: Assign static IP addresses to critical network devices to ensure they are not impacted by rogue DHCP assignments.
- **Network Segmentation**: Divide the network into smaller, manageable segments or VLANs. Limit DHCP services to authorized segments to reduce the potential impact of rogue servers.
- **Regular Network Scanning and Monitoring**: Use network monitoring tools to detect unusual DHCP traffic or unauthorized devices acting as DHCP servers. Regularly scanning the network helps in identifying and mitigating rogue DHCP servers promptly.
- **Implement Security Policies and Access Control**: Ensure that only authorized personnel can connect devices to the network. Use port-based authentication methods like 802.1X to control access to the network, reducing the risk of unauthorized devices setting up rogue DHCP servers.
- Disable unused ports
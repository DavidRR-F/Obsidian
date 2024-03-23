
**What It Is**: VLAN hopping is a network attack method in which an attacker exploits vulnerabilities in the VLAN configuration to gain unauthorized access to traffic on other VLANs (Virtual Local Area Networks) that would normally be inaccessible. VLANs are used to segment network traffic into separate, isolated groups to improve security and reduce congestion. VLAN hopping circumvents these isolation measures, allowing attackers to eavesdrop on sensitive data or spread attacks across the network.

### How It Works:

VLAN hopping can be executed primarily through two methods:

### 1. **Switch Spoofing**:

An attacker configures a device to mimic a network switch's behavior, engaging in trunking with a legitimate switch. Since trunk ports carry traffic for multiple VLANs, the attacker’s device can then access traffic across these VLANs. This method relies on the legitimate switch being incorrectly configured to dynamically form trunk links with other devices.

#### Dynamic Trunking Protocol (DTP)

**What It Is**: Dynamic Trunking Protocol (DTP) is a proprietary networking protocol developed by Cisco Systems that is used on their switches and networking gear. DTP facilitates the automatic negotiation of trunking between switch ports, enabling the connection between switches to carry traffic from multiple VLANs (Virtual Local Area Networks). Trunk ports are essential for VLAN configurations, as they allow for the passage of traffic associated with several VLANs across a single physical link between switches.

#### Functionality:

- DTP automatically negotiates whether a switch port should be put into access mode (part of a single VLAN) or trunk mode (able to carry multiple VLAN traffic).
- It works by exchanging DTP frames between switches to establish a trunk link if both sides are set to a compatible mode.

#### How DTP Is Exploited in Switch Spoofing

**The Exploit**:

- **Switch Spoofing Attack**: This type of attack occurs when an attacker configures a device to mimic a switch's behavior, tricking another switch into forming a trunk link with it. By doing so, the attacker's device can receive traffic from all VLANs passing through the trunk, enabling the attacker to eavesdrop on sensitive data or inject malicious traffic into multiple VLANs.

**The Role of DTP**:

- DTP can facilitate switch spoofing attacks when switches are configured to negotiate trunking automatically. If an attacker's device sends DTP frames indicating it wishes to form a trunk link, a vulnerable switch might automatically agree to this request and start sending it traffic for all VLANs.
- This vulnerability primarily arises from the default configuration on some switches where ports are set to dynamically negotiate their trunking status, potentially allowing an unauthorized device to set up a trunk link without explicit permission.

#### Protection Measures

**Mitigating Switch Spoofing Attacks**:

- **Disable DTP on Unused Ports**: Configuring unused switch ports to a non-negotiable and disabled state can prevent unauthorized devices from attempting to negotiate a trunk link.
- **Manually Configure Trunk Ports**: Instead of relying on DTP to negotiate trunk links, administrators can manually configure trunk ports and specify which VLANs are allowed across them. This practice ensures that trunk links are only established where explicitly intended.
- **Use Dedicated VLANs for Trunk Links**: Implement a dedicated VLAN that does not serve user data for all trunk port native VLANs to limit the exposure of sensitive traffic.
- **Enable Port Security**: Features like port security can limit the number of MAC addresses seen on a port or restrict access to the port based on MAC address, reducing the risk of unauthorized devices establishing a trunk link.

### 2. **Double Tagging**:

In a double tagging attack, the attacker sends frames with two VLAN tags. The first tag matches the attacker’s native VLAN, which is stripped away by the first switch the frame encounters. The second tag is intended for a target VLAN. Since switches typically do not inspect the second tag, the frame can be routed to the target VLAN without restrictions. This method works even if the switch is correctly configured not to form dynamic trunk links, but it requires the attacker to be in the same VLAN as the switch's trunk port.

### Protection Measures:

- **Disable Dynamic Trunking Protocol (DTP)**: Manually configure switch ports as either access or trunk ports and disable DTP on all ports where trunking is not necessary. This prevents unauthorized devices from forming a trunk connection with the switch.
- **Set Native VLAN to a Dummy VLAN**: Configure all trunk ports to use a VLAN that carries no sensitive data as their native VLAN. This measure mitigates the risk of double tagging attacks.
- **Use Private VLANs**: Private VLANs provide an additional layer of isolation between devices on the same VLAN, reducing the potential impact of VLAN hopping.
- **Implement VLAN Access Control Lists (VACLs)**: VACLs can be used to filter traffic between VLANs, blocking unauthorized attempts to access or traverse VLANs.
- **Regularly Audit and Monitor VLAN Configurations**: Periodic security audits and continuous monitoring of VLAN configurations help identify and rectify misconfigurations or suspicious activities that could lead to VLAN hopping.
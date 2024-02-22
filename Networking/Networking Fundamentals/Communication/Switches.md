**Switching** is the process of moving data within a network. **Switches** are a device whose primary purpose is switching. Therefore, devices communicating through a switch belong to the same IP Network.

Switches are L2 devices - they only use Level 2 header information to make decisions

Switches use and maintain a MAC Address Table which maps switch ports to MAC addresses

Initially the MAC Address table starts out empty but as the data flows through it will begin populating the table

![[Pasted image 20240221142022.png]]

Switches perform three actions:

- **Learn**: Update MAC Address Table with mapping of Switch Port to Source MAC
![[Pasted image 20240221143100.png]]

- **Flood**: Duplicate and send frame out to all switch ports
![[Pasted image 20240221143545.png]]

- **Forward**: Use MAC Address Table to deliver frame to appropriate switch port
![[Pasted image 20240221160201.png]]

## Unicast vs. Broadcast

- **Unicast Frame**: destination MAC is another host. the Switch will flood only if the MAC address is not in MAC address table (i.e. flood action)

- **Broadcast Frame**: destination MAC address of FFFF.FFFF.FFFF. Broadcast frames are always flooded (i.e. on a ARP request)

Broadcast = Type of Frame
Flood = Switch Action

# VLANs - Virtual Local Area Networks

Divides Switch Ports into isolated groups
Divides Switches into multiple "mini-switches"
Each VLAN will contain its own MAC Address Table and perform the 3 switch actions independently of one another

![[Pasted image 20240221162352.png]]

**Note**: In a MAC Address Table a single port value can be assigned multiple MAC Addresses so in a Multi-Switch Setup we would see tables as follows using the same switch actions as previous

![[Pasted image 20240221164159.png]]
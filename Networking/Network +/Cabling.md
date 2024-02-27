
### Coaxial Cable

**Description**: Coaxial cable, or coax, consists of a central conductor surrounded by an insulating layer, a metallic shield, and an outer insulating layer. This design helps reduce electromagnetic interference (EMI), making coaxial cables suitable for transmitting high-frequency signals over longer distances compared to twisted pair cables.

**Applications**: Coaxial cables are used in cable television systems, internet connections, and telephone networks. They were once the standard for Ethernet networks but have largely been replaced by twisted pair and fiber optic cables for this purpose.

![[Pasted image 20240226203103.png]]

- **Type**: RG-6
- **Characteristic Impedance**: 75 ohms
- **Common Connector Types**: F-Type, BNC

**Description**: RG-6 is a common type of coaxial cable used in residential and commercial applications, including cable television (CATV), internet service provision via cable, and increasingly for satellite installations. The 75-ohm impedance is optimized for these applications, balancing signal loss over distance with the need for flexibility and ease of installation.

**F-Type Connector**: Widely used for cable television, internet service provision via cable, and satellite television. It screws on and provides a secure connection for RF signals.

**BNC Connector**: Used in professional and commercial audio/video equipment. BNC connectors offer a twist-lock mechanism, making them suitable for situations where a secure connection is essential to prevent accidental disconnection.

**Advantages**: Highly resistant to electromagnetic interference (EMI) and physical damage

**Note** twinax = coax but with 2 inner connectors
### Twisted Pair Cable

**Description**: Twisted pair cable consists of pairs of insulated copper wires twisted together. Twisting reduces electromagnetic interference from external sources and cross-talk from adjacent pairs. Twisted pair cables come in two types: shielded (STP) and unshielded (UTP), with UTP being more common in networking.

**Applications**: Twisted pair cables are widely used in telecommunications and computer networks, including Ethernet. UTP cables are commonly used for local area networks (LANs) and in many business and home environments.

![[Pasted image 20240226203407.png]]

- **Type**: Cat5e (Category 5 enhanced) / Cat6 (Category 6)

| Type  | Distance   | Max Bandwith                                          |
| :---- | ---------- | ----------------------------------------------------- |
| Cat5  | 100 meters | 100 Mbps up to 1 Gbps                                 |
| Cat5e | 100 meters | 1 Gbps (Better EMI Protection)                        |
| Cat6  | 55 meters  | 10 Gbps (only up to 55 meters with 10GBASE-T network) |
| Cat7  | 100 meters | 10+ Gbps                                              |
| Cat8  | 100 meters | 25 Gbps (40 Gbps at 30 meters, 40GBASE-T network)     |

- **Characteristic Impedance**: 100 ohms
- **Common Connector Type**: RJ45

### UTP (Unshielded Twisted Pair)

- **Shielding**: None. UTP cables rely solely on the twisting of the wire pairs to reduce electromagnetic interference and crosstalk.
- **Common Use**: UTP is the most commonly used type of twisted pair cabling for both residential and commercial networking. It's used for a variety of applications, including Ethernet networks, telephone systems, and video applications. UTP cables are easier to install and less expensive than STP cables because they are lighter and more flexible, and they do not require grounding.
- **Categories**: There are several categories of UTP cables, such as Cat5e, Cat6, and Cat6a, each supporting different bandwidths and transmission speeds.

### STP (Shielded Twisted Pair)

- **Shielding**: STP cables include a shield that surrounds the twisted wire pairs. This shield can be a foil or a braided mesh, or both, providing an additional layer of protection against electromagnetic interference from external sources. The shield needs to be grounded properly to be effective.
- **Common Use**: STP is used in environments where there is a high risk of electromagnetic interference (EMI), such as in industrial settings or alongside many electrical cables. It is also used for certain types of network cabling where additional signal integrity is required.
- **Categories**: Like UTP, STP cables also come in various categories, supporting different specifications and uses. However, due to the added complexity of the shielding, STP cables are generally more expensive and harder to install than UTP cables.

**Description**: Cat5e and Cat6 are common types of twisted pair cables used in Ethernet networks. They are designed with a characteristic impedance of 100 ohms. Cat5e supports speeds up to 1 Gbps, while Cat6 is designed for speeds up to 10 Gbps over shorter distances. Both are widely used in residential and commercial LAN installations.

**RJ45 Connector**: The standard connector for both Cat5e and Cat6 cables in Ethernet networks. It's an 8-pin connector that supports the high-speed data transmission required by modern Ethernet networks. RJ45 connectors are used for connecting computers, switches, routers, and other network devices.

### Fiber Optic Cable

**Description**: Fiber optic cables use strands of glass or plastic fibers to transmit data as light signals. This allows for much higher speeds and longer transmission distances than metal cables. Fiber optic cables are immune to electromagnetic interference and offer higher security against eavesdropping.

**Applications**: Fiber optic cables are used for internet backbones, broadband access, and long-distance telecommunications. They are increasingly used in place of traditional cabling for LANs in environments requiring high bandwidth or where electromagnetic interference is a concern.

![[Pasted image 20240226203454.png]]

- **Type**: Single-Mode (SMF) / Multi-Mode (MMF)
- **Characteristic**: Not applicable in terms of ohms; characterized instead by core diameter and mode.
- **Common Connector Types**: LC, SC, ST

**Description**:

- **Single-Mode Fiber (SMF)**: Designed for long-distance communication, it has a small core (around 9 micrometers in diameter) that allows only one mode of light to propagate. This minimizes signal degradation over distance. Cable Color Yellow, Uses Lasers
- **Multi-Mode Fiber (MMF)**: Used for shorter distances, it has a larger core (50 or 62.5 micrometers) that supports multiple modes of light. MMF is typically used within buildings or campuses where high data rates are needed over relatively short distances. Cable Color Orange, Uses LED

Connectors:

Fibber Optic Cables use duplex connectors.

![[Pasted image 20240226205827.png]]

- **LC Connector**: A small form-factor fiber optic connector typically used in data communications and telecommunications. LC stands for Lucent Connector and is popular for its high-density applications.
- **SC Connector**: Square Connector or Standard Connector features a push-pull design and is used for telecommunication and networking applications. SC connectors are known for their performance and reliability.
- **ST Connector**: Straight Tip connector utilizes a bayonet twist-lock mechanism. It's commonly used in network environments, including fiber optic Ethernet, though less common in modern installations compared to LC and SC connectors.
- **FC Connector**: threaded metal connector that screws on securely to the mating part, providing a stable and robust connection for single-mode and multi-mode fiber optic cable

### Polishing

Fiber optic connectors require precise polishing to ensure optimal performance and minimize signal loss. The end-face of the fiber optic connector is polished in various ways to achieve the desired quality of connection. The three main types of fiber optic polishing are:

### 1. Physical Contact (PC)

- **Description**: PC polish results in a slightly curved end-face, ensuring that the fiber cores come into direct physical contact with each other. This curvature eliminates the air gaps between the fibers, significantly reducing back reflection (the reflection of light back into the fiber), which can degrade the signal quality. PC polish is the most common method used for single-mode and multi-mode fiber connections.
- **Reflection Level**: Low, better than a flat polish but not as good as more advanced methods.

### 2. Ultra Physical Contact (UPC)

- **Description**: UPC polish further improves upon the PC polish by creating a finer, more dome-shaped end-face. This higher degree of polish further reduces back reflections and improves signal quality. UPC connectors are easily identifiable by their blue color for single-mode fibers. They are widely used in digital, CATV, and telephony systems, where lower back reflection and higher performance are required.
- **Reflection Level**: Very low, offering better performance in terms of signal integrity and lower insertion loss compared to PC polished connectors.

### 3. Angled Physical Contact (APC)

- **Description**: APC polish introduces a precise 8-degree angle to the end-face of the fiber, instead of polishing it flat or with a slight curve. This angle directs back reflections away from the fiber core, further minimizing signal degradation. APC connectors are often green and are used in applications where back reflection must be minimized as much as possible, such as in high-speed networks and dense wavelength division multiplexing (DWDM) systems.
- **Reflection Level**: Extremely low, making it ideal for high bandwidth and long-distance applications where back reflection could significantly impact performance.

## Fire Ratings

Fire ratings for cabling refer to the cable's ability to resist fire and not produce toxic smoke or fumes when exposed to heat. The most common ratings are:

- **Plenum**: Plenum-rated cables are designed to be used in spaces used for air circulation for heating, ventilation, and air-conditioning systems, known as plenum spaces. These cables have a fire-retardant jacket that produces minimal smoke and no toxic fumes.
- **Riser**: Riser-rated cables are designed to prevent fire from spreading between floors through vertical shafts or risers. They are less expensive than plenum cables but have more fire resistance than general-use cables.
- **PVC (Polyvinyl Chloride)**: PVC cables are used in areas without special fire resistance requirements. They are not rated for use in plenum or riser spaces because they can produce toxic smoke when burned.
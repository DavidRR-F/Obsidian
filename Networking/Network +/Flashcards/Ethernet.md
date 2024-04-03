---
flashcard: true
---


🃟 Flaschcard: (-1, 0, Ethernet) (: What is an Ethernet Frame) (: a digital data transmission unit used in Ethernet networks, the most widely implemented form of local area networks (LANs)
❌️🃟 Flaschcard: (-1, 0, Ethernet) (: a digital data transmission unit used in Ethernet networks, the most widely implemented form of local area networks (LANs)) (: What is an Ethernet Frame)

🃟 Flaschcard: (-1, 0, Ethernet) (: What is the Ethernet Frame Structure) (: ![[Pasted image 20240228182410.png]])
🃟 Flaschcard: (-1, 0, Ethernet) (: ![[Pasted image 20240228182410.png]]) (: What is the Ethernet Frame Structure)

🃟 Flaschcard: (-1, 0, Ethernet) (: What is the Ethernet Frame Preamble) (: A sequence of bytes used to signal the start of the frame transmission and to enable synchronization between the transmitting and receiving devices. It is 7 bytes long and consists of alternating 1s and 0s, ending with two consecutive 1s)
🃟 Flaschcard: (-1, 0, Ethernet) (: A sequence of bytes used to signal the start of the frame transmission and to enable synchronization between the transmitting and receiving devices. It is 7 bytes long and consists of alternating 1s and 0s, ending with two consecutive 1s) (: What is the Ethernet Frame Preamble)

🃟 Flaschcard: (-1, 0, Ethernet) (: What is the Ethernet Start Frame Delimiter - SFD) (: A 1-byte field that marks the end of the preamble and the start of the frame's actual addressing information. It is typically set to the binary sequence 10101011)
🃟 Flaschcard: (-1, 0, Ethernet) (: A 1-byte field that marks the end of the preamble and the start of the frame's actual addressing information. It is typically set to the binary sequence 10101011) (: What is the Ethernet Start Frame Delimiter - SFD)

🃟 Flaschcard: (-1, 0, Ethernet) (: What is the Ethernet Frame Destination MAC Address) (: A 6-byte field specifying the Media Access Control (MAC)
❌️🃟 Flaschcard: (-1, 0, Ethernet) (: A 6-byte field specifying the Media Access Control (MAC) address of the intended recipient of the frame. MAC addresses are unique identifiers assigned to network interfaces) (: What is the Ethernet Frame Destination MAC Address)

🃟 Flaschcard: (-1, 0, Ethernet) (: What is the Ethernet Frame Source MAC Address) (: A 6-byte field that contains the MAC address of the frame's sender. This helps the receiving device identify the source of the data)
🃟 Flaschcard: (-1, 0, Ethernet) (: A 6-byte field that contains the MAC address of the frame's sender. This helps the receiving device identify the source of the data) (: What is the Ethernet Frame Source MAC Address)

🃟 Flaschcard: (-1, 0, Ethernet) (: What is the Ethernet Frame EtherType) (: A 2-byte field that can serve two purposes. It can indicate the type of payload protocol (e.g., IPv4, IPv6, ARP)
❌️🃟 Flaschcard: (-1, 0, Ethernet) (: A 2-byte field that can serve two purposes. It can indicate the type of payload protocol (e.g., IPv4, IPv6, ARP) when the value is greater than 1500, or it indicates the size of the payload in bytes when the value is 1500 or less) (: What is the Ethernet Frame EtherType)

🃟 Flaschcard: (-1, 0, Ethernet) (: What is the Ethernet Frame Frame Check Sequence - FCS) (: A 4-byte field at the end of the frame used for error checking. It contains a cyclic redundancy check (CRC)
❌️🃟 Flaschcard: (-1, 0, Ethernet) (: A 4-byte field at the end of the frame used for error checking. It contains a cyclic redundancy check (CRC) value computed from the frame's contents (excluding the preamble and SFD). The receiving device recalculates the CRC for the received frame and compares it to this FCS value to detect any errors in transmission) (: What is the Ethernet Frame Frame Check Sequence - FCS)

🃟 Flaschcard: (-1, 0, Ethernet) (: What is 100BaseT) (: A version of Ethernet technology that supports data transfer rates of up to 100 megabits per second (Mbps)
❌️🃟 Flaschcard: (-1, 0, Ethernet) (: A version of Ethernet technology that supports data transfer rates of up to 100 megabits per second (Mbps), carries only Ethernet signals on the medium, and connects via twisted pair cabling) (: What is 100BaseT)

🃟 Flaschcard: (-1, 0, Ethernet) (: What is 100BaseTX) (: The most common form of 100BaseT, which uses two pairs of Category 5 (or higher)
❌️🃟 Flaschcard: (-1, 0, Ethernet) (: The most common form of 100BaseT, which uses two pairs of Category 5 (or higher) twisted pair cables. One pair is used for transmitting data, and the other is used for receiving data. This variant is designed for use in most office and home networking environments) (: What is 100BaseTX)

🃟 Flaschcard: (-1, 0, Ethernet) (: What is 100BaseT4) (: operates over Category 3 (or higher)
❌️🃟 Flaschcard: (-1, 0, Ethernet) (: operates over Category 3 (or higher) twisted pair cables and uses four pairs of wires. It was intended to support environments with existing Category 3 installations, allowing them to upgrade to 100 Mbps speeds without replacing cabling) (: What is 100BaseT4)

🃟 Flaschcard: (-1, 0, Ethernet) (: What is 100BaseT2) (: used only two pairs of Category 3 (or higher)
❌️🃟 Flaschcard: (-1, 0, Ethernet) (: used only two pairs of Category 3 (or higher) twisted pair cables, similar to 100Base-TX but with the capability to work on lower-quality cables. It was intended as a more economical upgrade path for networks with existing Category 3 cabling but has seen limited adoption) (: What is 100BaseT2)

🃟 Flaschcard: (-1, 0, Ethernet) (: What is the 1000Base series) (: part of the Gigabit Ethernet standards defined by the IEEE 802.3, offers a variety of cabling and distance options tailored for different networking environments. Each variant is designed to support data transmission speeds of up to 1 gigabit per second (Gbps)
❌️🃟 Flaschcard: (-1, 0, Ethernet) (: part of the Gigabit Ethernet standards defined by the IEEE 802.3, offers a variety of cabling and distance options tailored for different networking environments. Each variant is designed to support data transmission speeds of up to 1 gigabit per second (Gbps), but they differ in the type of cabling they use and the distances they can cover) (: What is the 1000Base series)

🃟 Flaschcard: (-1, 0, Ethernet) (: What is 1000BaseCX) (: also known as Gigabit over Copper (GOC)
❌️🃟 Flaschcard: (-1, 0, Ethernet) (: also known as Gigabit over Copper (GOC), was one of the earliest Gigabit Ethernet standards designed for short-distance communication over shielded twisted-pair (STP) cabling. Maximum length is 25 meters) (: What is 1000BaseCX)

🃟 Flaschcard: (-1, 0, Ethernet) (: What is 1000BaseSX) (: a Gigabit Ethernet standard designed for high-speed data transmission over multimode fiber optic cable. It primarily uses short-wavelength laser (850 nm)
❌️🃟 Flaschcard: (-1, 0, Ethernet) (: a Gigabit Ethernet standard designed for high-speed data transmission over multimode fiber optic cable. It primarily uses short-wavelength laser (850 nm) for data transmission.  It can achieve distances up to 550 meters, depending on the type and quality of the multimode fiber used) (: What is 1000BaseSX)

🃟 Flaschcard: (-1, 0, Ethernet) (: What is 1000BaseLX) (: fiber optic-based Gigabit Ethernet standard.  It typically uses long-wavelength laser (1300 nm)
❌️🃟 Flaschcard: (-1, 0, Ethernet) (: fiber optic-based Gigabit Ethernet standard.  It typically uses long-wavelength laser (1300 nm) for data transmission.  can operate over both single-mode and multimode fiber optic cables.  On single-mode fiber, it can reach distances up to 5 kilometers, and on multimode fiber, it can achieve distances up to 550 meters) (: What is 1000BaseLX)

🃟 Flaschcard: (-1, 0, Ethernet) (: What is 1000BaseT) (: Gigabit Ethernet standard for copper twisted pair cabling. It is the most common form of Gigabit Ethernet, designed to operate over Category 5e or higher cabling.  Category 5e or higher unshielded twisted pair (UTP)
❌️🃟 Flaschcard: (-1, 0, Ethernet) (: Gigabit Ethernet standard for copper twisted pair cabling. It is the most common form of Gigabit Ethernet, designed to operate over Category 5e or higher cabling.  Category 5e or higher unshielded twisted pair (UTP) copper cabling.  Maximum length 100 meters) (: What is 1000BaseT)

🃟 Flaschcard: (-1, 0, Ethernet) (: What is 10GBase series) (: refers to a range of standards for 10 Gigabit Ethernet (10GbE)
❌️🃟 Flaschcard: (-1, 0, Ethernet) (: refers to a range of standards for 10 Gigabit Ethernet (10GbE) over various types of media, including copper and fiber optic cables) (: What is 10GBase series)

🃟 Flaschcard: (-1, 0, Ethernet) (: What is 10GbaseT) (: supports 10 Gbps over unshielded or shielded twisted-pair cables.  Category 6a (Class Ea)
❌️🃟 Flaschcard: (-1, 0, Ethernet) (: supports 10 Gbps over unshielded or shielded twisted-pair cables.  Category 6a (Class Ea) or higher for distances up to 100 meters) (: What is 10GbaseT)

🃟 Flaschcard: (-1, 0, Ethernet) (: What is 10GBaseSR) (: designed for short-range data transmission using multimode fiber. Multimode fiber optic cables.  Up to 300 meters, depending on the type of multimode fiber used)
🃟 Flaschcard: (-1, 0, Ethernet) (: designed for short-range data transmission using multimode fiber. Multimode fiber optic cables.  Up to 300 meters, depending on the type of multimode fiber used) (: What is 10GBaseSR)

🃟 Flaschcard: (-1, 0, Ethernet) (: What is 10GBaseLR) (: intended for long-range transmission over single-mode fiber.  Single-mode fiber optic cables. Up to 10 kilometers.)
🃟 Flaschcard: (-1, 0, Ethernet) (: intended for long-range transmission over single-mode fiber.  Single-mode fiber optic cables. Up to 10 kilometers.) (: What is 10GBaseLR)

🃟 Flaschcard: (-1, 0, Ethernet) (: What is 10GBaseER) (: extends the range further than 10GBaseLR, also using single-mode fiber.  Single-mode fiber optic cables.  Up to 40 kilometers.)
🃟 Flaschcard: (-1, 0, Ethernet) (: extends the range further than 10GBaseLR, also using single-mode fiber.  Single-mode fiber optic cables.  Up to 40 kilometers.) (: What is 10GBaseER)

🃟 Flaschcard: (-1, 0, Ethernet) (: What is SONET) (: a North American standard for synchronous data transmission over optical fibers. In other words, SONET is a standardized digital communication protocol. SONET transmits and multiplexes multiple data streams across a fiber optic cable)
🃟 Flaschcard: (-1, 0, Ethernet) (: a North American standard for synchronous data transmission over optical fibers. In other words, SONET is a standardized digital communication protocol. SONET transmits and multiplexes multiple data streams across a fiber optic cable) (: What is SONET)

🃟 Flaschcard: (-1, 0, Ethernet) (: What is a Transciever) (: a device that combines both transmission and receiving capabilities into a single unit)
🃟 Flaschcard: (-1, 0, Ethernet) (: a device that combines both transmission and receiving capabilities into a single unit) (: What is a Transciever)

🃟 Flaschcard: (-1, 0, Ethernet) (: What is a Half Duplex) (: data transmission can occur in both directions between two devices, but only one direction at a time)
🃟 Flaschcard: (-1, 0, Ethernet) (: data transmission can occur in both directions between two devices, but only one direction at a time) (: What is a Half Duplex)

🃟 Flaschcard: (-1, 0, Ethernet) (: What is Full Duplex) (: enable simultaneous data transmission between two devices in both directions)
🃟 Flaschcard: (-1, 0, Ethernet) (: enable simultaneous data transmission between two devices in both directions) (: What is Full Duplex)






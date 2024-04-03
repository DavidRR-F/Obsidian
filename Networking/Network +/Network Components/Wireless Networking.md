
# 802.11 - Wireless Standard

The 802.11 standard refers to a family of specifications developed by the IEEE (Institute of Electrical and Electronics Engineers) for wireless LAN (WLAN) technology. It outlines the protocols for implementing wireless networking communications in various frequency bands, including 2.4, 5, and 60 GHz, among others. The 802.11 standards define how radio frequency (RF) in the unlicensed ISM (Industrial, Scientific, and Medical) bands is used for transmitting data between devices, ensuring compatibility and interoperability between wireless devices.

### Key Features of the 802.11 Standard

- **Data Transmission over Wi-Fi**: The standard provides the basis for wireless network products using the Wi-Fi brand.
- **Frequency Bands and Channels**: It specifies the use of various frequency bands for transmitting data wirelessly, with certain standards designed for specific bands (e.g., 2.4 GHz or 5 GHz).
- **Modulation Techniques**: It defines modulation schemes that dictate how data is encoded into radio waves.
- **Security Protocols**: Over time, the 802.11 standard has included various security protocols to protect wireless networks, such as WEP (Wired Equivalent Privacy), WPA (Wi-Fi Protected Access), and WPA2 (Wi-Fi Protected Access II).

### SSID (Service Set Identifier)

- **Definition**: The SSID is the name of a wireless network. It is a unique identifier that allows devices to distinguish between multiple wireless networks within range. When you scan for Wi-Fi networks on your device, the list of network names you see are the SSIDs broadcasted by nearby routers or access points.
- **Purpose**: The primary purpose of an SSID is to manage access to a wireless network. By selecting a specific SSID, a device attempts to establish a connection to the corresponding network.
- **Broadcasting**: Wireless routers and access points can be configured to either broadcast the SSID, making the network name visible to devices scanning for Wi-Fi networks, or hide the SSID, requiring users to know the network name beforehand to connect.

### WAP (Wireless Access Point)

- **Definition**: A WAP, or Wireless Access Point, is a networking hardware device that allows wireless-capable devices to connect to a wired network. It bridges wireless devices to a network, typically an Ethernet, and can extend the range of an existing network.
- **Purpose**: WAPs are used to provide wireless network connectivity in a designated area, such as in homes, offices, or public places. They enable devices like smartphones, laptops, and tablets to connect to the network and access internet services without physical cables.
- **Configuration**: In addition to serving as standalone devices, WAP functionality can be integrated into residential gateways, routers, or network switches. WAPs support various Wi-Fi standards (e.g., 802.11n, 802.11ac) and configurations, including security settings like WEP, WPA, or WPA2, to protect the wireless network.

### Notable 802.11 Standards

Several versions of the 802.11 standard have been released since its inception, each providing enhancements in terms of speed, range, and reliability. Some of the most widely used and recognized standards include:

- **802.11a**: Offers speeds up to 54 Mbps in the 5 GHz band.
- **802.11b**: Provides up to 11 Mbps in the 2.4 GHz band, known for its longer range compared to 802.11a.
- **802.11g**: Combines the best of both 802.11a and 802.11b, offering speeds up to 54 Mbps in the 2.4 GHz band.
- **802.11n (Wi-Fi 4)**: Introduces MIMO (Multiple Input Multiple Output) technology to increase bandwidth up to 600 Mbps and range, operating in both 2.4 GHz and 5 GHz bands.
- **802.11ac (Wi-Fi 5)**: Provides significant improvements over 802.11n, with higher throughput in the 5 GHz band, offering speeds up to several Gbps. MU-MIMO (Multiuser MIMO)
- **802.11ax (Wi-Fi 6)**: The latest standard as of my last update, focusing on improving efficiency, especially in dense environments, with theoretical speeds up to 9.6 Gbps between 1 GHz and 6 GHz.

### RSSI

RSSI, standing for Received Signal Strength Indicator, is a measure of the power level that a wireless device is receiving from a signal source, such as a Wi-Fi router or a cellphone tower. It is typically measured in decibels from 0 (zero) down to -120dBm and is used by wireless communication devices to gauge the strength of an available wireless signal.

### Key Points about RSSI:

- **Measurement Unit**: RSSI values are expressed in decibels from 0 (zero) to -120dBm. A higher (closer to 0) RSSI value indicates a stronger signal. For example, -60dBm is a stronger signal than -75dBm.
- **Relative Measure**: RSSI is a relative index and does not correspond to a specific power level. The interpretation of RSSI values can vary between devices and manufacturers, meaning that an RSSI value of -70dBm from one device cannot be directly compared to the same value on another device without accounting for their respective RSSI scales.
- **Signal Quality**: While RSSI is a good indicator of signal strength, it does not directly translate to signal quality. Other factors, such as noise and interference, can affect the quality of a wireless connection even if the RSSI is high.
- **Use Cases**: RSSI is used in various applications to make decisions about wireless connectivity. For instance, a smartphone might use RSSI to determine which Wi-Fi network to connect to, or a wireless access point may use RSSI to decide when to hand off a device to another access point in larger networks.


# Wireless Security Standards

WEP, WPA, and WPA2 are security protocols designed to provide secure wireless networking. As Wi-Fi technology has evolved, so too have the methods for securing wireless network connections against unauthorized access and eavesdropping. These protocols are part of the Wi-Fi Protected Access standards developed by the Wi-Fi Alliance.

### WEP (Wired Equivalent Privacy)

**Introduction**: WEP was introduced in 1997 as part of the original 802.11 standard. It was designed to provide wireless networks with a level of security comparable to that of a wired network.

**Key Characteristics**:

- Uses a static key for encrypting data between devices and the access point.
- Supports key lengths of 64 and 128 bits.

**Limitations**:

- WEP has significant security vulnerabilities that make it relatively easy to crack within minutes using readily available software tools.
- The static nature of the key and flaws in the encryption algorithm lead to its deprecation.

### WPA (Wi-Fi Protected Access)

**Introduction**: Introduced in 2003 to address the security flaws of WEP and provide a secure method for wireless networking without requiring new hardware.

**Key Characteristics**:

- Implements Temporal Key Integrity Protocol (TKIP) for dynamic key generation, which changes keys for each packet, significantly improving security over WEP.
- Includes a Message Integrity Check (MIC) to protect against packet forgery.

**Limitations**:

- While more secure than WEP, vulnerabilities in TKIP were eventually discovered, making it less secure than its successor, WPA2.

### WPA2 (Wi-Fi Protected Access 2)

**Introduction**: Launched in 2004, WPA2 is an enhancement of WPA and provides stronger data protection and network access control.

**Key Characteristics**:

- Introduces the Advanced Encryption Standard (AES) for data encryption, replacing TKIP. AES is considered very secure and is used by the U.S. government for securing classified information.
- Includes Counter Mode Cipher Block Chaining Message Authentication Code Protocol (CCMP) for data integrity and authentication, an improvement over TKIP.
- Mandatory for all new Wi-Fi devices to be certified by the Wi-Fi Alliance since 2006.

**Limitations**:

- Although WPA2 is robust, the introduction of WPA3 addresses limitations and vulnerabilities found in WPA2, such as KRACK (Key Reinstallation Attack).

### Conclusion

Over time, Wi-Fi security protocols have evolved significantly:

- **WEP** is now considered obsolete due to its vulnerabilities and should not be used.
- **WPA** improved upon WEP but has been surpassed by WPA2 in terms of security.
- **WPA2** has been the standard for secure Wi-Fi networks, providing strong encryption with AES. However, users are encouraged to adopt **WPA3**, the latest security protocol, as it addresses some of the vulnerabilities that have been discovered in WPA2 and enhances overall wireless security.
# Antennas

Antennas are crucial components of wireless communication systems, converting electrical signals into radio waves and vice versa. Different types of antennas offer various radiation patterns and functionalities, making them suitable for specific applications. Here's an overview of the antennas mentioned: omni, dipole, patch, and directional/Yagi.

### Omni-Directional Antenna

- **Characteristics**: An omni-directional antenna radiates and receives signals in all horizontal directions equally, forming a 360-degree radiation pattern. This makes it ideal for covering a broad area from a central location.
- **Use Cases**: Commonly used in wireless routers, mobile devices, and situations where uniform coverage is needed, such as in home Wi-Fi networks or public Wi-Fi hotspots.

![[Pasted image 20240317150545.png]]
### Dipole Antenna

- **Characteristics**: A dipole antenna consists of two conductive elements such as metal rods, with a length approximately half the wavelength of the intended frequency. It radiates and receives energy equally in two opposite directions, making its pattern resemble a figure-eight when viewed from the side.
- **Use Cases**: Dipole antennas are the simplest and most widely used type of antenna in various applications, including as the basic element in more complex antennas. They're often used in routers and base stations as the default antenna.

![[Pasted image 20240317145902.png]]

### Patch Antenna

- **Characteristics**: Also known as a microstrip antenna, a patch antenna is a type of low-profile antenna that is mounted on a flat surface. It consists of a flat rectangular sheet or "patch" of metal, mounted over a larger sheet of metal called the ground plane. The radiation pattern is typically directional over the hemisphere above the patch.
- **Use Cases**: Patch antennas are commonly used in mobile devices and for fixed wireless points such as cellular base stations, WLAN access points, and in applications where space or antenna profile is a constraint.

![[Pasted image 20240317150001.png]]

### Directional/Yagi Antenna

- **Characteristics**: A Yagi antenna, or Yagi-Uda antenna, is a directional antenna consisting of a driven element (typically a dipole or folded dipole) and additional elements known as directors and reflectors. This arrangement creates a highly directional radiation pattern, focusing the energy in one direction to increase range and signal strength.
- **Use Cases**: Yagi antennas are used when a strong directional signal is needed, such as in point-to-point communication links, television reception, and long-range Wi-Fi networks. They're effective for extending wireless connections over long distances between fixed points.

![[Pasted image 20240317150212.png]]

## Parabolic Antenna

A parabolic antenna, also known as a parabolic dish antenna or dish antenna, is a high-gain reflector antenna that operates using a parabolic reflector, a curved surface with the cross-sectional shape of a parabola. The parabolic shape enables the antenna to focus incoming radio waves onto a small area (the feed or focal point), or conversely, to take energy from a source located at the focal point and emit it as a narrow beam of radio waves, typically in a specific direction. This design allows for high directivity and gain, making parabolic antennas ideal for long-distance communication links, including point-to-point communication, satellite communication, radio telescopes, and radar systems.

![[Pasted image 20240402135936.png]]
### Understanding Antenna Gain

- **Directionality**: Antenna gain indicates how well the antenna focuses energy in a given direction. High-gain antennas can send and receive signals more effectively at greater distances in their preferred direction but have reduced performance outside this direction. Conversely, low-gain antennas spread the energy more evenly in all directions, providing broader coverage but over shorter distances.
- **Reference Antennas**: Gain is measured relative to a reference antenna. The most common references are the isotropic radiator (an idealized antenna radiating equally in all directions, dBi) and the dipole antenna (dBd). The isotropic radiator is theoretical and does not exist in practice, but it provides a useful baseline for comparing antennas.
    - **dBi (decibels relative to isotropic)**: Gain compared to an isotropic radiator. This is the most commonly used measure because it provides a comparison to an ideal omnidirectional antenna.
    - **dBd (decibels relative to dipole)**: Gain compared to a half-wave dipole antenna. Since a dipole antenna has a gain of 2.15 dBi, to convert dBd to dBi, you add 2.15 dB to the dBd value.

### Factors Affecting Antenna Gain

- **Antenna Design**: The physical design and elements of the antenna, such as length, shape, and materials, significantly influence its gain. For example, adding more elements to a Yagi antenna increases its gain.
- **Frequency**: Gain can also depend on the frequency of operation. Generally, antennas are more directive (and thus have higher gain) at higher frequencies.

### Importance of Antenna Gain

- **Communication Range**: High-gain antennas can enhance the communication range by focusing the power more narrowly in a desired direction. This is particularly useful in point-to-point wireless links.
- **Signal Quality**: In directional systems, a higher gain can lead to better signal quality and lower noise levels, improving the overall performance of the communication system.
- **Application-Specific Requirements**: Different applications require different antenna gains. For instance, a Wi-Fi router in a home might use an antenna with relatively low gain to cover all areas of the house equally, while a directional link, such as a microwave link between two buildings, would use high-gain antennas to ensure a strong, focused signal over the long distance.

In summary, antenna gain is a critical parameter that reflects the antenna's ability to direct its power and thus its effectiveness in transmitting and receiving signals over distances. The choice of antenna gain for a specific application depends on the required coverage pattern, distance, and the surrounding environment.

### Geo-IP

Geo-IP, short for Geographic Internet Protocol, refers specifically to the process of mapping an IP address to a geographical location. This method relies on databases that contain information about which IP addresses are allocated to different regions around the world. By looking up an IP address in a Geo-IP database, one can determine the country, region, city, and sometimes even the specific area or ISP (Internet Service Provider) associated with that IP address.

**Characteristics**:

- **Accuracy**: The accuracy of Geo-IP can vary significantly. It is generally reliable at the country level, but its accuracy diminishes for more specific locations.
- **Use Cases**: Geo-IP is widely used for content localization, access control (geofencing), digital rights management, targeted advertising, and fraud detection.

### Geolocation

Geolocation is a broader term that encompasses any method used to determine the geographical location of an internet-connected device. This includes not only IP-based methods (Geo-IP) but also techniques that use GPS data, Wi-Fi positioning, cell tower triangulation, and other sensor data available on a device. Geolocation can provide much more precise location information, especially when GPS or similar technologies are used.

# Wireless Scenarios

Troubleshooting wireless network issues involves identifying the root cause and implementing the appropriate solution. Here’s how to address common scenarios such as interference, connectivity problems, slow wireless networks due to overcapacity, and antenna problems.

### 1. Interference

**Scenario**: Devices experience erratic connectivity, slow speeds, or dropped connections due to interference from other wireless signals or electronic devices.

**Troubleshooting Steps**:

- **Identify Interference Sources**: Common sources include cordless phones, microwave ovens, Bluetooth devices, and neighboring Wi-Fi networks. Use a Wi-Fi analyzer tool to detect interference sources.
- **Change Wi-Fi Channels**: Switch your Wi-Fi network to a less crowded channel, preferably one that does not overlap with other nearby networks.
- **Upgrade to 5GHz**: If you're using a 2.4GHz band, which is more prone to interference, consider switching to the 5GHz band if your devices support it, as it offers more channels and is less congested.

### 2. Can't Connect to the Internet

**Scenario**: Devices are connected to the Wi-Fi network but cannot access the internet.

**Troubleshooting Steps**:

- **Check Modem and Router**: Ensure your modem and router are powered on and properly connected. Try rebooting both devices.
- **Verify ISP Connection**: Confirm that there’s no outage in your area by contacting your Internet Service Provider (ISP) or checking their status page.
- **Check DHCP Settings**: Ensure your router’s DHCP server is enabled to automatically assign IP addresses to devices. Verify that you haven't exceeded the number of devices your router can support.

### 3. Can't Get on Wireless Network

**Scenario**: Devices are unable to detect or connect to the wireless network.

**Troubleshooting Steps**:

- **Verify SSID and Security Key**: Ensure the network's SSID (name) is broadcasted and that you're entering the correct security key.
- **Check for MAC Address Filtering**: If enabled on your router, ensure your device’s MAC address is allowed on the network.
- **Update Network Drivers and Firmware**: Ensure your device’s wireless network drivers and your router’s firmware are up to date.

### 4. Slow Wireless Network (Overcapacity)

**Scenario**: The wireless network is slow due to a high number of connected devices or bandwidth-intensive applications.

**Troubleshooting Steps**:

- **Limit Connected Devices**: Disconnect any devices that are not in use. Consider setting limits on the number of devices that can connect simultaneously.
- **Prioritize Traffic**: Use Quality of Service (QoS) settings on your router to prioritize bandwidth for critical or high-demand applications.
- **Upgrade Your Plan or Equipment**: If overcapacity is a frequent issue, consider upgrading your internet plan for higher speeds or upgrading your router to a model that supports more devices and higher throughput.

### 5. Antenna Problems

**Scenario**: Weak signal strength or poor coverage due to issues with the router’s antennas.

**Troubleshooting Steps**:

- **Reposition Antennas**: Ensure the router’s antennas are properly attached and optimally positioned—usually vertical—to maximize coverage.
- **Reposition the Router**: Place the router in a central location away from obstructions and reflective surfaces like mirrors and windows.
- **Antenna Upgrades**: Consider replacing the router’s antennas with high-gain antennas if the router supports them, or use Wi-Fi extenders to boost coverage in large areas.

### General Tips

- Always start troubleshooting by checking the most basic potential issues, such as power supply and cable connections.
- Updating firmware and drivers can resolve a wide range of issues.
- Documenting changes and systematically addressing one potential issue at a time can help in identifying the root cause.
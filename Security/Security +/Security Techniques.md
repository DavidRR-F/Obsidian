## Wireless Infrastructure Security

**ESS**: *Extended Service Set*, Involves multiple wireless access points working together to create a unified and extended coverage area for users in a large building or facility

**Adjacent Channel Interference**: Occurs when the channels selected for adjacent wireless access points do not have enough space between them

**Co Channel Interference**: Two WAP providing overlapping coverage in the same area using the same frequency

**Heat Map**: Graphical representation of the wireless coverage, the signal strength, and frequency utilization data at different locations on a map

## Wireless Security Settings

Wireless encryption and cryptographic protocols protect wireless networks by securing data from interception

**WEP**: Outdated 1999 wireless security standard meant to match wired LAN security for wireless networks. Uses a fixed encryption key for all devices on the same network to secure messages (64-bit and 128-bit). *It is insecure because of a weak 24-bit initialization vector*

**WPA**: Introduced in 2003 as a temporary improvement over WEP while the more robust IEEE 802.11i standard was in development. WPA improved security with *TKIP*, which generates new 128-bit keys for each packet, eliminating WEP's key-reuse vulnerabilities. Due to TKIP vulnerabilities, WPA was susceptible to cryptographic attacks, underscoring the need for advanced wireless security. *Insecure because of the lack of sufficient data integrity checks in the TKIP implementation*

**WPA2**: Improved data protection and network access control by addressing weaknesses in WPA version. Replaced TKIP with AES and adopted CCMP for stronger encryption, *Vulnerable to the KRACK Attack*

**WPA3**: Latest version using AES encryption and introducing new features like SAE, Enhanced Open, updated cryptographic protocols, and management protection frames
- ***SAE***: *Simultaneous Authentication of Equals*, Enhances security by offering a key establishment protocol to guard against offline dictionary attacks
	- Provides stronger protection even with weak passwords
	- Simplifies security setup
- ***OWE***: *Enhanced Open/Opportunistic Wireless Encryption*, Major advancement in wireless security, especially for networks using open authentication
	- Improves user privacy and security by guarding against eavesdropping attacks in public Wi-Fi settings
- ***AES GCMP***: *Galois Counter Mode Protocol*, Supports 128-bit AES for personal networks and 192-bit AES for  enterprise networks with WPA3
- ***Management Protection Frames***: Required to protect network from key recovery attacks and prevents eavesdropping, forging, and tampering of frames

### Authentication Services

**RADIUS**: *Remote Authentication Dial-In User Service*, Client/server protocol offering AAA services for network users
- ***AAA***: Authentication, Authorization, and Accounting Protocol, Centralizes user authentication to permit only authorized users to access network resources
- Used for secure network access, confirming user identities via a central server and enforcing predefined access rules
- Aids in monitoring user activity to ensure accountability and security policy enforcement

**TACACS+**: *Terminal Access Controller Access-Control System Plus*, Separates the functions of AAA to allow for a more granular control over processes
- Uses TCP and encrypts authentication for improved security over older AAA protocols

### Authentication Protocols

**EAP**: *Extensible Authentication Protocol*, Authentication framework that supports multiple authentication methods

**PEAP**: *Protected Extensible Authentication Protocol*, Authentication protocol that secures EAP within an encrypted and authenticated *TLS tunnel*
- *Certificate (server/client)*

**EAP-TTLS**: *Extensible Authentication Protocol-Tunneled Transport Layer Security*, Authentication protocol that extends TLS support across multiple platforms
- *Certificate(server)*

**EAP-FAST**: *Extensible Authentication Protocol-Flexible Authentication via Secure Tunneling*, Developed by Cisco, it enables secure re-authentication  while roaming within a network without full authentication each time
- Developed to replace LEAP due to security vulnerabilities in the latter

## Application Security

Critical aspect of software development that focuses on building applications that are secure by design

**Input Validation**: Acts as a gatekeeper to ensure that applications only act on well-defined and uncontaminated data
- ***Validation Rules***: Rules that delineate acceptable and unacceptable inputs

**Cookies**: Small pieces of data stored on the user's computer by the web browser while browsing a website
- Transmitted over secure HTTPS connections to prevent potential eavesdroppers from intercepting the cookie data
- Refrain from utilizing persistent cookies for session verification
- Enable HttpOnly attribute in the cookie

**SAST**: Static Code Analysis, A method of debugging an application by reviewing and examining its source code before the program is ever run
- Usually performed using software analyzers or manual code review

**Dynamic Code Analysis**: Testing method that analyzes an application while it's running
- ***Fuzzing***: Finds software flaws by bombarding it with random data to trigger crashes and security vulnerabilities
- ***Stress Testing***: Type of software testing that evaluates the stability and reliability of a system under extreme conditions

**Code Signing**: Technique used to confirm the identity of the software author and guarantee that the code has not been altered or corrupted since it was signed

**Sandboxing**: Security mechanism that is used to isolate running programs by limiting the resources they can access and the changes they can make to a system

## NAC - Network Access Control

Scans devices for their security status before granting network access, safeguarding against both known and unknown devices 

When a device attempts to connect to the network, it's placed into a virtual holing area while it's being scanned

If a device clears the inspection, it gains access to the network's organizational resources. Else it is placed into a digital quarantine to receive updates, patching, or any other missing security configurations

After meeting the requirements, the device is again granted full network access

- **Persistent Agent**: A software installed on a device requesting network access

- **Non-Persistent Agent**: Users connect to Wi-Fi, access a web portal, and click a link for login in these solutions

NAC can be either software or hardware defined and uses the *IEEE Standard 802.1x*

## Web and DNS Filtering

**Web Filtering**: Also known as content filtering, is a technique used to restrict or control the content a user can access on the Internet

- ***Agent-based***: Installing a small piece of software known as an agent on each device that will require web filtering
- ***Centralized Proxy***: Server that acts as an intermediary between an organization's end users and the Internet
- ***URL Scanning***: Used to analyze a website's URL to determine if it is sage or not to access
- ***Content Categorization***: Websites are categorized based on content, like social media, adult content, or gambling, which are frequently restricted in workplaces
- ***Block Rules***: Specific guidelines set by an organization to present access to certain websites or categories of websites
- ***Reputation-based Filtering***: Blocking or allowing websites based on their reputation score

**DNS Filtering***: Technique used to block access to certain websites by preventing the translation of specific domain names to their corresponding IP addresses 

## Email Security

**DKIM**: *Domain Keys Identified Mail*, Allows the receiver to check if the email was actually sent by the domain it claims to be sent from and if the content was tempered with during transit
- Email Authentication
- Protection against Email Spoofing
- Improved Email Deliverability

**SPF**: *Sender Policy Framework*, Email authentication method designed to percent forging sender addresses during email delivery
- Preventing Email Spoofing
- Improving Email Deliverability
- Enhanced Domain's Reputation

**DMARC**: *Domain-based Message Authentication, Reporting, and Conformance*, An email-validation system designed to detect and prevent email spoofing
- Email Compromise Attacks 
- Phishing Emails
- Email Scams

**Email Gateway**: Sever or system that serves as the entry and exit point for emails
- Email Routing
- Email Security
- Policy Enforcement
- Encryption and Decryption

**Spam Filtering**: Process of detecting unwanted and unsolicited emails and preventing them from reaching a user's email inbox
- Content analysis
- Bayesian filtering
- DNS-based sinkhole list
- General email filtering rules

## EDR - Endpoint Detection Response

Category of security tools that monitor endpoint and network events and record the information in a central database. Works by continuously monitoring and gathering data from endpoints

### Steps

1. Data Collection
2. Data Consolidation
3. Threat Detection
4. Alerts and Threat Response
5. Threat Investigation
6. Remediation

**FIM**: *File Integrity Monitoring*, Used to validate the integrity of operating system and application software files using a verification method between the current file state and known, good baseline

**XDR**: *Extended Detection and Response*, Security strategy that integrates multiple protection technologies into a single platform to improve detection accuracy and simplify the incident response process

## User Behavior Analytics

Deploys big data and machine learning to analyze user behaviors for detecting security threats

UBA aims to spot anomalies in established patterns, indicating potential threats

### Use Cases
1. Early detection of threats
2. Insider Threat Detection
3. Improved Incident response


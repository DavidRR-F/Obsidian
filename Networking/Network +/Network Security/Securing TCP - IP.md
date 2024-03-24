CIA - Confidentiality, Integrity, Availability
# Encryption

## Symmetric Encryption

Symmetric encryption is a method of cryptography where the same key is used for both encryption and decryption of messages. This shared secret key is used by both the sender and the receiver to encode and decode the transmitted data. Symmetric encryption is one of the oldest and most widely used methods of encryption and forms the basis of many security protocols used to protect data both in transit and at rest.

### Key Characteristics

- **Speed**: Symmetric encryption algorithms are generally faster than asymmetric encryption algorithms, making them suitable for encrypting large volumes of data.
- **Key Management**: The main challenge with symmetric encryption is the secure distribution and management of the secret key. Both parties must have access to the key, but it must be kept secret from unauthorized users.
- **Examples of Algorithms**: Common symmetric encryption algorithms include AES (Advanced Encryption Standard), DES (Data Encryption Standard), 3DES (Triple Data Encryption Standard), and Blowfish.

### How Symmetric Encryption Works

1. **Encryption**: The sender uses the symmetric key to encrypt the plaintext message, turning it into ciphertext using an encryption algorithm. This process scrambles the data in such a way that it becomes unreadable to anyone who does not have the key.
2. **Transmission**: The encrypted message (ciphertext) is then transmitted over a network or stored. Since the message is encrypted, its contents are secure against unauthorized access.
3. **Decryption**: The receiver, who possesses the same symmetric key, uses it to decrypt the ciphertext back into the original plaintext message using the corresponding decryption algorithm.

### Uses of Symmetric Encryption

Symmetric encryption is used in a variety of applications, including:

- **Securing Data at Rest**: Encrypting files on a disk or database entries to protect sensitive information from unauthorized access.
- **Securing Data in Transit**: Encrypting data being transferred over networks, such as in secure file transfers and secure communication protocols like HTTPS.
- **Wireless Security**: Encrypting data in wireless networks, such as with WPA2 (Wi-Fi Protected Access 2) for securing Wi-Fi networks.

## Asymmetric Encryption

Asymmetric encryption, also known as public key cryptography, is a cryptographic system that uses pairs of keys: public keys, which may be disseminated widely, and private keys, which are known only to the owner. This approach to encryption enables secure communication and data exchange over insecure channels without the need for the sender and receiver to share a secret key beforehand.

### Key Characteristics

- **Two Keys**: Each participant has a key pair—a public key for encryption and a private key for decryption. The public key encrypts data, and its corresponding private key decrypts it. The reverse can also be true for digital signatures, where data encrypted with a private key can only be decrypted with its corresponding public key, verifying the authenticity of the sender.
- **Security**: The strength of asymmetric encryption lies in the difficulty of deriving the private key from the public key, which is based on hard mathematical problems, such as the factorization of large prime numbers in RSA.
- **Examples of Algorithms**: Popular asymmetric encryption algorithms include RSA (Rivest-Shamir-Adleman), ECC (Elliptic Curve Cryptography), and DH (Diffie-Hellman).

### How Asymmetric Encryption Works

1. **Key Generation**: A user generates a pair of keys, keeping the private key secret while distributing the public key openly.
2. **Encryption**: To send a secure message to the key owner, a sender encrypts the message using the recipient’s public key. Only the recipient's private key can decrypt the message, ensuring its confidentiality.
3. **Decryption**: Upon receiving the encrypted message, the recipient uses their private key to decrypt it back into the original plaintext.

### Uses of Asymmetric Encryption

- **Secure Communication**: Enables secure message exchange over the Internet, such as in email encryption and SSL/TLS for secure web browsing.
- **Digital Signatures**: Provides a means for verifying the authenticity and integrity of digital documents and messages. The sender encrypts a message or document hash with their private key. Recipients use the sender's public key to verify the signature, ensuring the message hasn't been altered and confirming the sender's identity.
- **Key Exchange**: Facilitates the secure exchange of symmetric keys for encrypting larger data transmissions. Asymmetric encryption is often used to securely exchange a symmetric key, which is then used for the session's duration due to its efficiency over asymmetric encryption for large data volumes.

### Advantages and Disadvantages

**Advantages**:

- Eliminates the need for the sender and receiver to share a secret key in advance.
- Enhances security for digital signatures and secure key distribution.

**Disadvantages**:

- Significantly slower than symmetric encryption, making it less suitable for encrypting large amounts of data.
- Computational complexity leads to higher resource consumption.

# Cryptographic Hashes

Cryptographic hashes are algorithms that take an arbitrary amount of data input (a message) and produce a fixed-size string of bytes, typically a digest that is unique to each unique input. The output, or hash value, acts like a digital fingerprint of the input data. Cryptographic hash functions are designed to be one-way operations, meaning it is computationally infeasible to reverse the operation or to find the original input data from the hash value. This characteristic, among others, makes cryptographic hashes a cornerstone of modern cybersecurity practices.

### Key Properties of Cryptographic Hash Functions

1. **Deterministic**: The same input will always produce the same output, no matter how many times the hash function is executed.
2. **Fast Computation**: The hash function can process any size of data quickly and return a hash value in a short amount of time.
3. **Pre-image Resistance**: Given a hash value, it should be infeasible to reconstruct the original input data.
4. **Small Changes Produce Big Differences**: Even a tiny change in the input data (like changing one bit) will produce a significantly different output hash.
5. **Collision Resistance**: It should be extremely difficult to find two different inputs that produce the same output hash.

### Common Uses of Cryptographic Hash Functions

- **Data Integrity Verification**: Hashes are widely used to verify the integrity of data transmitted over potentially insecure networks. If the hash value of the received data matches the hash value of the original data, the integrity of the data is confirmed.
- **Password Storage**: Instead of storing passwords directly, systems store the hash value of passwords. When a user logs in, the system hashes the input password and compares it with the stored hash. This way, even if the data storage is compromised, the actual passwords are not exposed.
- **Digital Signatures**: Hash functions are used in creating digital signatures. A message is hashed, and then the hash is encrypted with a private key. The recipient can decrypt the hash with the corresponding public key and compare it to the hash of the original message to verify both its source and integrity.
- **Blockchain and Cryptocurrencies**: Cryptographic hashes are fundamental to the operation of blockchains and cryptocurrencies. They are used to create a secure and immutable ledger of transactions.

### Examples of Cryptographic Hash Functions

- **MD5**: Once widely used, MD5 has been found to be vulnerable to collision attacks and is now considered broken and unsuitable for further use in security-sensitive applications.
- **SHA-1**: Similar to MD5, SHA-1 has also been deprecated for most security uses due to vulnerabilities to collision attacks.
- **SHA-256 and SHA-3**: Part of the Secure Hash Algorithm 2 and 3 families, these hash functions are currently considered secure and are widely used in various cryptographic applications.

# 3 Steps of Authentication

Identification, authentication, and authorization are three distinct but interconnected processes in the context of security systems. Together, they form a comprehensive approach to ensuring that users are who they claim to be and that they have appropriate access to resources. Here's an overview of each process:

### 1. Identification

Identification is the process by which a system recognizes an entity (usually a user) based on a unique identifier. It's essentially the act of claiming an identity. This could involve entering a username, an email address, or presenting some form of ID card. Identification tells the system who the entity claims to be but does not prove the entity's claim.

**Example**: Entering a username into a login form.

### 2. Authentication

Authentication is the process of verifying the identity claimed during identification. It involves validating that the entity is actually who or what it claims to be, typically by checking whether the entity possesses something only they should have or knows something only they should know. Authentication mechanisms can include passwords, biometric data, security tokens, or a combination of these for multi-factor authentication (MFA).

**Example**: After entering a username (identification), the user is prompted to enter a password (authentication). If the password matches what's stored in the system for that username, the user's identity claim is verified.

### 3. Authorization

Authorization occurs after identification and authentication. It is the process of determining whether an authenticated entity is allowed to access and perform operations on a given resource or system. Authorization checks if the user has the necessary permissions or rights to perform a requested action, such as reading a file, executing a command, or accessing data.

**Example**: Once a user is authenticated, the system checks the user's permissions to see if they are allowed to access a specific file or application. If the user has the appropriate permissions, access is granted; otherwise, it is denied.

# Access Control

### Mandatory Access Control (MAC)

MAC is a security model in which access rights are assigned based on regulations from a central authority. It is considered the most stringent form of access control.

- **Key Characteristics**:
    - Access decisions are made by the operating system or security kernel, based on settings configured by the system administrator.
    - Users and data owners cannot alter permissions.
    - Each object (like files and directories) and subject (like users and processes) is assigned a classification label (e.g., confidential, secret, top secret).
- **Use Cases**: MAC is often used in environments requiring a high level of security, such as military or government systems, where data classification and confidentiality are paramount.

### Discretionary Access Control (DAC)

DAC is a model where the access rights are determined by the owner of the resources. In DAC, the owner has the discretion to grant or revoke access to others.

- **Key Characteristics**:
    - Resource owners decide on access levels for other users.
    - Permissions are typically managed using Access Control Lists (ACLs) that specify which users or groups can access an object and what actions they can perform.
- **Use Cases**: DAC is widely used in general-purpose computing environments where the focus is on enabling collaboration and resource sharing, such as file systems in Windows and Unix/Linux.

### Role-Based Access Control (RBAC)

RBAC restricts system access to authorized users based on their roles within an organization. Access rights are grouped by role name, and access to resources is restricted to users based on their assigned roles.

- **Key Characteristics**:
    - Simplifies management and assignment of permissions by associating roles with specific duties and responsibilities.
    - Users are assigned roles, and roles are assigned permissions. Users acquire permissions by being members of roles.
    - Supports the principle of least privilege, ensuring users receive only the access necessary to perform their roles.
- **Use Cases**: RBAC is suitable for both small and large organizations where roles can be clearly defined, such as in corporate, educational, and government environments. It's particularly effective in managing complex permissions and compliance requirements.

- MAC - uses labels
- DAC - gives owners control over permissions
- RBAC uses groups


# AAA protocols
## Radius

RADIUS (Remote Authentication Dial-In User Service) is a networking protocol that provides centralized Authentication, Authorization, and Accounting (AAA) management for users who connect and use a network service. RADIUS was originally designed for dial-up network access but has since been widely adopted for broader network access control, including wireless networks, VPNs (Virtual Private Networks), and more. RADIUS uses UDP ports 1812-1813 or UDP ports 1645-1646

![[Pasted image 20240311213601.png]]
### Key Components of RADIUS

1. **RADIUS Server**: The central component that manages access control policies and accounting for network access. It receives authentication requests, verifies users against a database, and returns responses that grant or deny access. It also handles accounting records to track the duration and usage of the network services.
    
2. **RADIUS Client**: Typically a network access server (NAS) or a VPN gateway that acts as an intermediary between the end-user and the RADIUS server. The RADIUS client sends user authentication requests to the RADIUS server and enforces the access control response it receives.
    
3. **Supplicant**: The end-user or device attempting to access the network. The supplicant provides credentials to the RADIUS client, which are then forwarded to the RADIUS server for authentication.
    

### Functions of RADIUS

- **Authentication**: Verifies the identity of users attempting to access the network by checking their credentials (such as username and password or digital certificates) against a database. This process ensures that only authorized users can access the network.
    
- **Authorization**: Determines what an authenticated user is allowed to do on the network, including access levels, connection time, allowed services, and other usage parameters. Authorization is based on policies set on the RADIUS server.
    
- **Accounting**: Keeps track of users' network usage details, such as session duration, data volume transmitted and received, and the start and end time of each session. This information can be used for billing, auditing, and monitoring network usage.
    

### Advantages of RADIUS

- **Centralized Management**: RADIUS centralizes authentication, authorization, and accounting management, simplifying network administration and policy enforcement.
    
- **Scalability**: It can support a large number of authentication requests, making it suitable for both small and large networks.
    
- **Compatibility**: RADIUS is widely supported by various network equipment manufacturers and software providers, ensuring compatibility across different devices and networks.
    
- **Security**: Supports various authentication methods, including PAP, CHAP, EAP, and others, to secure data transmission between the supplicant, RADIUS client, and server.

## TACACS+

TACACS+ (Terminal Access Controller Access-Control System Plus) is an advanced protocol used for remote authentication and access control to network devices and resources. It is an enhancement of the original TACACS protocol, designed to provide a more secure and flexible method for managing access to networks and systems. TACACS+ is commonly used in large networks, particularly those that include a variety of networking equipment from different vendors. TACACS+ uses TCP port 49

### Key Features of TACACS+

- **Separation of Authentication, Authorization, and Accounting (AAA)**: Unlike its predecessor and some other protocols like RADIUS, TACACS+ separates the AAA processes. This separation allows for more granular control over access and auditing and provides the flexibility to use different servers or methods for each function if desired.
    
- **Encryption**: TACACS+ encrypts the entire body of the packet (but not the header), providing confidentiality for the user's credentials and the control data exchanged between the TACACS+ client and server. This is a significant security improvement over older versions and other protocols that may only encrypt the password.
    
- **Granular Control**: TACACS+ allows for detailed control over commands that users can execute on routers, switches, and other network devices. This level of control makes it ideal for environments where precise management of user permissions is necessary.
    
- **Multi-Factor Authentication Support**: TACACS+ can integrate with multi-factor authentication mechanisms, offering enhanced security for accessing critical network infrastructure.
    

### Components of TACACS+

- **TACACS+ Server**: The central authority that performs authentication, authorization, and accounting. It holds user credentials and access policies, processes AAA requests from clients, and logs accounting data.
    
- **TACACS+ Client**: Usually a network device (like a router or switch) that requires a user to authenticate before granting access. The client communicates with the TACACS+ server to perform AAA functions based on configured policies.
    
- **User**: The individual or system attempting to access resources managed by the TACACS+ client. The user must provide credentials (and possibly additional authentication factors) that the TACACS+ server validates.
    

### TACACS+ vs. RADIUS

While TACACS+ and RADIUS are both AAA protocols, they have distinct differences and use cases:

- **Protocol Focus**: TACACS+ is more focused on providing access control for network infrastructure devices (like routers and switches), whereas RADIUS is used more broadly for network access control, including wireless and remote access services.
    
- **Encryption**: TACACS+ encrypts the entire packet body, offering more secure data transmission than RADIUS, which only encrypts the user's password.
    
- **Flexibility**: The separation of the AAA processes in TACACS+ offers more flexibility and granular control over access permissions and auditing, making it preferred in environments that require detailed command-level authorization.
    

### Use Cases

TACACS+ is ideally suited for enterprise networks and data centers with complex access control requirements and a need for detailed auditing and accounting. It's particularly useful in multi-vendor environments where network devices from various manufacturers need a common protocol for access control.

# Kerberos

Kerberos is a network authentication protocol designed to provide strong authentication for client/server applications by using secret-key cryptography. Developed in the 1980s at the Massachusetts Institute of Technology (MIT) as part of Project Athena, Kerberos has become a standard for secure authentication in various distributed systems, especially in many Microsoft Windows network environments.

### How Kerberos Works

Kerberos authentication relies on a trusted third party, known as the Key Distribution Center (KDC), which consists of two main components: the Authentication Server (AS) and the Ticket Granting Server (TGS). Here is a simplified overview of the Kerberos authentication process:

1. **Authentication Request**: When a user (or client) wishes to access a service (server), the user's client software requests access from the KDC, initially contacting the AS.
2. **AS Response**: The AS responds by providing a Ticket Granting Ticket (TGT) encrypted with the user's password-derived key and a session key for communication with the TGS. The user decrypts the TGT using their password.
3. **TGT to TGS**: The user then sends a request to the TGS, including the TGT and the name of the service they wish to access. The TGS decrypts the TGT, verifies the request, and issues a service ticket.
4. **Accessing the Service**: The client presents the service ticket to the target server. The server decrypts the ticket, verifies its validity, and grants access to the user.

### Key Features of Kerberos

- **Mutual Authentication**: Kerberos provides mutual authentication, where both the client and the server verify each other's identity.
- **Single Sign-On (SSO)**: Kerberos allows users to authenticate once (at login) and gain access to multiple services without re-authenticating.
- **Delegated Authentication**: Kerberos can delegate authentication, allowing a service to act on behalf of a user to access another service.
- **Encryption**: Kerberos ensures the confidentiality and integrity of data by encrypting communication between the client and server.

### Advantages of Kerberos

- **Security**: The use of strong cryptography makes Kerberos a secure authentication method that is difficult to breach.
- **Reduced Password Exposure**: Passwords are not sent over the network, reducing the risk of interception.
- **Scalability**: Kerberos is suitable for large distributed systems.

### Limitations and Considerations

- **Dependency on Clock Synchronization**: Kerberos requires that the clocks of the involved hosts be synchronized within a configured tolerance, as ticket validity is time-sensitive.
- **Single Point of Failure**: The KDC represents a single point of failure in the Kerberos authentication model. If the KDC is unavailable, new authentication requests cannot be processed.
- **Kerberizing Applications**: Applications must be specifically designed or configured to use Kerberos for authentication, which can add complexity to deployment.

### Use Cases

Kerberos is widely used in various environments, particularly in:

- Enterprise networks for securing login and access to network resources.
- Distributed systems and applications requiring secure, authenticated communication.
- Environments requiring SSO capabilities to simplify user access to multiple services.

# EAP

EAP (Extensible Authentication Protocol) is a framework widely used in wireless networks and point-to-point connections to provide flexible authentication mechanisms. Initially developed for use in PPP (Point-to-Point Protocol) connections, EAP has been adapted for use in various other contexts, most notably in IEEE 802.1X, which is an access control protocol for networks.

### How EAP Works

EAP is not an authentication mechanism by itself but rather a framework that supports multiple authentication methods, including token cards, Kerberos, One-Time Passwords (OTP), smart cards, certificates, and public key encryption methods. It operates at the Data Link Layer of the OSI model, allowing it to be used over a variety of media, including Ethernet, Wi-Fi, and cellular telecommunication networks.

EAP typically involves three parties:

1. **Supplicant**: The client device that wishes to be authenticated.
2. **Authenticator**: A network device, such as an access point or switch, that acts as an intermediary, passing authentication messages between the supplicant and the authentication server.
3. **Authentication Server**: The server that verifies the authenticity of the supplicant. It often uses RADIUS or Diameter protocols to manage authentication data.

### EAP Process

1. **Initiation**: The authentication process begins when the supplicant attempts to connect to the network and is prompted by the authenticator to provide credentials.
2. **EAP Exchange**: The supplicant and the authentication server exchange EAP messages, encapsulated within the authenticator's protocol (like RADIUS messages if the authenticator is an access point using 802.1X for control access).
3. **Method Negotiation**: The EAP framework allows the authentication server to request more information or a different authentication method if needed. The supplicant and the authentication server negotiate the authentication method to be used.
4. **Authentication**: Depending on the negotiated method, the supplicant provides the required authentication credentials (e.g., username and password, certificate, etc.).
5. **Success or Failure**: If the authentication server verifies the credentials as valid, it sends a success message to the supplicant through the authenticator. If the authentication fails, a failure message is sent.

### EAP Methods

Several EAP methods exist, each with different security characteristics and use cases. Some of the widely used EAP methods include:

- **EAP-TLS (Transport Layer Security)**: Uses certificates for mutual authentication, providing a high security level.
- **EAP-TTLS (Tunneled Transport Layer Security)** and **PEAP (Protected EAP)**: Create an encrypted TLS tunnel for secure client authentication, allowing the secure transmission of credentials.
- **EAP-SIM and EAP-AKA**: Designed for use in cellular networks, using SIM (Subscriber Identity Module) and AKA (Authentication and Key Agreement) mechanisms, respectively.

### Uses and Considerations

EAP is extensively used in enterprise Wi-Fi security (WPA and WPA2 enterprise modes) and in VPNs for its flexibility in supporting various authentication mechanisms. While EAP allows for robust security, the choice of EAP method significantly impacts the security level. Some methods, like EAP-TLS, provide strong security assurances, whereas others may have vulnerabilities or limitations. Proper configuration and an understanding of the security properties of the chosen EAP method are crucial for maintaining secure authentication in network access.

- For local area networks, Use Windows Active Directory for single sign-on
- SAML is used to manage multiple apps using a single account
- SSOcircle provides a variety of service

# Certificates and Trust

Certificates, specifically digital certificates in the context of cybersecurity, play a crucial role in establishing secure communications over networks. They are integral to various security protocols, including SSL/TLS for secure web browsing. Digital certificates serve as a form of digital identity for entities like websites, individuals, or organizations, enabling the verification of their authenticity and facilitating encrypted communication. Here's how digital certificates work, focusing on their use in SSL/TLS for secure web transactions:

### Components of Digital Certificates

A digital certificate typically includes:

- **Public Key**: The certificate holder's public key.
- **Identity Information**: Information about the certificate holder, such as the organization's name or the individual's email address.
- **Issuer Information**: Details about the Certificate Authority (CA) that issued the certificate.
- **Digital Signature**: The CA's digital signature, verifying the certificate's authenticity.
- **Validity Period**: The timeframe during which the certificate is considered valid.

### How Digital Certificates Work

1. **Certificate Issuance**:
    
    - An entity (such as a website operator) generates a public and private key pair.
    - The entity sends a Certificate Signing Request (CSR) to a Certificate Authority (CA), containing its public key and identity information.
    - The CA verifies the entity's identity, signs the certificate with its private key, and issues the signed certificate to the entity.
2. **Certificate Use in SSL/TLS**:
    
    - A user (client) connects to a website (server) and requests a secure connection.
    - The server sends its digital certificate to the client.
    - The client verifies the server's certificate:
        - **Check the CA's signature**: The client uses the CA's public key (pre-installed in the client's system or web browser) to verify the CA's digital signature on the certificate.
        - **Validate the certificate**: The client checks that the certificate is not expired, has not been revoked, and matches the server's domain name.
    - Once verified, the client uses the server's public key (from the certificate) to encrypt a shared secret and sends it to the server.
    - The server decrypts the shared secret using its private key, establishing a secure, encrypted communication channel using the shared secret for symmetric encryption.

### Trust Model

The trust in digital certificates is based on a hierarchical trust model with root Certificate Authorities at the top. Intermediate CAs, certified by root CAs, can also issue certificates. Web browsers and operating systems maintain a list of trusted root CA certificates. If a certificate is signed by a trusted CA, it is automatically accepted as authentic.

### Uses of Digital Certificates

- **Secure Web Browsing**: Encrypting data exchanged between a web browser and a server, indicated by "https://" in the URL.
- **Email Encryption**: Securing email communications.
- **Code Signing**: Verifying the integrity and origin of software code.
- **VPN Access**: Securing connections to Virtual Private Networks.
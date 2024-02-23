**Protocols**: a set of rules and messages that form an internet standard.

## Internet Connectivity

Every host needs four items for internet connectivity:

- IP Address - Host's Identity on the Internet
- Subnet mask - Size of the Host's network
- Default Gateway - Router's IP Address
- DNS Server IP(s) - Translate domain names to IPs

## DHCP - Dynamic Host Configuration Protocol

A DHCP Server provides a IP, Subnet mask, Default Gateway, and DNS Server IP for any client. Whenever a host connects to a new network it sends a DHCP discover message the DHCP server can then respond with the information required to connect to the internet

![[Pasted image 20240223095332.png]]

## DNS - Domain Name System

DNS uses a DNS Server to convert a domain name into an IP Address. When a client wants to access a website or send and email in your domain the client will request the Servers IP through the DNS Server

#### Web Server

![[Pasted image 20240223093448.png]]

#### SMTP Server

![[Pasted image 20240223093733.png]]

## ARP - Address Resolution Protocol - RFX 826

- Resolves IP to MAC mapping
- ARP Requests / ARP Responses

## FTP - File Transfer Protocol

#### 1. **Connection Establishment**

- **Control Connection**: The FTP client begins by establishing a control connection to the FTP server on TCP port 21. This connection is used for sending commands from the client to the server and receiving responses. The control connection remains open throughout the session for command exchange.

- **Login Process**: After establishing the control connection, the client sends login credentials (username and password) to the server. Some servers also allow anonymous FTP, where users can log in using a standard username (often `anonymous`) and their email address as the password.

#### 2. **Requesting a File Transfer**

- After a successful login, the client can send commands to navigate the server's directory structure, list files, and request file transfers.

- The commands include operations like `CD` (change directory), `LS` (list files), `GET` (download a file from the server to the client), and `PUT` (upload a file from the client to the server).

#### 3. **Data Connection Establishment**

- For each file transfer request, the FTP server and client establish a separate data connection through which the actual file data is transferred.

- **Active Mode**: In active mode, the client opens a random port, informs the server of this port, and the server initiates the data connection to the client's specified port.

- **Passive Mode**: In passive mode, to accommodate clients behind firewalls or NAT (Network Address Translation), the server opens a random port and informs the client. The client then initiates the data connection to the server's specified port.

#### 4. **File Transfer**

- Once the data connection is established, the file transfer begins based on the client's request (either upload or download).

- FTP supports transferring files in binary mode or ASCII mode, selected based on the file type to ensure correct data format transmission.

#### 5. **Connection Closure**

- After the file transfer is complete, the data connection is closed.

- The client can initiate more commands over the control connection if additional transfers are needed. When all transactions are complete, the control connection is closed using a `QUIT` command.

## SMTP - Simple Mail Transfer Protocol

#### 1. **Mail Submission**

- The process begins when a user composes an email and hits the send button in their email client (e.g., Outlook, Thunderbird, or a web-based email service).

- The email client submits the email to an SMTP server, usually provided by the email service or Internet Service Provider (ISP). This submission often occurs on TCP port 587, which is reserved for email message submission with authentication.

#### 2. **SMTP Authentication**

- The SMTP server may require authentication from the client, which involves providing a username and password. This step helps to prevent unauthorized use of the SMTP server for sending spam or malicious emails.

#### 3. **Mail Processing**

- Once authenticated, the SMTP server processes the outgoing email. It looks at the domain of the recipient's email address (the part after the `@`) and determines the destination SMTP server by querying the Domain Name System (DNS) for the Mail Exchange (MX) records of the recipient's domain.

#### 4. **Mail Transmission**

- The sending SMTP server establishes a connection to the recipient's SMTP server on TCP port 25 (the standard port for SMTP communication) and transmits the email.
- If the recipient's server is unreachable at the time of sending, the SMTP server may queue the email and attempt retransmission later.

#### 5. **Relaying**

- Emails often pass through multiple SMTP servers (relays) before reaching the final destination. Each SMTP server along the path is responsible for moving the email closer to its final destination.

#### 6. **Delivery to Mailbox**

- Once the email reaches the recipient's SMTP server, the server will typically hand off the email to a mail delivery agent (MDA) or store it directly in the recipient's mailbox.

- The recipient then accesses the email using a mail retrieval protocol such as POP3 (Post Office Protocol version 3) or IMAP (Internet Message Access Protocol), which are different from SMTP and designed for email retrieval, not sending.

## HTTP - Hypertext Transfer Protocol

The operation of HTTP is based on a request-response model and operates predominantly over TCP/IP (Transmission Control Protocol/Internet Protocol), typically using port 80 for standard communication and port 443 for secure communication (HTTPS - HTTP Secure). Here’s a simplified overview of the HTTP process:

#### 1. **HTTP Request**

- **Initiation**: A user enters a URL in their browser or clicks a link. The browser, acting as the HTTP client, parses the URL to determine the protocol (HTTP or HTTPS), hostname, and path.

- **Request Message**: The browser sends an HTTP request message to the server. This message includes a request method (GET, POST, PUT, DELETE, etc.), the path of the resource (such as a specific webpage or image), and HTTP headers that provide additional information (like browser type, accepted response formats, etc.).

#### 2. **Server Processing**

- The server receives the HTTP request and processes it. This involves the web server software (e.g., Apache, Nginx) interpreting the request, fetching the requested resource (if available), and executing server-side scripts if necessary (e.g., PHP, Python, JavaScript with Node.js) to dynamically generate HTML content.

#### 3. **HTTP Response**

- **Response Message**: The server sends back an HTTP response message, which includes a status code (indicating success, failure, redirection, etc.), HTTP response headers (providing information about the server and the response), and the body of the response (the requested resource or content).

- **Content Delivery**: The browser receives the HTTP response, interprets the content (rendering HTML, executing JavaScript), and displays the webpage or resource to the user.

#### 4. **Connection Closure**

- After the response is delivered, the TCP connection can be closed, or it can be kept open for further requests using HTTP persistent connections, improving the efficiency of subsequent requests.

#### HTTP Methods

- **GET**: Requests data from a specified resource.
- **POST**: Submits data to be processed to a specified resource.
- **PUT**: Updates a specified resource.
- **DELETE**: Deletes a specified resource.
- **HEAD**: Similar to GET, but it retrieves only the headers (no body).
- **OPTIONS**: Describes the communication options for the target resource.
- **PATCH**: Applies partial modifications to a resource.

#### HTTP Status Codes

- **1xx (Informational)**: Request received, continuing process.
- **2xx (Successful)**: The request was successfully received, understood, and accepted.
- **3xx (Redirection)**: Further action needs to be taken to complete the request.
- **4xx (Client Error)**: The request contains bad syntax or cannot be fulfilled.
- **5xx (Server Error)**: The server failed to fulfill an apparently valid request.


# Securing Connections


### SSH - Secure Shell

SSH, short for Secure Shell, is a network protocol that provides administrators with a secure way to access a remote computer or server. It is widely used for managing systems and applications remotely, allowing secure command execution, file transfer, and network service access over an unsecured network.

1. **Authentication**: When a client connects to an SSH server, the server authenticates the client using one of several methods: password, public key authentication (where the server verifies the client by checking if it has the corresponding private key to a stored public key), or more advanced methods like Kerberos.
    
2. **Encryption**: After authentication, all communication between the client and server is encrypted using symmetric encryption, asymmetric encryption, and hashing algorithms. This ensures confidentiality and integrity of the data.
    
3. **Channels**: SSH supports multiple channels over a single connection. This means that file transfers, terminal sessions, and forwarding of ports or X11 (graphical interface) sessions can all happen simultaneously over the encrypted connection.
    

SSH is not just limited to shell access; it also facilitates other network operations like secure file transfer via SFTP (SSH File Transfer Protocol) or SCP (Secure Copy), as well as port forwarding to securely tunnel network traffic.


### SSL - Secure Sockets Layer

SSL, or Secure Sockets Layer, is a cryptographic protocol designed to provide secure communication over a computer network. It was the precursor to Transport Layer Security (TLS), and while the terms are often used interchangeably, SSL has been deprecated in favor of TLS due to security vulnerabilities. SSL was widely used on the internet for securing transactions, data transfers, and logins by encrypting the data in transit.

The operation of SSL was similar to that of its successor, TLS, and involved the following key steps:

1. **Handshake Process**: The SSL handshake was the initial phase where a client and server established a secure connection. This process involved:
    
    - Version negotiation for the SSL protocol.
    - Selection of cryptographic algorithms (cipher suites).
    - Authentication of the server to the client, typically using digital certificates (and optionally client to server).
    - Generation and exchange of keys for encryption.

1. **Key Exchange**: A key exchange mechanism, often RSA, was used to securely exchange a symmetric session key between the client and the server.
    
3. **Encryption**: With the session key established, data could be encrypted and securely transmitted between the client and server. The encryption protected the data from eavesdropping and tampering.
    
4. **Session Closure**: The session could be ended by either party, with a mechanism to securely indicate session closure and prevent further data transmission.
    

### Evolution and Deprecation:

- **SSL Versions**: SSL went through several versions, with SSL 1.0 never being publicly released due to security flaws, followed by SSL 2.0 and 3.0. Each subsequent version aimed to address vulnerabilities and improve security.

- **Transition to TLS**: Due to various security issues, including notable vulnerabilities in SSL 3.0, the industry moved to adopt TLS (Transport Layer Security). TLS 1.0 was defined as an upgrade to SSL 3.0, and subsequent versions of TLS (1.1, 1.2, and 1.3) have offered improvements in security, efficiency, and speed.

- **Deprecation**: SSL 2.0 and 3.0 have been formally deprecated by the Internet Engineering Task Force (IETF) due to their inherent security weaknesses. Modern web browsers and servers use TLS protocols for secure communications.

### TLS - Transport Layer Security

TLS, or Transport Layer Security, is a cryptographic protocol designed to provide secure communication over a computer network. It is the successor to SSL (Secure Sockets Layer) and is widely used in applications such as web browsing, email, instant messaging, and voice over IP (VoIP).


1. **Handshake**: The TLS handshake is initiated when a client connects to a TLS-secured server. The handshake involves the negotiation of the TLS version, selection of cryptographic algorithms, and authentication of the server (and optionally the client) using digital certificates.
    
2. **Key Exchange**: During the handshake, the client and server agree on a pre-master secret, which is then used to generate a shared secret key. This key exchange is usually done using Diffie-Hellman or RSA algorithms.
    
3. **Data Transfer**: Once the handshake is complete and a secure encrypted channel is established, data can be exchanged securely between the client and server. All data transmitted is encrypted with the agreed-upon encryption algorithms and keys.
    
4. **Session Termination**: Either party can securely terminate the session, at which point the session keys are discarded.

TLS is fundamental to secure web browsing and is used to secure HTTP connections, resulting in HTTPS. It secures data in transit to prevent eavesdropping, tampering, and message forgery, ensuring that sensitive information (like credit card numbers and login credentials) sent over the internet is encrypted and secure.
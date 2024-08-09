## DoS Attack

Used to describe an attack that attempts to make a computer or server's resources unavailable

**Flood Attack**: Specialized type of DoS which attempts to send more packets to a single server or host

- ***Ping Flood***: a variety of flood attack in which a server is sent with too many pings (ICMP echo)
	- Disable ICMP

- ***SYN Flood***: An attacker will initiate multiple TCP sessions but never complete the three-way handshake
	- Use Flood Guards
	- Timeout requests
	- IPS

**PDoS**: Permanent Denial of Service attack which exploits a security flaw by reflashing a firmware, permanently breaking networking devices

**Fork Bomb**: A large number of processes is created to use up a computer's available processing power

**DDoS**: Distributed Denial of Service, more machines are used to launch an attack simultaneously against a single server to create denial of service condition

- ***DNS Amplification Attack***: Specialized DDoS that allows an attacker to initiate DNS requests from a spoof IP address to flood a website

### Mitigation

**Blackhole/Sinkhole**: Identifies malicious IP addresses and routes there traffic to a non-existent server

- IPS
- Elastic Cloud Infrastructure

## DNS Attack

**DNS Cache Poisoning**: Involves corrupting the DNS cache data of a DNS resolver with false information and redirects users to a malicious IP address
- Utilize DNSSEC to add a digital signature to the organization's DNS data
- Implement secure network configurations and firewalls to protect the DNS servers

**DNS Amplification Attack**: The attacker overloads a target system with DNS response traffic by exploiting the DNS resolution process
- Limit the size of DNS responses or rate limit any DNS response traffic

**DNS Tunneling**: Uses DNS protocol over port 53 to encase non-DNS traffic, trying to evade firewall rules for command control or data exfiltration
- Monitor and analyze DNS logs for any signs of unusual patterns or behavior

**Domain Hijacking**: Altering a domain name's registration without the original registrant's consent
- Use domain registry lock services to prevent any unauthorized changes to the domain registrations

**DNS Zone Transfer Attack**: The attacker mimics an authorized system to request and obtain the entire DNS zone data for a domain, can expose information about the networks infrastructure

## Directory Traversal Attack

A type of injection attack that allows access to commands, files, and directories, either connected to web document root directory or not

***my.website.com/../../../../etc/shadow or my.website.com/%2e%2e%2f%2e%2e%2f%2e%2e%2f%2e%2e%2f/etc/shadow

**Note** `%2e%2e%2f` is url-encoded representation of `../`

![[Pasted image 20240808184739.png]]
**File Inclusion**: Allows an attacker to either download files from an arbitrary location or upload an executable or script file to open a backdoor
- ***Remote File Inclusion***: Occurs when an attacker tries to execute a script to inject a remote file
	- https:///my.website.com/login.php?user=http://malware/malicious.php
- ***Local File Inclusion***: Occurs when an attacker tries to add a file that already exists
	- http://my.website.com/login.php?user=../../Windows/system32/cmd.exe%00
		- `%00`: url-encoding for null character
### Mitigation 
- Set Proper file permissions

## Execution and Escalation Attack

**Arbitrary Code Execution**: A vulnerability that allows an attacker to run a code or module that exploits a vulnerability
- touch machine and load up malicious software

**Remote Code Execution**: A type of arbitrary code execution that allows an attacker to transmit code from a remote host
- load up malicious software over the internet

**Privilege Escalation**: Occurs when a user accesses or modifies specific resources that they are not entitled to normally access
- ***Vertical Privilege Escalation***: From normal level user to higher level
- ***Horizontal Privilege Escalation***: From one user to another of generally the same level

**Rootkit**: A class of malware that modifies system files, often at the kernel level, to conceal its presence
- ***Kernel Mode Rootkit***: Rootkit operates at Ring 0
- ***User Mode Rootkit***: Rootkit that uses the OS features for persistence inside the registry 

![[Pasted image 20240808192947.png]]


## Session Hijacking

A type of spoofing attack where the host is disconnected and replaced by the attacker. Often occurs by the theft or modification of cookies

### Prerequisites

**Session Management**: A fundamental security component that enables web applications to identify a user

**Session Tokens**: Unique data pieces that prevent session replay by attackers

**Cookies**: Allow web applications to retain information about the users
- Cookies must be protected because they contain client information that is being transmitted across the Internet
- ***Session Cookies***: Non-persistent cookies that reside in memory and are removed when closing out the browser instance
- ***Persistent Cookies***: Stored in the browser cache until deleted by the user or pass a defined expiration date

### Attacks

**Session Prediction**: An attacker attempts to predict the session token to hijack that session
- Generate Session Tokens with a non-predictable algorithm that does not reveal any information about the session client

**Cookie Poisoning**: Modifying the contents of a cookie to be sent to a client's browser and exploit the vulnerabilities in an application
- Validate the input of your webapp to account for any tampered with cookies
- Encryption of cookies during transmission and storage

**Replay Attacks**: Type of network-based attack that involves maliciously repeating or delaying valid data transmissions. Similar to a *Session Hijack* where attackers alter real-time data transmissions, but instead attackers intercept data and decides whether to re-transmit it later
- Use session tokens for unique authentication identification
- Use latest security protocols like WPA3

## On-Path Attack

An attack where the penetration tester puts the workstation logically between two hosts during the communication to capture and monitor communications between a client and server with methods such as:
- ***ARP Poisoning***
- ***DNS Poisoning***
- ***Rouge WAP/Switch***

**On-Path Replay**: Occurs when an attacker captures a valid data which is then repeated immediately or delayed and then repeated

![[Pasted image 20240808201942.png]]

**On-Path Relay**: Occurs when attackers insert themselves in between two hosts and become part of the conversation

![[Pasted image 20240808202233.png]]

**SSL Stripping**: Tricking the encryption application with an HTTP connection instead of an HTTPS connection

**Downgrade Attack**: Occurs when an attacker attempts to have a client or server abandon its higher security mode

## Injection Attacks

**LDAP Injections**: An attack in which LDAP statements, typically created by user input, are fabricated
- Similar to SQL Injection

```java
# if $searchName = * then attackers get a list of users

string ldapSearch = "(cn = $searchName")";
System.out.println(ldapSearch);
```

**Command Injection**: A threat actor is able to execute arbitrary shell commands via a vulnerable web application

**Process Injection**: A method of executing arbitrary code in the address space of a separate live process
- ***Injection through DLLs***
- ***Thread execution hijacking***
- ***Process hollowing***
- ***Process doppelganging***
- ***Asynchronous procedure calls***
- ***Portable execution injections***

	- Endpoint Security Solutions
	- Security Kernel Module
	- Least Privilege
### Mitigation
- Input Validation
- Input Sanitation

## IoC - Indicators of Compromise

Data pieces that detect potential malicious activity on a network or system

**Account Lockout**: Signals a compromise when it's triggered by numerous failed login attempts

**Concurrent Session Usage**: One user having multiple sessions

**Blocked Content**: When users try to access or download content that security measures have prevented

**Impossible Travel**: When suspicious logins occur from distant locations in a timeframe that makes physical travel between them impossible

**Resource Consumption**: Unusual resource spikes can signal a compromise

**Resource Inaccessibility**: Inability to access certain resources, such as files, databases, or network services

**Out-of-Cycle Logging**: Logging events happening at odd times when no one is supposed to be active

**Missing Logs**: Attackers delete logs to cover their tracks and hinder investigations

**Articles or Documents on Security Breach**: Attackers may publicly announce their hacks to brag about their abilities or harm the organization's reputation
```aosr-deck-config
{
	"rule": {
		"conditions": {
			"all": [{
				"fact": "card",
				"operator": "regexMatch",
				"value": "Malicious Activity",
				"path": "$.path"
			}]
		},
		"event": {
			"type": "match"
		}
	}
}
```

## Questions


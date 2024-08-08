**Vulnerabilities**: Weaknesses or flaws in hardware, software, configurations, or processes within a computer system, network, or application

**Attacks**: Deliberate actions or activities carried out by threat actors with the intent to exploit vulnerabilities

## Vulnerabilities

### Hardware Vulnerabilities

Security flaws or weaknesses inherent in a device's physical components or design that can be exploited to compromise the integrity, confidentiality, or availability of the system and its fata

**Firmware**: Specialized form of software stored on hardware device, like a router or a smart thermostat, that provides low-level control for the device's specific hardware

**EoL Systems**: End of Life Systems, Refer to hardware or software products that have reached the end of their life cycle

**Legacy Systems**: Outdated computing software, hardware, or technologies that have been largely superseded by newer and more efficient alternatives

**Unsupported Systems**: Hardware or software products that no longer receive official technical support, security updates, or patches from their respective vendors or developers

**Unpatched System**: Device, application, or piece of software that has not been updated with the latest security patches so that it remains vulnerable to known exploits and attacks

**Hardware Misconfiguration**: Occurs when a device's settings, parameters, or options are not optimally set up, and this can cause vulnerabilities to exist, a decrease in performance, or unintended behavior of devices or systems

##### Mitigations

**Hardening**: Tightening the security of a system by closing unnecessary ports, disabling unnecessary services, and setting up proper permissions

**Configuration Enforcement**: Used to ensure that all devices and systems adhere to a standard secure configuration 

**Decommissioning**: Mean that the system is retired and removed from the network

**Isolation**: Used to limit the potential damage that might occur from a potential security breach 

**Segmentation**: Used to divide the network into segments

### Bluetooth

Wireless technology standard used for exchanging data between fixed and mobile devices over short distances without the need for an Internet connection

#### Bluetooth Vulnerabilities

**Insecure Device Pairing**: Occurs when Bluetooth devices establish a connection without proper authentication

**Device Spoofing**: Occurs when an attacker impersonates a device to trick a user into connecting

**On-Path Attack**: Exploits Bluetooth protocol vulnerabilities to intercept and alter communications between devices without wither party being aware

##### Attacks

- ***Bluejacking***: Sending unsolicited messages to a Bluetooth device
- ***Bluesnarfing***: Unauthorized access to device through its Bluetooth connection 
- ***Bluebugging***: Extension of bluesnarfing to make calls, send text messages, and/or access the internet
- ***Bluesmack***: DoS Attack on Bluetooth protocol
- ***Blueborne***: A Malware Worm that spreads via Bluetooth

##### Mitigations

- Turning off Bluetooth when not actively in use 
- Set devices to ***non-discoverable*** mode 
- Regularly update devices
- Only pairing with known and trusted devices
- Always using unique PINs or passkeys
- Always remain cautious of unsolicited connection requests
- Using encryption for sensitive data transfers

### Mobile 

#### Mobile Vulnerabilities

**Sideloading**: The practices of installing applications on a device from unofficial sources which actually bypasses the device's default app store

**Jailbreaking/Rooting**: Process that gives users escalated privileges on the devices and allows users to circumvent the built-in security measures provided by the devices

**Insecure Connection Areas**: Connecting to and insecure wireless network or device

##### Mitigation

- Avoid open Wifi and unknown Bluetooth pairings for security
- Don't download 3-party applications or escalate privileges on your device

##### MDM - Mobile Device Management Solutions

Used to conduct patching of the devices by pushing any necessary updates to the devices to ensure that they are always equipped with the latest security patches

### Zero-Day

Any vulnerability that's discovered or exploited before the vendor can issue a patch for it

**Zero-Day Exploit**: Any unknown exploit in the wild that exposes a previously unknown vulnerability in the software or hardware

### Operating Systems

#### OS Vulnerabilities

**Unpatched Systems**: Operating systems that have not been updated with the latest security patches or fixes

**Zero-Days**: Represent vulnerabilities in software or hardware that are unknown to the developer and in essence, they are newly discovered vulnerabilities that have not been publicly disclosed yet

**Misconfiguration**: Occurs when the system's settings are not properly configured and this leaves the system vulnerable to exploitation

**Data Exfiltration**: Unauthorized data transfers from within an organization to an external location

**Malicious Updates**: Occur when an attacker has been able to craft a malicious update to a well-known and trusted program in order to compromise the systems of the program's end users

## Attacks

### SQL/XML Injection

**Code Injection**: The insertion of additional information or code through a data input form from a client to an application

#### SQL Injection 

Injection of an SQL query through the input form that the client uses to send data to a web application:
- URL Param
- Entering Data
- Modifying Cookies
- Changing POST data
- Using HTTP headers

```sql
--query
select * from users where name = $name and pass = $pass
-- Attack
$pass = 'OR 1=1;
```

##### Mitigation
- Input Validation/Sanitization
- Web Application Firewall (can perform Input Sanitization)

#### XML Injection

Used by web applications for authentication, authorization, and other types of data exchange

```xml
<xml version="1.0" encoding="UTF-8">
<question>
	<id>Security-Quesiton</id>
	<title>Is this xml safe?</title>
	<choice1>Yes</choice1>
	<choice2>No</choice2>
</question>
</xml>
```

**XML Bomb**: XML encodes entities that expand to exponential sizes, consuming memory on the host and potentially crashing it

```xml
<xml version="1.0"?>
<DOCTYPE lolz [
<ENTITY lol "lol">
<ENTITY lol2 "&lol;&lol;&lol;&lol;&lol;&lol;&lol;&lol;&lol;&lol;">
<ENTITY lol3 "&lol2;&lol2;&lol2;&lol2;&lol2;&lol2;&lol2;&lol2;&lol2;&lol2;">
<ENTITY lol4 "&lol3;&lol3;&lol3;&lol3;&lol3;&lol3;&lol3;&lol3;&lol3;&lol3;">
<ENTITY lol5 "&lol4;&lol4;&lol4;&lol4;&lol4;&lol4;&lol4;&lol4;&lol4;&lol4;">
<ENTITY lol6 "&lol5;&lol5;&lol5;&lol5;&lol5;&lol5;&lol5;&lol5;&lol5;&lol5;">
<ENTITY lol7 "&lol6;&lol6;&lol6;&lol6;&lol6;&lol6;&lol6;&lol6;&lol6;&lol6;">
<ENTITY lol8 "&lol7;&lol7;&lol7;&lol7;&lol7;&lol7;&lol7;&lol7;&lol7;&lol7;">
<ENTITY lol9 "&lol8;&lol8;&lol8;&lol8;&lol8;&lol8;&lol8;&lol8;&lol8;&lol8;">
]>
<lolz>&lol9;</lolz>
```

**XXE - XML External Entity**: An attack that embeds a request for a local resource
```xml
<xml version="1.0" encoding="utf-8"?>  
<DOCTYPE malicious [  
    <ELEMENT malicious ANY>  
    <ENTITY external SYSTEM "file:////etc/login.defs">  
]>  
<malicious>&external;</malicious>
```
##### Mitigation 
- Always Use TLS
- Input Validation/Sanitization

### XSS and XSRF

#### XXS - Cross-Site Scripting

Injects a malicious script into a trusted site to compromise the site's visitors:
- Defacing the trusted website
- Stealing the user's data
- Intercepting data or communications
- Installing malware on client's system
##### Steps
1. Attacker identifies an input validation vulnerability within a trusted website
2. Attacker crafts a URL to perform code injection against the trusted website
3. The trusted site returns a page containing the malicious code injected
4. Malicious code runs in the client's browser with permission level as the trusted site

##### Types

**Non-Persistent XSS**: This type of attack only occurs when it's launched and happens once

**Persistent XSS**: Allows an attacker to insert code into the backend database used by that trusted website

**DOM XXS**: Document Object Model Cross Site Scripting Exploits the client's web browser using client-side scripts to modify the content and layout of the web page

#### XSRF - Cross-Site Request Forgery

Malicious Script is used to exploit a session started on another site within the same web browser

##### Prerequisite Knowledge Terms

**Session Management**: Enables web application to uniquely identify a user across several different actions and requests

**Cookie**: Text file used to store information about a user when they visit a website
- ***Non-Persistent***: Known as a session cookie, which resides in memory and is used for a very short period of time 
- ***Persistent***: Stored in the browser cache until wither deleted by a user or expired

**Session Hijacking**: Type of spoofing attack where the attacker disconnects a host and then replaces it with his or her own machine by spoofing the original host IP

**Session Prediction**: Type of spoofing attack where the attacker attempts to predict the session token in order to hijack the session

##### Mitigation

- Use user-specific tokens in all form submissions
- Add randomness and prompt for additional information
- Require user to enter their current password when changing their password

### Buffer Overflow

Occurs when data exceeds allocated memory, potentially enabling unauthorized access or code execution

**Stack**: A memory region where a program stores the return addresses from function calls

![[Pasted image 20240805133233.png]]

A buffer overflows goal is to overwrite the return address of the pointer so it will point to a different place in the stack were they have placed malicious code

**Smashing the Stack**: Occurs when an attacker can execute their malicious code by overwriting the return address. aka they fill up the buffer with a NOP that way a return address my hit a one of the NOPs and continue down the stack until it finds the attackers code
- ***NOP***: Non-Operation Instruction 

![[Pasted image 20240805134030.png]]

#### Mitigations

**ASLR - Address Space Layout Randomization**: A security measure that randomizes memory addresses, making buffer overflow attacks harder for attackers

### Race Conditions

Software vulnerability where the outcome depends on the timing of events not matching the developer's intended order. Occur when multiple threads write to the same variable or object in the same memory location simultaneously

**Dereferencing**: Software vulnerability that occurs when the code attempts to remove the relationship between a pointer and the thing that pointer was pointing to in the memory

- ***TOC - Time-of-Check***: Type of race condition where an attacker can alter a system resource after an application checks its state but before the operation is performed

- ***TOU - Time-of-Use***: Type of race condition that occurs when an attacker can change the state of a system resource between  the time it is checked and the time it is used

- ***TOE - Time-of-Evaluation***: Type of race condition that involves the manipulation of data or resources during the time window when a system is making a decision or evaluation

#### Mitigations

**Mutex**: Mutually exclusive flag that acts as a gatekeeper to a section of code so that only one thread can be processed at a time
- ***Deadlock***: Occurs when a lock remains in place because the process it's waiting for is terminated, crashes, or doesn't finish properly, despite the processing being complete
# Review Questions

```aosr-deck-config
{
	"rule": {
		"conditions": {
			"all": [{
				"fact": "card",
				"operator": "regexMatch",
				"value": "Vulnerabilities and Attacks",
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


---
id: Objective 2.1 Threat Actors
aliases: []
tags: []
---

## Threat Actor
**Threat Actors** are indviduals or entities responsible for incidents that
impact security and data protection

#### Threat Actor Motivations

**Data Exfiltration**: The unauthorized transfer of data from a computer to sell
on the dark web, identity theft, or gain competitive advantages

**Financial Gain**: Hacking systems for finacial gain through ransomware attacks
or banking trojans

**Blackmail**: the attacker obtains sensitive or compromising information about
an indavidual or an organization and threatens to release the information to the
public unless certain demands are met. Often involving cryptocurrency finanical
transactions

**Service Disruption**: Attack to overwhelm a network, service, or server with
excessive amounts of traffic so that it becomes unavailable to normal users by
conducting a DDoS attack. often to demand ransom, cause chaos, or make a
political statement

**Philisophical or Political Belief**: Individuals or groups use hacking to
promote a political agenda, social change, or protest against organizations they
perceive as unethical. Known as hackivisim

**Ethical Reasons**: Ethical hackers, bug bounty hunters, and penitration testers motivated by a
desire to improve security

**Revenge**: employee who is disgruntled, or who has recently been fired or laid
off, might want to harm their current or formeer employer by causing a data
breach, dirupting services, or leaking sensitive information

**Disruption or Chaos**: Often reffered to as unauthorized hackers, engage in
malicious activities for the thrill of it, to challenge their skills, or simply
to cause harm

**Espionage**: Involes spying on Individuals, organizations, or nations to
gather sensitive or classified informaition

**War**: cyber attacks have increasingly become a tool for nations to attack
each other both on and off the battlefield


#### Threat Actor Attributes

**Internal Threat Actors**: Individuals inside a organization that pose a threat
to its security 

**External Threat Actors**: Individuals or groups outside an organization who
attempt to breach its cybersecurity defences

**Resources and Funding**: Refers to the tools, skills, and personnel at the
disposal of a given threat actor

**Level of Sophistication and Capability**: Refers to their tachnical skill, the
complexity of the tools and techniques they use, and their ability to evade
detection and countermeasures

#### Threat Actor Levels

**Low level**: low level of sophistication and capability typically use
widely available tools such as common malware or phishing attacks. often refereed
to as script kiddies

**High level**: high levels of sophistication and capabilities possess advanced
technical skills and use sophisticated tools and techniques such as nation state
hackers and/or hacker groups

#### Threat Actor Types

##### Unskilled Attackers
Often refereed to as script kiddies, Individuals who lack the technical
knowledge to develop their own hacking tools or exploits and need to rely on
scripts or programs that others have developed

- Motivated by desire for recognition or the thrill of causing disruption to an
  organization's network

- Less likely to be motivated by financial gain or political ideologies and
  often focus on opportunistic targets

###### Common Attacks 

- DDoS
- Phishing
- Common Malware

##### Hacktivists
Individuals or groups that use their technical skills to promote a cause or
drive social change instead of personal gain in the form of `hacktivism`

- Skills vary wildly but tend to demonstrate a fairly high level of
  sophistication

- Motivated by ideological belief rather than financial gain and target
  individuals they perceive as acting out against their cause

- Attacks are often done by hacktivist groups such as Anonymous or LulzSec

###### Common Attacks 

- Website Defacing 
- DDoS 
- Doxing 
- Leaking Sensitive Data

##### Organized Crime
Organized Cyber Crime Groups are sophisticated and well-structured entities that
leverage resources and technical skills for illicit gain via data breaches,
identity theft, online fraud, and ransomware attacks

- Structured similar to organized crime groups and are often transnational
  groups like FIN7

- Very high level of capabilities and sophistication in cyber attacks and exploit
  current technologies using cryptocurrency, dark web, and cellular collection devices

- Often target medium to small organizations or high net worth individuals

###### Common Attacks 
- Custom Malware 
- Ransomware 
- Sophisticated Phishing Campaigns

##### Nation State Actors
Groups that are sponsored by a government to conduct cyber operations against
other nations, organizations, or individuals. Often through `false flag attacks`,
or attacks that are orchestrated in such a way that it appears to originate from
a different source or group

- Operated as independent entities with state backed resources to facilitate
  plausible deniability

- `advanced persistane threat`: long-term persistence and stealthy threat where
  threat actors remand undetected in a system breach to monitor data rather than cause immediate damage

###### Common Attacks 
- False Flag Attacks
- Zero-day Exploits 
- Custom Malware

##### Insider Threats 
Cybersecurity threats that originate from inside the organization. Namely
current/former employees or associates/contractors who have access to internal
systems.

- Varying levels of capabilities depending on the individuals role in the
  organization 
- Can help fasilitate external attacks
- Motivated by finacial gain, revenge, or carelessness

#### Shadow IT 
The use of IT systems devices, software, applications, and services without
explicit organizational approval

Examples:
- Use of Personal Devices for work purposes
- Installation of Unapproved Software 
- Use of Cloud Services the have not been approved by the organization

#### Threat Vectors and Attack Surfaces

##### **Threat Vector**
the means or pathway by which an attacker can gain
unauthorized access to a computer or network to deliver a malicious payload or
carry out an unwanted action. The how of the attack 

**Messages**: include threats delivered via email, sms, or other forms of
instant messaging. Example: Phishing

**Images**: Embedding of malicious code inside of an image file

**Files**: involes the use of malicious files to deliver a cyber threat

**Voice Calls**: involves the use of voice calls to trick victims into revealing
their sensitive information

**Removable Devices**: threats delivered via USB, hardisks, or other removable
devices

**Unsecure Networks**: the lack of appropriate security measures to protect
networks. Example Evil Twins

- `BlueBorne`: set of vulnerabilities in Bluetooth that allows attackers to
spread malware or take over devices

- `BlueSmack`: DoS Attack that targets bluetooth enabled devices

##### **Attack Surface**
Encompasses all the various points where an unauthorizaed
user can try to enter data or extreact data from an environment. The where of
the attack

#### Proactive Defense 

##### TTPs - Tactics, Techniques, and Procedures 
Specific methods and patterns of activities or behaviors associated with a
particular threat actor or group of threat actors 

##### Deseptive and Disruption Technologies 
Designed to mislead, confuse, and divert attackers from critical assets while
simultaneously detecting and neutralizing threats

**Honeypot**:  Decoy System or network setup to attract potential hackers placed
within a screened subnet or isolated segment that is easily accessed by
potential attackers

**Honeynet**: Network of honeypots to create a more complex system that is
designed to mimic an entire network of systems, including servers, routers, and
switches

**Honeyfile**: Decoy file placed within a system to lure in potential attackers

**Honeytoken**: Piece of data or a resource that has no legitimate value or use
but is monitored for access or use. Example: Fake account, dumby url, fake
database record

**Bogus DNS**: Fake DNS entries introduced into a system's DNS server

**Decoy Directories**: Fake Folder and files placed within a system's storage

**Dynamic Page Generation**: Used in websites to present ever-changing content
to web crawlers to confuse an slow down threat actors

**Port Triggering**: Security mechanism where specific services or ports on a
network device remain closed until a specific outbound traffic pattern is
detected

**Fake Telemetry Data**: System can respond to an attacker's network scan
attempt by sending out fake telemetry or network data

## Review Questions 
#Q 
What is an Attack Surface?
?
The sum of all potential vulnerabilities and entry points that an attack could
exploit 

#Q 
What is a Threat Vector?
?
The pathway by which an attacker can gain access to a computer or network













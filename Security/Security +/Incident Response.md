## Incident Response Process

Outlines a structured approach to manage and mitigate security incidents effectively

**Incident**: Act of violating an explicit or implied security policy

### Incident Response Phases

**Preparation**: Involves strengthening systems and networks to resist attacks
- Focuses on getting ready for future incidents
- Conduct training, testing, and exercising

**Detection**: Identifies security incidents
- Categorizing and accessing potential incident severity

**Analysis**: Involves a thorough examination and evaluation of the incident
- Understand the scope and impact of the incident
- Relevant stakeholders are informed, containment begins, and initial response actions are taken

**Containment**: Limits the incident's impact by securing data and protecting business operations

**Eradication**: Starts after containment and aims to remove malicious activity from the system or network

**Recovery**: Restores systems and services to their secure state after an incident
- Restoring from a known good backup
- Installing security patches
- Implementing configuration updates

**Post-Incident Activity/Lessons Learned**: Happens after containment, eradication, and full system recovery
- Analyzing the incident and the response to identify whether the procedures and systems that are in place work properly
	- ***Root Cause Analysis***: Identifies the incident's source and how to prevent it in the future
		1. Define/scope the incident
		2. Determine relationships that led to the incident
		3. Identify an effective solution
		4. Implement and track the solutions
	- ***Lessons Learned Process***: Documents experiences during incidents in a formalized way
	- ***After-action Report***: Collects formalized information about what occurred

## Threat Hunting

Cybersecurity method for finding hidden threats not caught by regular security monitoring 

**Establish a Hypothesis**: Predicting high-impact, likely events through threat modeling

**Profiling Threat Actors and Activities**: Envisioning how potential attackers might intrude and what they aim to achieve

**Advisories and Bulletins**: Published by vendors and security researchers when new TTPs and vulnerabilities are discovered

**Intelligence Fusion and Threat Data**: Use SIEM and analysis platforms to spot concerns in the logs and real-world security threats

## Root Cause Analysis

A systematic process to identify the initial source of the incident and how to prevent it from occurring again
- Define the scope of the incident
- Determine the causal relationship
- Identify an effective solution
- Implement and track the solution

## Incident Response Training and Testing

**Training**: Ensures staff grasp processes and priorities for incident response

- ***First Responder***
	- Procedures
	- Machine re-image
	- Removing malware
	- Change configuration settings
- ***Manager/Executive***
	- Risk vs. Reward
	- Decision-making and communication
	- Law enforcement and media
- ***End User***
	- Report suspected incident occurring
	- Remedial training

**Testing**: Practical exercise of incident response procedures

- ***TTX***: *Tabletop Exercise*, Exercises simulate incidents within a control framework
- ***Penetration Test***: Simulates network intrusion based on threat scenarios
	- Metasploit
	- Cobalt Strike
	- Kali Linux
	- ParrotOS
	- Commando OS
- ***Simulation***: Replicates real incidents for hands-on experience
	- Simple scenarios
	- Complex, multi-stage scenarios

## Digital Forensic Procedures

Process of investigating and analyzing digital devices and data to uncover evidence for legal purposes

**Identification**: Ensures the safety of the scene, secures it to prevent any evidence contamination, and determines the scope of the evidence to be collected

**Collection**: Refers to the process of gathering, preserving, and documenting physical or digital evidence in various fields
- ***Order of Volatility***: Dictates the sequence in which data sources should be collected and preserved based on their susceptibility to modification or loss
- ***Chain of Custody***: Documented and verifiable record that tracks the handling, transfer, and preservation of digital evidence from the moment it is collected until it is presented in a court of law

**Analysis**: Involves systematically scrutinizing the data to uncover relevant information, such as potential signs of criminal activity, hidden files, timestamps and user interactions
- ***Legal Hold***: Formal notification that instructs employees to preserve all potentially relevant electronic data, documents, and records
- ***Electronic Discovery***: Process of identifying, collecting, and producing electronically stored information during potential legal proceedings

## Data Collection Procedures

**Data Acquisition**: The method and tools used to create a forensically sound copy of the data from a source device, such as system memory or a hard disk 

#### Order of Data Forensic Collection

1. CPU Registers and cache memory
2. RAM, routing tables, ARP caches, process table, temporary swap files
3. Data on persistent mass storage (HDD/SDD/flash drive)
4. Remote logging and monitoring data
5. Physical configuration and network topology
6. Archival media

*Note*: Some Windows registry keys, like HKLM/Hardware, are only in memory and require a memory dump to analyze
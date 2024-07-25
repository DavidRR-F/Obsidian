# Infrastructure Strategies

**On-Premise**: Traditional method of setting up infrastructure and services locally, within an organization's own premises

**Hybrid Model**: Combine on-premise infrastructure, private cloud services, and public cloud services. Primarily used in situations were data security, compliance, interoperability, and cost are concerned

## Cloud Computing

Delivering computing services over the internet

**Serverless**: Model where the responsibility of managing servers, databases, and some application logic is shifted away from developers

**Responsibility Matrix**: Outlines the division of responsibilities between the cloud service provider and the customer

**Third Party Vendors**: Provide specialized services that enhance the functionality, security, and efficiency of cloud solutions

**Risk Transference**: When using the cloud services, some risks are transferred to the provider

### Cloud Security

**Shared Physical Servers**: Can lead to vulnerabilities if one user's data is compromised 
- Implement strong isolation mechanisms 
- Hypervisor Protection
- Secure Multi-Tenancy 

**Inadequate Virtual Environment Security**: Can lead to unauthorized access, data breaches, and other security incidents
- Use secure VM templates
- Updating and Patching VMs
- Monitoring VMs for Unusual Activities

**User Access Management**: Can lead to unauthorized access to sensitive data and systems
- Enforce Strong Password Policies
- Using MFA
- Limiting User Permission
- Monitoring User Activities

**Lack of Up-to-date Security**: Can lead to leaving the system vulnerable to new threats
- Keep software and systems patched
- Regularly review and update security policies
- Stay informed about the latest threats

**Single Points of Failure**: Can lead to a complete system outage affecting all users
- Use Multiple servers, datacenters, and cloud providers

**Weak Authentication and Encryption**: Can lead to allowing unauthorized users to gain access to cloud systems

**Unclear Policies**: Lack  of clear guidelines or procedures for carious security aspects

**Data Remnants**: Residual data left behind after deletion or erasure processes

# Virtualization and Containerization
## Virtualization

Technology that allows for the emulation of servers called virtual machines

**Live Migration**: When a vm needs to move from one physical host to another

**Resource Reuse**: concept in computing where system resources like memory or processing power are reused 
### Hypervisors

**Type 1**: Known as a bare metal or native hypervisor runs directly on the host hardware and functions similarly to an operating system
- Hyper-V
- Vsphere

**Type 2**: Operates within a standard operating system, such as Windows, Mac, Linux
- VirtualBox
- VMware

### Vulnerabilities 

**Virtual Machine Escape**: Occurs when an attacker is able to break out of one of these normally isolated vms

**Privilege Elevation**: Occurs when a user is able to gain the ability to run functions as a higher level user



## Containerization

Lightweight alternative to full machine virtualization that is an encapsulation of a application within it own operating environment known as a container.
- Docker
- Kubernetes
- Openshift

**Serverless**: Model where the responsibility of managing servers, databases, and some application logic is shifted away from developers

# Architectures Strategies 

**Serverless**: Model where the responsibility of managing servers, databases, and some application logic is shifted away from developers

**Microservices**: A software architecture where large applications are broken down into smaller and independent services

**IaC - Infrastructure as Code**: a method in witch IT infrastructures are defined in code files that can be versioned, tested, and audited

## Centralized Architecture

All the computing functions are coordinated and managed from a single location or authority.
#### Benefits
- Efficiency and control
- Consistency
- Cost and Effective
#### Risk
- Single Points of Failure
- Scalability Issues
- Security Risks

## Decentralized Architecture

Computing functions are distributed across multiple systems or locations
#### Benefits 
- Resiliency
- Scalability
- Flexibility
#### Risks
- Security Risks
- Management Challenges
- Data Inconsistency
# Network Infrastructure

**Air Gaping - Physical Separation**: Isolation of a network by removing any direct or indirect connections from other networks
- Physical separation is one of the most secure methods of security but is still vulnerable to sophisticated attacks

**Logical Separation**: Creates boundaries within a network, restricting access to certain areas. Like VLANs, Firewalls
- Not as secure as physical separation 

**SDN - Software Defined Network**: Enables efficient network configuration to improve performance and monitoring
- ***Data Plane***: Also called the forwarding plane that is responsible for handling packets and makes decisions based on protocols
- ***Control Plane***: The brain of the network that decides where traffic is sent and is centralized in SDN
- ***Application Plane***: The plane were all network applications interacting with the SDN controller reside

# Systems Architecture
## IoT - Internet of Things

Refers to the network of physical items with embedded systems that enables connection and data exchange

**Hub**: The central point connecting all IoT devices and sends commands to them

**Smart Devices**: Everyday objects enhanced with computing capabilities and Internet connectivity

**Wearables**: Subset of smart devices designed to be worn on the body

**Sensors**: Detect changes in the environment and transform them into analyzable data

## ICS

### Industrial Control Systems - ICS

Control systems used to monitor and control industrial processes ranging from simple systems to complex systems

**DCS - Distributed Control Systems**: Used to control production systems within a single location

**PLC - Programmable Logic Controllers**: Used to control specific processes

**SCADA - Supervisory Control and Data Acquisition**: type of ICS used to monitor and control geographically dispersed industrial processes

## Embedded System

Specialized computing component designed to perform dedicated functions within a larger structure. They can impose a significant challenge to securing do to there inability to patch

**RTOS - Real-Time Operating System**: Ensures data processing in real-time and is crucial for time-sensitive applications

#### Securing 

**Network Segmentation**: Divides a network into multiple segments or subnets, limiting potential damage in case of a breach

**Wrappers**: show only the entry and exit points of the data when travelling between networks

**Firmware Code Control**: The can be achieved through secure coding practices, code reviews, and automated testing
# Review Questions

```aosr-deck-config
{
	"rule": {
		"conditions": {
			"all": [{
				"fact": "card",
				"operator": "regexMatch",
				"value": "Security Architecture",
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


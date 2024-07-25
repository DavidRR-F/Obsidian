
# Cyber Resilience & Redundancy

**Resilience**: An entities ability to continuously deliver the intended outcome despite adverse cyber events

**Redundancy**: Involves having additional systems, equipment, or processes to ensure continued functionality if the primary ones fail

## High Availability

The ability of a service to be continuously available by minimizing the downtime to the lowest amount possible

**Uptime**: The number of minutes or hours that the system remains online over a given period, and the uptime is usually expressed as a percentage somewhere in the [[Security Fundamentals#Nines of Availability|Nines of Availability]]

**Load Balancing**: The process of distributing workloads across multiple computing resources

**Clustering**: The use of multiple computers, multiple storage devices, and redundant network connections that all work together as a single system to provide high levels of availability, reliability, and scalability

**Redundancy**: Duplication of critical components or functions of a system with the intention of increasing the reliability of the system

## Data Redundancy

### RAID - Redundant Array of Independent Disks

Combines multiple physical storage devices into a recognized single logical storage device

--- 
![[Pasted image 20240724134129.png]]

Provides data ***striping*** across multiple disks to increase performance 
- is for performance without fault tolerance concerns
- only can be used with 2 storage devices
---
![[Pasted image 20240724134003.png]]

***Mirrors*** data for redundancy across two drives or SSDs 
- Provides least amount of downtime
- can lose a disk without suffering data loss
---
![[Pasted image 20240724133237.png]]
***Striping disk with parity***, using at least three storage devices
- Provides parity and redundancy but at slower speeds
- Can lose a storage device and still retrieve data
---
![[Pasted image 20240724140105.png]]
Uses data ***striping with double parity***
- Raid 5 but with 2 parity data pieces. Can lose 2 storage devices and still retrieve data
---
![[Pasted image 20240724141731.png]]
Combines RAID 1 and RAID 0 featuring ***mirrored arrays in a striped setup***
- 2 Sets of RAID 1 to use inside of a RAID 0
- Supports loss of up to 2 storage devices
---
#### Data Tolerance and Resistance

**Failure-resistant**: Use of redundant storage to withstand hardware malfunctions without data loss
- Any system using mirroring ***RAID 1*** and ***RAID 10***

**Fault-tolerant**: Use of ***RAID 1, 5, 6, and 10*** for uninterrupted operation during hardware failures
- Ability to recover any lost data from the remaining healthy storage devices to ensure the systems remain resilient 

**Disaster-tolerant**: Protects data from catastrophic events
- ***RAID 1*** and ***RAID 10*** because they have at least one mirror of storage devices within the array

## Capacity Planning

Crucial strategic planning to meet future demands cost-effectively

**People**: Involves analyzing current skills and forecasting future needs for hiring or training

**Technology**: Involves assessing current resources, utilization, and anticipating future technological needs
- Evaluate if current technology can accommodate future growth or id additional/new solutions are required or the expected demand

**Infrastructure**: Involves considering physical space and utilities to support organizational operations

**Process**: Aims to optimize business processes to handle demand fluctuations

## Powering of Data Centers

**Surge**: A small and unexpected increase in the amount of voltage that is being provided

**Spike**: A short transient voltage that is usually caused by a short circuit, a tripped circuit breaker, a power outage, or a lightning strike

**Sag**: A small and unexpected decrease in the amount of voltage that is being provided

**Under Voltage Event**: (Brown out) Occurs when the voltage is reduced to lower levels and usually occur for a longer period of time

**Power Loss Event**: (Black out) Occurs when there is a total loss of power for a given period of time
-  With a complete power loss event, it is important to be aware that when power is restored it can also cause a power spike

### Power Protection

**Line Conditioners**: Used to overcome any minor fluctuations in the power being received by the given system
- Automatically adjusts the power signal being received as an under-voltage or overvoltage condition and change it back to the standard power level

**UPS - Uninterruptible Power Supply**: A device that provides emergency power to a system when the normal input power source has failed 
- Can last around 15 minutes incase of short power outage blips

**Generator**: Machine that converts mechanical energy into electrical energy for use in an external circuit through the process of electromagnetic induction 

**PDC - Power Distribution Center**: Acts as a central hub where power is received and then distributed to all systems in the data center

## Data Backups

The process of creating duplicate copies of digital information to protect against data loss, corruption, or unavailability

### On/Offsite Backups

**Onsite**: Data will be located within your own data center or office environment. This backed up data might be vulnerable to destruction 

**Offsite**: The practice of storing duplicate copies of data at a geographically separate location from the primary data source to provide protection against physical disasters and to ensure data continuity

**Frequency**: How much data is the company willing to lose? This metric should be reflected in the companies ***RPO*** and how frequently the data will be changed inside of the business

**Encryption**: Fundamental safeguard that protects the backup data from unauthorized access and potential beaches
- Use both data at rest encryption and data in transit encryption

**Snapshots**: Point in time copies of the data that capture a consistent state that is essentially a frozen in time copy of the data
- Only records data that has changed since previous snapshot

**Recovery**: Used to regain access to the data in the event of a data loss or a system failure

**Replication**: Making real-time, or near-real-time, copies of the data

**Journaling**: Maintaining a meticulous record of every change made to an organization's data over time

## Continuity of Operations Plan

Ensures an organization's ability to recover from disruptive events or disasters

**BCP - Business Continuity Plan**: Addresses responses to disruptive events
- Involves preventive actions and recovery steps for various threats, not limited to technical disruptions

**DRP - Disaster Recovery Plan**: Considered as a subset of BCP, it focuses on how to resume operations swiftly after a disaster
- May include cloud-based solutions

### Redundant Site

Alternative sites for backup in case the primary location encounters a failure or interruption

**Hot Site**: a fully equipped backup facility ready to swiftly take over in case of a primary site failure or disruption

**Warm Site**: a partially equipped backup site that can become operational within days of a primary site disruption
- power, phone lines, and network connectivity

**Cold Site**: A site with no immediate equipment or infrastructure but can be transformed into a functional backup facility

**Mobile Site**: A versatile site that utilizes independent and portable units like trailers or tents to deliver recovery capabilities
- Can be hot, warm, or cold

**Virtual Site**: Utilizes cloud-based environments and offers highly flexible approach to redundancy
- Can be hot, warm, or cold

## Resilience & Recovery Testing 

**Resilience Testing**: Assess the system's capacity to endure and adjust to disruptive occurrences

**Recovery Testing**: Evaluates the system's ability to return to regular functioning following a disruptive incident

**Tabletop Exercise**: A simulated discussion to improve crisis readiness without deploying resources
-  think tank for incident responses

**Fallover Test**: Verifies seamless system transition to a backup for uninterrupted functionality

**Simulation**: Computer-generated representations of real-world scenario 
- allows responders to perform actions in a virtualized environment

**Parallel Processing**: Replicates data and processes onto a secondary system, running both in parallel
- ***Resilience testing***: tests ability to handle multiple failure scenarios
- ***Recovery testing***: tests efficiency to recover from multiple failure points

# Review Questions

```aosr-deck-config
{
	"rule": {
		"conditions": {
			"all": [{
				"fact": "card",
				"operator": "regexMatch",
				"value": "Cyber Resilience and Redundancy",
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


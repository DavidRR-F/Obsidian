Systematic process of developing, operating, maintaining, and selling assets in a cost-effective manner

## Acquisition and Procurement

Instructional processes the are designed to ensure financial prudence, operational efficiency, and increase security for the organization's enterprise network

**Acquisition**: Process of obtaining goods and services

**Procurement**: Encompasses the full process of acquiring goods and services. including all preceding steps

## Mobile Asset Deployments

**BYOD - Bring Your Own Device**: Permits employees to use personal devices for work
- Personal devices must undergo security checks and have specific software for protecting company data
- Organization might not have the ability to manage or update the device for users, or enforce stricter security configurations

**COPE - Corporate-Owned, Personally Enabled**: Involves the company providing a mobile device to employees for both work and personal use

**CYOD - Choose Your Own Device**: Offers a middle ground between BYOD and COPE by allowing employees to choose devices from a company-approved list

## Asset Management

Refers to the systematic approach to governing and maximizing the value of items an entity is responsible for throughout their lifecycle

**Assignment/Accounting**: Every organization should designate individuals or groups as owners for each of its assets

**Classification**: Involves categorizing assets based on criteria like function, value, or other relevant parameters as determined by the organization

**Monitoring/Tracking**: Ensures proper accountability and optimal use of each asset maintaining a comprehensive inventory with asset specifications. locations, assigned users, and relevant details
- ***Enumeration***: Involves identifying and counting assets, especially in large organizations or during times of asset procurement or retirement

**MDM - Mobile Device Management**: Lets organizations securely oversee employee devices, ensuring policy enforcement, software consistency, and data protection
- centralization boosts security by ensuring all devices comply with the latest standards and protocols
- lowers risks tied to unsecured or outdated devices

## Asset Disposal and Decommissioning

### Sanitization

The thorough process of making data inaccessible and irretrievable from a storage medium using traditional forensic methods

**Overwriting data**: Replacing the existing data on a storage device with random bits of information to ensure that the original data is obscured

**Degaussing**: Involves using a machine called a degausser to produce a strong magnetic field that can disrupt the magnetic domains on storage devices like hard drives or tapes. 

- After degaussing a device loses its data storage capability

**Secure Erase**: Completely deletes data from a storage device while ensuring that it can't be recovered using traditional recovery tools ***No longer secure***

**Cryptographic Erase**: Introduced to replace secure erase technique in most modern storage devices

### Destruction

Ensures the physical device itself is beyond recovery or reuse usually by means of shedding, pulverizing, melting, and/or incinerating

### Certification

An act of proof that the data or hardware has been securely disposed of

## Change Management

An organization's orchestrated strategy to transition from its existing state to a more desirable future state and ensures seamless integration of changes into existing architecture and processes

**CAB - Change Advisory Board**: Body of representatives from various parts of an organization that is responsible for evaluation of any proposed changes

**Change Owner**: An individual or a team that initiates the change request

**Stakeholder**: A person who has a vested interest in the proposal change

**Impact Analysis**: Involves understanding of change's potential fallout

### Processes

**Preparation**: Involves assessing the current state and recognizing the need for transition

**Vision for Change**: A clear, compelling description of the desired future state that is guiding the transformation process within an organization

**Implementation**: Pulling the plan into action through training, restructuring teams, Introducing new technologies. and/or continuous communication

**Verification**: Measuring the change's effectiveness by comparing it to the initial objectives

**Documentation**: Creating thorough record of the entire change process 

### Tools

**Scheduled Maintenance Windows**: A schedule window of time to implement a change

**Creation of a Backout Plan**: Predetermined strategy for restoring systems to their initial state in case a change does not go as expected

**SOP - Standard Operating Procedure**: A step-by-step instruction that guides the carrying out of a specific task to maintain consistency and efficiency

### Technical Implications

**Allow/Deny Lists**: Used by routers and firewalls to either allow or deny traffic to given resources

**Restricted Activities**: Knowing restrictions can prevent data breaches and operational problems

**Downtime**: Estimating the potential down time that will occur to enact the change  

**Service/Application Restarts**: Services or applications may require a restart to implement changes

**Legacy Applications**: Older software or system that is still being used and meets the needs of users, but might not be as flexible even to minor updates

**Dependencies**: Prior to implementing proposed changes, it is crucial to map existing dependencies to prevent minor tweaks 
### Documentation

Documenting changes provides a clear history of the what, when, and why for accountability and future reference

**Version Control**: Tracks and manages changes in documents and software, enabling collaborative work and reverting to prior versions when needed 

**Proper Documentation**: Updating diagrams, like flowcharts or network diagrams, offers a visual snapshot of the system's architecture
# Review Questions

```aosr-deck-config
{
	"rule": {
		"conditions": {
			"all": [{
				"fact": "card",
				"operator": "regexMatch",
				"value": "Asset and Change Management",
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


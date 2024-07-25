# Governance

Overall management of the organization's IT infrastructure, policies, procedures, and operations. 

- Strategic leadership, structures, and processes the ensure an organization's IT infrastructure aligns with its business objectives. 

- This framework includes the rules, responsibilities, and practices that guide an organization in achieving its goals and managing its IT resources

- Ensures the alignment of procedures, the detailed steps to be followed to accomplish specific tasks, with the organization's strategic objectives

**Monitoring** Regularly reviewing and assessing the effectiveness of the governance framework

**Revision**: Updating the governance framework to address these gaps or weaknesses
## Structures

**Boards**: A group of individuals elected by shareholders to oversee the management of an organization

**Committees**: Subgroups of a board of directors, each with a specific focus

**Government Entities**: Establish laws and regulations that organizations must comply with

**Centralized Structures**: Decision-making authority is concentrated at the top levels of management

**Decentralized Structures**: Distributes decision-making authority throughout the organization
## Policies

**AUP - Acceptable Use Policy**: A document that outlines the do's and don'ts for users when interacting with an organization's IT systems and resources

**Information Security Policies**: Outline how an organization protects its information assets from threats, both internal and external such as:
- Data Classification
- Access Control
- Encryption
- Physical Security

**Business Continuity**: Focuses on how an organization will continue its critical operations during and after a disruption

**Disaster Recovery**: Focuses specifically on how an organization will recover its IT systems and data after a disaster

**Incident Response**: A plan for handling security incidents

**SDLC - Software Development Lifecycle** Guides how software is developed within an organization

**Change Management**: Aims to ensure that changes are implemented in a controlled and coordinated manner, minimizing the risk of disruptions
## Standards

Provide a framework for implementing security measures, ensuring that all aspects of an organization's security posture are addressed 

**Password Standards**: Dictate the complexity and management of passwords, which are the first line of defense against unauthorized access such as:
- Minimum length requirements
- Mix of uppercase and lowercase letters
- Numbers
- Special characters

**Access Control Standards**: Determine who has access to what  resources within an organization
- DAC - Discretionary Access Control (Orders)
- MAC - Mandatory Access Control (Labels)
- RBAC - Role-Based Access Control (Roles)

**Physical Security Standards**: These standards cover the physical/environmental measures taken to protect an organization's assets and information

**Encryption Standards**: Ensure that data intercepted or accessed without authorization remains unreadable and secure
## Procedures

Systematic sequences of actions or steps taken to achieve a specific outcome

**Emergency Evacuation Procedure**: Outlines the steps employees should take in case of an emergency, such as a fire or natural disaster

**Data Backup Procedure**: Details how and when data should be backed up to prevent data loss
### Change Management

Systematic approach to dealing with changes within an organization during a specified maintenance window
#### Stages

1. The need for change is identified, and the potential impacts are assessed
2. Plan is developed 
3. Change is implemented is stages 
4. A review is conducted
### On/Offboarding

**Onboarding**: The process of integrating new employees into the organization

**Offboarding**: The process of managing the transition when an employee leaves=
### Playbooks
Checklist of actions to perform to detect and respond to a specific type of incident
## Considerations

**Regulatory**: These regulations can cover a wide range of areas, from data protection and privacy to environmental standards and labor laws

**Legal**: Closely tied to regulatory considerations, but they also encompass other areas such as contract law, intellectual property, and corporate law

**Industry**: The specific standards and practices that are prevalent in a particular industry

**Geographic**: Local, Regional, National, or Global ordinances or zoning laws
# Compliance

Adherence to laws, regulations, standards, and policies that apply to the operations of the organization
## Reporting

Systematic process of collecting and presenting data to 
demonstrate adherence to compliance requirements
### Internal

Collection and analysis of data to ensure that an organization is following its internal policies and procedures
### External

Demonstrating compliance to external entities such as regulatory bodies, auditors, or customers, often mandated by law or contract 
## Monitoring

The process of regularly reviewing and analyzing an organization's operations to ensure compliance with laws, regulations, and internal policies
### Internal

Regularly reviewing an organization's operations to ensure compliance with internal policies
### External 

Third-party reviews or audits to verify compliance with external regulations or standards
### Due Diligence

Conducting an exhaustive review of an organization's operations to identify potential compliance risks

**Due Care**: The steps taken to mitigate these risks
### Attestation

Formal declaration by a responsible party that the organization's processes and controls are compliant

**Acknowledgement**: Recognition and acceptance of compliance requirements by all relevant parties
## Automation in Compliance 

Automated compliance systems can streamline data collection, improve accuracy, and provide real-time compliance monitoring

## Consequences

**Fines**: Monetary penalties imposed by regulatory bodies for non-compliance with laws and regulations

**Sanctions**: Strict measures taken by regulatory bodies to enforce compliance 

**Loss of License**: Non-compliance can lead to the loss of a company's license to operate

**Contractual Impacts**: Consequences or effects that arise as a result of a contract between two or more parties

# Review Questions

```aosr-deck-config
{
	"rule": {
		"conditions": {
			"all": [{
				"fact": "card",
				"operator": "regexMatch",
				"value": "Governance and Compliance",
				"path": "$.path"
			}]
		},
		"event": {
			"type": "match"
		}
	}
}
```

#Q 
What is Governance Revision?
?
Updating the governance framework to address these gaps or weaknesses

#Q  #AOSR/ab9dd
What is Governance Monitoring?
? #AOSR/ab9dd/m/7lpj
Regularly reviewing and assessing the effectiveness of the governance framework

#Q 
What is Governance?
?
Overall management of the organization's IT infra., policies, procedures, and operations

#Q 
What is a Board of Directors?
?
A group of individuals elected by shareholders to oversee the management of an organization

#Q 
What is a Committee?
?
Subgroups of a board of directors, each with a specific focus

#Q 
What is the difference on Centralized/Decentralized Structures?
?
**Centralized**: Decision-making authority is concentrated at the top levels of management
**Decentralized**: Distributes decision-making authority throughout the organization

#Q 
What is an AUP?
?
**Acceptable Use Policy**: A document that outlines the do's and don'ts for users when interacting with an organization's IT systems and resources

#Q 
What is an Information Security Policy?
?
Outline how an organization protects its information assets from threats, both internal and external such as Data Classification, Access Controls, Encryption, etc..

#Q 
What is Business Continuity?
?
Focuses on how an organization will continue its critical operations during and after a disruption

#Q 
What is Disaster Recovery?
?
Focuses specifically on how an organization will recover its IT systems and data after a disaster

#Q 
What is Incident Response?
?
A plan for handing security incidents

#Q 
What is SDLC?
?
**Software Development Lifecycle** Guides how software is developed within an organization

#Q 
What is Change Management?
?
Aims to ensure that changes are implemented in a controlled and coordinated manner, minimizing the risk of disruptions

#Q 
What are the types of Access Control Standards?
?
**DAC - Discretionary Access Control (Orders)**: DAC allows the owner of the resource to control who has access based on user identity and grants permissions at their discretion.
**MAC - Mandatory Access Control (Labels)**: MAC restricts access based on fixed policies set by the system, where users cannot alter access rights and are assigned labels defining the level of access.
**RBAC - Role-Based Access Control (Roles)**: RBAC assigns access permissions based on the roles assigned to users within an organization, allowing users to perform tasks based on their role rather than their identity.

#Q 
What are the 4 Governance Considerations?
?
**Regulatory**: These regulations can cover a wide range of areas, from data protection and privacy to environmental standards and labor laws
**Legal**: Closely tied to regulatory considerations, but they also encompass other areas such as contract law, intellectual property, and corporate law
**Industry**: The specific standards and practices that are prevalent in a particular industry
**Geographic**: Local, Regional, National, or Global ordinances or zoning laws

#Q 
What is Compliance?
?
Adherence to laws, regulations, standards, and policies that apply to the operations of the organization

#Q 
What is Compliance Reporting?
?
Systematic process of collecting and presenting data to 
demonstrate adherence to compliance requirements either **internally** to ensure that an organization is following its internal policies or **externally** to demonstrate compliance to external entities

#Q 
What is Compliance Monitoring?
?
The process of regularly reviewing and analyzing an organization's operations to ensure compliance with laws, regulations, and internal policies

#Q 
What are the four potential consequences of not following compliance?
?
**Fines**: Monetary penalties imposed by regulatory bodies for non-compliance with laws and regulations
**Sanctions**: Strict measures taken by regulatory bodies to enforce compliance 
**Loss of License**: Non-compliance can lead to the loss of a company's license to operate
**Contractual Impacts**: Consequences or effects that arise as a result of a contract between two or more parties
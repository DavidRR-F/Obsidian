---
id: Objective 1.1 Security Controls
aliases: []
tags: []
---


## Security

#### Information Security 
The  act of protecting data and information from unauthorized access, unlawful
modification and disruption, disclosure, corruption, and destruction

#### Information System Security
The act of protecting the systems that hold and process the critical data

#### AAA -  Authentication, Authorization, and Accounting

- `Authentication`: the process of verifying the identity of a user or system
- `Authorization`: defines what actions or resources a user can access
- `Accounting`: the act of tracking user activities and resource usage,
typically for audit or billing purposes

### Security Controls
`Security Controls` are measurements or mechanisms put in place to mitigate risks
and protect the confidentiality, integrity, and availability of information
systems and data

#### Security Control Categories

**Technical Controls**: The technologies, hardware, and software mechanisms
that are implemented to manage and reduce risks. Examples: Antivirus software,
Firewalls, Encryption Processes, IDS systems

**Managerial Controls**: Involve the strategic planning and governance side of
security. Examples: Risk Assessments, Security Policies, Training Programs, and
Incident Response Strategies

**Operational Controls**: Procedures and measures that are designed to protect
data on a day-to-day basis and are mainly governed by internal processes and
human actions. Examples: Password Rotations, Backup Procedures, Account Reviews,
and User Training Programs 

**Physical Controls**: Tangible, real-world measures taken to protect assets.
Examples: Surveillance Camera's, Biometric Scanners, Document Shredding, Security
Guards, Locking Doors, etc..


#### Security Control Types

**Preventative Controls**: Proactive measures implemented to thwart potential
security threats or breaches. Examples: Firewalls 

**Deterrent Controls**: Aim to discourage potential attackers by making the
effort seem less appealing or more challenging. Examples: Burglar Alarm Signs

**Detective Controls**: Monitor and alert orgs to malicious activities as they
occur or shortly thereafter, Examples: Security Camera's, IDS system,
Anti malware software (detecting)

**Corrective Controls**: Mitigated any potential damage and restore the systems
to their normal state. Examples: Restoring from Backups, Antivirus software (quarantining)

**Compensating Controls**: Alternative measures that are implemented when
primary security controls are not feasible or effective. Examples: Using WPA2
with VPN instead of using WPA3

**Directive Controls**: Often rooted in policy or documentation and set the
standards for behavior within an org. Examples: Policies/Documentation like AUP 

## Threats and Vulnerabilities


$$
\huge \neg Threat \lor \neg Vulnerability = \neg Risk
$$

#### Vulnerabilities
Any weakness in a system design or implementation that can be exploited:
Software bugs, Misconfigured software, Improperly protected network devices,
Missing security patches, Lack of physical security, etc..

#### Threats
any potential danger that can exploit a vulnerability to breach security and cause harm or damage to systems, data, or networks

#### Risk Management
`Risk Managerment` is finding different ways to minimize the likelihood of an
outcome and achieve the desired outcomes


# Review Questions

```aosr-deck-config
{
	"rule": {
		"conditions": {
			"all": [{
				"fact": "card",
				"operator": "regexMatch",
				"value": "Security Controls",
				"path": "$.path"
			}]
		},
		"event": {
			"type": "match"
		}
	}
}
```

#Q  #AOSR/3e5ep
What are Physical Controls?
? #AOSR/3e5ep/m/6sp6
Tangible, real-world measures taken to protect assets.
Examples: Surveillance Camera's, Biometric Scanners, Document Shredding, Security
Guards, Locking Doors, etc..

#Q 
What are Operational Controls?
?
Procedures and measures that are designed to protect
data on a day-to-day basis and are mainly governed by internal processes and
human actions. Examples: Password Rotations, Backup Procedures, Account Reviews,
and User Training Programs 

#Q  #AOSR/7efio
What are Managerial Controls?
? #AOSR/7efio/m/69ll
Involve the strategic planning and governance side of
security. Examples: Risk Assessments, Security Policies, Training Programs, and
Incident Response Strategies

#Q 
What are Technical Controls?
?
The technologies, hardware, and software mechanisms
that are implemented to manage and reduce risks. Examples: Antivirus software,
Firewalls, Encryption Processes, IDS systems

#Q  #AOSR/4tdvp
What is a Directive Control?
? #AOSR/4tdvp/m/48n6
Often rooted in policy or documentation and set the
standards for behavior within an org. Examples: Policies/Documentation like AUP 

#Q 
What is a Corrective Control?
?
Mitigated any potential damage and restore the systems
to their normal state. Examples: Restoring from Backups, Antivirus software (quarantining)


#Q  #AOSR/ci4ue
What is a Detective Control?
? #AOSR/ci4ue/m/65hj
Monitor and alert orgs to malicious activities as they
occur or shortly thereafter, Examples: Security Camera's, IDS system,
Anti malware software (detecting)


#Q  #AOSR/3ol6u
What is a Deterrent Control?
? #AOSR/3ol6u/m/5g2m
Aim to discourage potential attackers by making the
effort seem less appealing or more challenging. Examples: Burglar Alarm Signs

#Q  #AOSR/3n21e
What is a Preventative Control?
? #AOSR/3n21e/m/1r6u
Proactive measures implemented to thwart potential
security threats or breaches. Examples: Firewalls 

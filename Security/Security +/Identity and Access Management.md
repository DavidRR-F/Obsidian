# IAM 

System and processes used to manage access to information in an organization to ensure that the right individuals have access to the right resources at the right times for the right reasons

- **Identification**: Claims a username or email as an identity
- **Authentication**: Verifies user's identity, device, or system
- **Authorization**: Establishes the user's access permissions or levels
- **Accounting**: Involves monitoring and recording user actions for compliance and security records

## Account Management

**Provisioning**: Process of creating new user accounts, assigning the, appropriate permissions, and providing users with access to systems

**Deprovisioning**: Process of removing an individual's access rights when the rights are no longer required

**Identity Proofing**: Process of verifying the identity of a user before the account is created

**Interoperability**: The ability of different systems, devices, and applications to work together and share information (using standards like saml or openid connect)

**Attestation**: Process of validating that user accounts and access rights are correct and up-to-date 

## Multifactor Authentication

[[Security Fundamentals#Authentication Methods]]

Security system that requires more than one method of authentication from independent categories of credentials to verify the user's identity with factors such as:
- Knowledge
- Possession
- Inherence
- Behavior
- Location

## Password Security

Measures the effectiveness of a password's ability to resist guessing and brute-force attacks

**Password Policy**: a set of rules designed to enhance security by requiring users to create strong, complex passwords and periodically update them:
- Length: at least 12-16 characters
- Complexity: uppercase, lowercase, symbols, numbers
- Reuse: don't allow password reuse
- Expiration: mandate regular password changes
- Age: length of time the password has been used
#### [[Password Attacks]]
## SSO

Single Sign-On, Authentication process that allows a user to access multiple applications or websites by login in only once with a single set of credentials based on a trusted relationship that is established between an application and an Identity Provider

**Identity Provider**: System that creates, maintains, and manages identity information for principals while providing authentication services to relying applications within a federation or distributed network

**LDAP**: Used to access and maintain distributed directory information services over an Internet protocol network
- Also used in authentication and serves as a central repository for user information
- ***LDAPS***: LDAP over SSL or StartTLS, both of which encrypt the data to provide secure transmission

**OAuth**: Open standard for token-based authentication and authorization that allows an individual's account information to be used by third-party services without exposing the user's password

**SAML**: Security Assertion Markup Language, A standard for logging users into applications based on their sessions in another context
## Federation

Process that allows for the linking of electronic identities and attributes to store information across multiple distinct identity management systems by using the trusted relationships that exist between different systems

Usually relies on SAML, OAuth, or OpenID Connect as the authentication protocol
### Process

1. **Login Initiation**: user accesses a service or application and chooses to log in
2. **Redirection to an identity provider**: service provider redirects the user to the IdP for authentication
3. **Authenticating the user**: After a user submits credentials to the IdP, it validates the user's identity
4. **Generation of an assertion**: The IdP creates an assertion that includes information about the user's identity
5. **Returning to the service provider**: The user is redirected back to the service provider with the authentication assertion from the IdP
6. **Verification and access**: the service provider checks the assertion from a trusted IdP and grants access based on its information

## PAM

Privileged Access Management is a solution that helps organizations restrict and monitor privileged access within an IT environment

**JIT Permissions**: Just-In-Time Permissions Security model where administrative access is granted only when needed for a specific period

**Password Vaulting**: Technique used to store and manage passwords in a secure environment, such as in a digital vault

**Temporal Accounts**: Used to provide time-limited access to resources, and they are automatically disabled or deleted after a certain period of time

## Access Control Models

[[Securing TCP - IP#Access Control]]

### Additional Controls

**Rule-Based**: Allows admins to apply controls to all users

**Attribute-Based**: Uses object characteristics for access control decisions
- User Attributes: Name, Role, Org, ID, Clearance Level
- Environment Attributes: Time, location, current org threat level
- Resource Attributes: File Creation Time, resource owner, file name, data sensitivity
# Review Questions

```aosr-deck-config
{
	"rule": {
		"conditions": {
			"all": [{
				"fact": "card",
				"operator": "regexMatch",
				"value": "Identity and Access Management",
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


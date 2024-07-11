---
id: Data Protection
aliases:
  - Data Protection
tags: []
---

# Data Protection
Process of safeguarding important information from corruption, compromise, or
loss

## Data Classifications
Category based on the organization's value and the sensitivity of the
information if it were to be disclosed

**Sensitive Data**: Any information that can result in a loss of security of a
loss of advantage to a company if access by an unauthorized person

### Classification Schema

#### Commercial Business

**Public**: Has no impact on your company if released and is often posted in a
open-source environment

**Sensitive**: Has minimal impact if released (organization financial data)

**Private**: Contains data that should only be used within the organization that
relates to an individual identity (personal records, salary information, etc..)

**Confidential**: Contains items such as trade secrets, intellectual property
data, and source code that affect the business if disclosed 

**Critical**: Contains valuable information. Viewing is restricted to a few
trusted individuals

#### Government

**Unclassified**: Data that can be released to the public under the Freedom of
Information Act

**Sensitive but Unclassified**: Data that would not hurt national security but
could impact those whose data was being used (medical records, etc..)

**Confidential**: Data that could seriously affect the government if
unauthorized disclosures happen. (Serious effect)

**Secret**: Data that ***could*** damage national security if disclosed.
(Serious Damage)

**Top Secret**: Data that ***would*** damage national security if disclosed (weapon
blueprints)

### Data Lifecyle
The life cycle of data defined in policies the cover the collection, retention,
and disposal of organizational data that follow local, state, and government
laws and regulations for data retention time requirements

## Data Ownership 
Process of identifying the person responsible for the confidentiality,
integrity, availability, and privacy of the information assets

**Data Owner**: Senior executive role that has the responsibility for
maintaining the confidentiality, integrity, and availability of the information
asset

**Data Controller**: Entity that holds responsibility for deciding the purposes
and methods of data storage, collection, usage, and for guaranteeing the
legality of processes

**Data Processor**: Group or individual hired by the data controller to help
with tasks like collecting, storing, or analyzing data

**Data Steward**: Focused on the quality of the data and the associated metadata

**Data Custodian**: Responsible for handling the management of the system on
which the data assets are stored (Sys Admins)

**Privacy Officer**: Role that is responsible for the oversight of any kind of
privacy-related data like PII, SPI, or PHI

## Data States 

#### **Data a Rest**
Refers to any data stored in databases, file systems, or other storage systems.
This data should be encrypted since it is a prime target for threat actors

##### Encryption

**Full Disk Encryption (FDE)**: Encrypts the entire hard drive

**Partition Encryption**: Encrypts specific partitions of a hard drive, leaving
other partitions unencrypted

**Volume Encryption**: Encrypts a set of selected files or directories

**Database Encryption**: Encrypts data stored in a database

**Record Encryption**: Encrypts specific fields within a database record

#### **Data in Transit**
Refers to data actively moving from one location to another, such as across the
internet or through a private network

##### Encryption 

**SSL/TLS**: Cryptographic protocols designed to provide secure communication
over a computer network

**VPN**: Creates a secure connection over a less secure network

**IPSec**: Internet Protocol Security, suite used to secure IP communications
by authenticating and encrypting each IP packet in a data stream

#### **Data in Use**
Refers to data in the process of being created, retrieved, updated, or deleted

##### Protection
- Application Level Encryption 

- Access Controls

- Secure Enclaves

- Software Guard

## Data Types

#### Regulated Data 
Information controlled by laws, regulations, or industry standards. This data
must compile with specific data requirements such as `GDPR` - Deneral Data
Protection Regulation or `HIPPA` - Health Insurance Portability and
Accountability Act

- PII - Personal Identifiable Information: Any information that can be used to identify an individual 

- PHI - Protected Health Information: Any information about health status,
  provision of healthcare, or payment for healthcare that can be linked to a
  specific individual

#### Trade Secrets 
Type of confidential business information that provides a company with a
competitive edge.

#### Intellectual Property
Creations of the mind, such as inventions, literary and artistic works, designs,
and symbols

#### Legal Information 
Includes any data related to legal proceedings, contracts, or regulatory
compliance

#### Financial Information 
Includes data related to an organization's financial transactions, such as sales
records, invoices, tax documents, and bank statements

#### Human-readable Data 
Information that can be understood by humans without the need for a machine or
software

#### Non-human readable data
Information that requires a machine or software to interpret

## Data Sovereignty
Refers to the concept that digital information is subject to the laws of the
country in which it is collected or processed

### Geographical Considerations
The geographical location of data storage and processing can significantly
impact businesses. For example the European Unions `GDPR` - General Data
Protection Regulation, Has stringent rules for data protection and grants
individuals strong rights over their personal data

- Knowing the physical location of datacenters

- Ensure that information is not illegally transferred

## Securing Data

**Geofencing**: Involves setting up virtual boundaries to restrict data access
based on geographic location 

**Encryption**: Fundamental data security method that transforms readable data
into cihpertext

**Hashing**: Technique that converts data into a fixed size of numerical or
alphanumeric characters, to ensure data is not manipulated in transit

**Masking**: Involves replacing some or all of the data in a field with a
placeholder, such as "x", to conceal the original content Example: `***-**-1111`

**Tokenization**: Replaces sensitive data with non-sensitive substitutes, known
as tokens

**Obfuscation**: Involves making data unclear or unintelligible, making it
difficult for unauthorized users to understand

**Segmentation**: Involves dividing a network into seperate segments, each with
its own security controls 

**Permission Restrictions**: Involve defining who has access to specific data
and what they can do with it

## Data Loss Prevention - DLP
Set up to monitor the data of a system while it's in use, in transit, or at rest
in order to detect any attempts to steal the data 

**Endpoint DLP System**: A piece of software on a workstation or laptop that monitors the data that's in
use on that compute Similar to IDS or IPS but with data

**Network DLP System**: A piece of software or hardware placed at the perimeter of the network to detect
data in transit

**Storage DLP System**: A software that is installed on a server in the data center and inspects the
data while it's at rest on the server

**Cloud-based DLP System**: Usually offered as SaaS, and it's part of the cloud service and storage needs

## Review Questions

#Q 
What is the Top Secret Data Classification?
?
Government classification, data that ***would*** damage national security if
disclosed

#Q 
What is the Secret Data Classification?
?
Government classification, data the ***could*** damage national security if
disclosed

#Q 
What is the Government Confidential Data Classification?
?
Data that could seriously affect the government if unauthorized disclosures
happen 

#Q 
What is the Sensitive but Unclassified Data Classification?
?
Government classification, data that would not hurt national security but could
impact those whose data was being used 

#Q 
What is the Unclassified Data Classification?
?
Government classification, data that can be released to the public under the
Freedom of Information Act 

#Q 
What is the Critical Data Classification?
?
Business classification, data that that contains valuable information with
restricted viewing within the organization

#Q 
What is the Business Confidential Data Classification?
?
Contains data such as trade secrets, intellectual property, and source code that
can affect the business if disclosed

#Q 
What is the Private Data Classification?
?
Business classification of data that should only be used within an organization
that relates to individual entities (pid)

#Q 
What is the Sensitive Data Classification?
?
Business classification of data that has minimal impact if released (org fin
data)

#Q 
What is the Public Data Classification?
?
Business classification of data that has no impact if released 

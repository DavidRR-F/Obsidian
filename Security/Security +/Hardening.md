## Changing Default Configurations

1. Change/Disable Default Passwords
2. Disable any unneeded ports and protocols on the system
3. Check for any open ports on the devices

## Restricting Applications

**Least Functionality**: A process of configuring a workstation or server with only essential applications and services for the user
- Restrict/Uninstall unneeded applications, ports, and protocols

**Secure Baseline Image**: A standardized workstation setup, including OS, essential applications, and strict policies in corporate networks

**Allowlisting**: A security measure that permits only approved applications to run on a operating system

**Blocklisting**: Entails preventing listed applications from running, allowing all others to execute

## TOS - Trusted Operating Systems

Designed to provide a secure computing environment by enforcing stringent security policies that usually rely on mandatory access controls

Trusted OS enhances security with microkernels by minimizing the trusted base and reducing attack surface and vulnerabilities

*Note*: uses [[Securing TCP - IP#Mandatory Access Control (MAC)]] permissions

**SELinux**: Security Enhanced Linux, Set of controls that are installed on to of another Linux distribution like CentOS or RHEL

**Trusted Solaris**: Offers secure, multi-level operations with MAC, detailed system audits, and data/process compartmentalization
## Updates and Patches

**Hotfix**: A software patch that solves a security issue and should b=e applied immediately after being tested in a lab environment

**Update**: Provides a system with additional functionality, but it does not usually provide any patching of security related issues

**Service Pack**: Includes all the hotfixes and updates since the release of the operating system

1. Assign a dedicated team to track vendor security patches
2. Establish automated system-wide patching for OS and applications
3. Include cloud resources in the patch management
4. Categorize patches as urgent, important, or non-critical for prioritization
5. Create a test environment to verify critical patches before production deployment
6. Maintain comprehensive patching logs for program evaluation and monitoring
7. Establish a process for evaluating, testing, and deploying firmware updates
8. Develop a technical process for deploying approved urgent patches to production
9. Periodically assess non-critical patches for combined rollout

## Patch Management

Planning, testing, implementing, and auditing of software patches

1. **Planning**: Creating policies, procedures, and systems to track and verify patch compatibility
2. **Testing**: I small network or lab used to test a new patch before releasing it across your entire network environment
3. **Implementation**: Manual or automated process of deploying patches to systems within your network
4. **Auditing**: Scanning the network to ensure if a patch was installed properly and if there are any unexpected errors that have occurred because of that installation

## Group Policies

Set of rules or policies that can be applied to a set of users or computer accounts within a operating system that can contain rules like:
- Password requirements 
- Account lockout policies
- Software restrictions
- Application restrictions

**Security Template**: A group of policies that can be loaded through one procedure

**Baselining**: Process of measuring changes in the network, hardware, or software environment

## SELinux

By default Linux uses [[Securing TCP - IP#Discretionary Access Control (DAC)]] based permissions while SELinux relies on [[Securing TCP - IP#Mandatory Access Control (MAC)]] for its access control schema that provides additional content security

**Context-based Permissions**: Permission schemes that are defined by various properties for a given file or process

#### SELinux Permissions Objects

**User**: Defines what users can access an object
- ***All Users***: Unconfined_u
- ***Unprivileged Users***: User_u
- ***System Administrator***: Sysadmin_u
- ***Root***: Root

**Role**: Defines what roles can access a given object

**Type**: Groups objects together that have similar security requirements or characteristics

**Level**: Used to describe the sensitivity level of a given file, directory, or process

### SELinux Modes

**Disabled**: SELinux is essentially turned off, and so MAC is not going to be implemented

**Enforcing**: All the SELinux security policies are being enforced

**Permissive**: SELinux is enabled, but the security policies are not enforced

### SELinux Policies

**Targeted**: Processes that are targeted will run in a confined domain, and non-targeted processes will run in an unconfined domain

**Strict**: Everything is forced to operate on the MAC method


## Data Encryption Levels

**Full-disk Encryption**: Encrypts the entire hard drive to protect all of the data being stored on it

**Partition Encryption**: Similar to full-disk encryption, but it is only applied to a specific partition on the storage device 

**Volume Encryption**: Used to encrypt a set space on the storage medium, creating an encrypted container that can house various files and folders

**File-level Encryption**: Used to encrypt an individual file instead of an entire partition or an entire disk drive

**Database Encryption**: Secures the entire database, extending to multiple storage devices or cloud storage, similar to full-disk encryption

**Record-Level Encryption**: Used to encrypt individual records or rows within a database


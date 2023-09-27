
## Hyper-V
Microsoft's hardware virtualization product (VM) that are packaged into Virtual Had Disk formats (VHD, VHDX files) with 2 generations of VMs:
- **Generation 1** - support most guest operating systems
	- BIOS-based architecture
- **Generation 2** - support most 64-bit versions of Windows and more current versions of Linux and FreeBSD operating systems
	- UEFI-based boot architecture

## SSH, RDP, and Bastion
Azure provides 3 ways to connect to your Virtual Machines

- **Secure Shell (SSH)**: protocol to establish a secure connection between a client and server
	- this is how you can remotely connect to your azure VM via terminal
	- SSH happens on Port 22 via TCP
	- RSA Key Pairs are commonly used to authorize access
- **Remote Desktop Protocol (RDP)**: proprietary protocol developed by Microsoft which provides a user with graphical interface to connect to another computer over a network connection
	- This is how you can remotely connect to windows server via visual desktop
	- RDP happens on port 3389 via TCP and UDP
- **Bastion**: Azure Bastion is a service you can deploy that lets you connect to a virtual machine using your browser and the Azure portal. It provides a secure and seamless RDP/SSH connectivity to your virtual machines directly from the Azure portal over TLS. A Bastion is a hardened instance the is monitored. Users connect to this VM which then establishes connections to the target instance. Sometime known as jump box since you have one extra security step

# SSH

![[Pasted image 20230731133615.png]]

# RDP
![[Pasted image 20230731133858.png]]

# Azure Bastion
![[Pasted image 20230731134220.png]]

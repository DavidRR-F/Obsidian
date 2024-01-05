- fix a problem booting the operating system
- get past the lost root password
- fix networking and package management are broken
- handle lv resizing
- learn kvm


I've used one or more of the below resources in my Red Hat cert journey, of course starting with RHCSA.

[The official Red Hat documentation is free]([https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/)) is a great resource to have while studying because it will teach you best practices as it relates to Red Hat exams.

**Blogs**

[CertDepot](https://www.certdepot.net/rhel7-certification-overview/) is a fantastic resource for those going for RHCSA/RHCE. There are plenty of how-tos and resources to supplement your studies with. Also, there are exam objective changes, advanced exercises, and other exam prep resources.

[Lisenet](https://www.lisenet.com/rhce/) is one of the best for navigating the RHCE/RHCA level exams. There is thoughtful insight into the exam experience (without breaking the NDA), carefully crafted how-tos on every RHCE exam objective, and exam tips to make you successful on exam day. Lastly, there are helpful study notes for some RHCA level exams.

[Rootusers](https://www.rootusers.com/red-hat-certified-system-administrator-rhcsa-ex200-study-guide/) - Great comprehensive blog with study guides for RHCSA/RHCE and how-to guides for many different exam related tasks.

**Exam Prep Books**

_(Note: mods got mad with posting external links, you can find all of these on Amazon.)_

RHCSA/RHCE exam prep book by Sander Van Vugt

RHCSA/RHCE exam prep book by Michael Jang and Alessandro Orsaria

**Video Courses**

[Red Hat Learning Subscription](https://www.redhat.com/en/services/training/learning-subscription) obviously would be the way to go if you can afford the hefty subscription prices. There is a 7 day free trial that you can take advantage of for testing out the platform before committing to the yearly subscription. There are courses for every Red Hat exam, cloud based labs, early access to new content, and practice exams depending on which tier you go with.

[O'Reilly Learning Platform](https://learning.oreilly.com/register/) - Highly recommend if you can't afford the RHLS. This would be my first choice for unofficial Red Hat courseware since all of Sander Van Vugt's courses are published on this platform among others (Including electronic version of most of the exam prep books stated below). Sander is the closest you’ll get to the official Red Hat courses in my opinion. There are varies courses that span from RHCSA to RHCA level exam prep. There are also live learning sessions that include RHCSA/RHCE crash courses, as well as, Openshift/Ansible/Containers/Kubernetes courses.

[Linux Academy](https://linuxacademy.com/) is another learning platform that has a robust catalog that spans the whole IT environment. It also includes cloud based servers and exercises that make it an all inclusive experience. As far as quality goes, I expected more, but it is still a decent resource and many have successfully passed their certifications using their platform.

**Study Groups**

I created the [Red Hat Certs Slack Workspace](https://join.slack.com/t/redhat-certs/shared_invite/enQtNjM4MTA3OTU1NDI0LTRkMzYxOGY3NjEwNTk4ZWQwMGMwMmMyNWYxMDRlZjg4NzgwMDdmZGU2OGNjMzMwNDQ1MTY1NmY1N2U3NTNlYWM) to help budding RHCSAs all the way up to full-metal RHCAs. It has exam resources (check pinned items), filled with smart people ready to help and answer your questions, and like [u/Tekz08](https://www.reddit.com/u/Tekz08/) mentioned, there are practice exam resources to test your skills before sitting the exam such as practice exams and automated environment deployments.

If Slack is not your bag then there is also a [Discord](https://discord.gg/waTErpp) group that I discovered after creating the slack group above. It is also filled with accomplished RHCSA/RHCE/RHCAs willing to help you get certified.

**Automated Environment Deployments**

Here are some automated practice environments I created as a project in my journey to the Ansible exam. I thought I'd share these practice resources for everyone to use as well. The VMs are automatically deployed with Vagrant using VirtualBox in headless mode and configured with Ansible.

The aim is to have a reusable environment to study with without having to manually build it up each time. I would still recommend being proficient in building up your own environment but after hundreds of times doing it myself, it’s nice to have a reproducible and less error prone way of setting up a practice environment. You can practice individual tasks or do a full practice exam.

If you are looking for practice exams to take against these environments, head to the [Red Hat Certs Slack Workspace](https://join.slack.com/t/redhat-certs/shared_invite/zt-7ju3rz7b-_G3Njp3PDwdBG_81SwPeLA) and check the pinned items in the #practiceexam channel. Navigate to the below environment repo you wish to use and follow the README instructions.

[RHCSA 7](https://github.com/rdbreak/rhcsa7env)

[RHCSA 8](https://github.com/rdbreak/rhcsa8env)

The below environments are for when you pass your RHCSA ;)

[RHCE 7](https://github.com/rdbreak/rhce7env)

[RHCE 8](https://github.com/rdbreak/rhce8env)

[Ansible 2.3](https://github.com/rdbreak/ansible23env)

[Ansible 2.7](https://github.com/rdbreak/ansible27env)

## Understand and use essential tools

- Access a shell prompt and issue commands with correct syntax.
- Use input-output redirection (>, >>, |, 2>, etc.).
- Use grep and regular expressions to analyze text.
- Access remote systems using ssh.
- Log in and switch users in multiuser targets.
- [Archive, compress, unpack, and uncompress files using tar, star, gzip, and bzip2](https://www.certdepot.net/sys-archive-compress-unpack-and-uncompress-files/ "SYS: Archive, compress, unpack, and uncompress files using tar, star, gzip, and bzip2.").
- [Create and edit text files](https://www.certdepot.net/sys-create-edit-text-files/ "SYS: Create and edit text files.").
- Create, delete, copy, and move files and directories.
- [Create hard and soft links](https://www.certdepot.net/sys-create-hard-and-soft-links/ "SYS: Create hard and soft links.").
- List, set, and change standard ugo/rwx permissions.
- [Locate, read, and use system documentation including man, info, and files in /usr/share/doc](https://www.certdepot.net/rhel7-locate-system-documentation/ "RHEL7: Locate, read, and use system documentation including man, info, and files in /usr/share/doc.").

NOTE: Red Hat may use applications during the exam that are not included in Red Hat Enterprise Linux for the purpose of evaluating candidate’s abilities to meet this objective.

## Operate running systems

- [Boot, reboot, and shut down a system normally](https://www.certdepot.net/rhel7-boot-reboot-shut-system-normally/ "RHEL7: Boot, reboot, and shut down a system normally.").
- [Boot systems into different targets manually](https://www.certdepot.net/rhel7-boot-systems-different-targets-manually/ "RHEL7: Boot systems into different targets manually.").
- [Interrupt the boot process in order to gain access to a system](https://www.certdepot.net/rhel7-interrupt-boot-gain-access-system/ "RHEL7: Interrupt the boot process in order to gain access to a system").
- [Identify CPU/memory intensive processes, adjust process priority with renice, and kill processes](https://www.certdepot.net/sys-identify-cpu-memory-intensive-processes/ "SYS: Identify CPU/memory intensive processes, adjust process priority with renice, and kill processes.").
- [Locate and interpret system log files and journals](https://www.certdepot.net/rhel7-interpret-system-log-files/ "RHEL7: Locate and interpret system log files and journals.").
- [Access a virtual machine’s console](https://www.certdepot.net/rhel7-access-virtual-machines-console/ "RHEL7: Access a virtual machine’s console.").
- [Start and stop virtual machines](https://www.certdepot.net/sys-start-and-stop-virtual-machines/ "SYS: Start and stop virtual machines.").
- [Start, stop, and check the status of network services](https://www.certdepot.net/rhel7-start-stop-check-status-network-services/ "RHEL7: Start, stop, and check the status of network services.").
- [Securely transfer files between systems](https://www.certdepot.net/rhel7-securely-transfer-files/ "RHEL7: Securely transfer files between systems.").

## Configure local storage

- [List, create, delete partitions on MBR and GPT disks](https://www.certdepot.net/rhel7-create-delete-partitions/ "RHEL7: List, create, delete partitions on MBR and GPT disks.").
- [Create and remove physical volumes, assign physical volumes to volume groups, and create and delete logical volumes](https://www.certdepot.net/sys-manage-physical-volumes-volume-groups-and-logical-volumes/ "SYS: Create and remove physical volumes, assign physical volumes to volume groups, and create and delete logical Volumes.").
- [Configure systems to mount file systems at boot by Universally Unique ID (UUID) or label](https://www.certdepot.net/sys-configure-systems-to-mount-file-systems-by-uuid/ "SYS: Configure systems to mount file systems at boot by Universally Unique ID (UUID) or label.").
- [Add new partitions and logical volumes, and swap to a system non-destructively](https://www.certdepot.net/sys-add-swap-to-a-system/ "SYS: Add new partitions and logical volumes, and swap to a system non-destructively.").

## Create and configure file systems

- [Create, mount, unmount, and use vfat, ext4 and xfs file systems](https://www.certdepot.net/rhel7-use-vfat-ext4-xfs-file-systems/ "RHEL7: Create, mount, unmount, and use vfat, ext4 and xfs file systems.").
- [Mount and unmount CIFS and NFS network file systems](https://www.certdepot.net/rhel7-mount-unmount-cifs-nfs-network-file-systems/ "RHEL7: Mount and unmount CIFS and NFS network file systems.").
- [Extend existing logical volumes](https://www.certdepot.net/rhel7-extend-existing-unencrypted-logical-volumes/ "RHEL7: Extend existing unencrypted logical volumes.").
- [Create and configure set-GID directories for collaboration](https://www.certdepot.net/sys-configure-set-gid-directories/ "SYS: Create and configure set-GID directories for collaboration.").
- [Create and manage Access Control Lists (ACLs)](https://www.certdepot.net/sys-manage-acl/ "SYS: Create and manage Access Control Lists (ACLs).").
- Diagnose and correct file permission problems.

## Deploy, configure, and maintain systems

- [Configure networking and hostname resolution statically or dynamically](https://www.certdepot.net/rhel7-configure-ipv4-addresses/ "RHEL7: Configure IPv4 addresses and perform basic IPv4 troubleshooting.").
- Schedule tasks using at and cron.
- [Start and stop services and configure services to start automatically at boot](https://www.certdepot.net/rhel7-start-stop-check-status-network-services/ "RHEL7: Configure network services to start automatically at boot.").
- [Configure systems to boot into a specific target automatically](https://www.certdepot.net/rhel7-configure-systems-boot-specific-target/ "RHEL7: Configure systems to boot into a specific target automatically.").
- [Install Red Hat Enterprise Linux systems as virtual guests](https://www.certdepot.net/rhel7-install-red-hat-enterprise-linux-systems-virtual-guests/ "RHEL7: Install Red Hat Enterprise Linux systems as virtual guests.").
- [Configure systems to launch virtual machines at boot](https://www.certdepot.net/sys-configure-systems-to-launch-virtual-machines-at-boot/ "SYS: Configure systems to launch virtual machines at boot.").
- [Configure network services to start automatically at boot](https://www.certdepot.net/rhel7-start-stop-check-status-network-services/ "RHEL7: Configure network services to start automatically at boot.").
- [Configure a system to use time services](https://www.certdepot.net/rhel7-set-ntp-service/ "RHEL7: How to set up the NTP service.").
- [Install and update software packages from Red Hat Network, a remote repository, or from the local file system](https://www.certdepot.net/sys-manage-software-packages/ "SYS: Install and update software packages from Red Hat Network, a remote repository, or from the local file system.").
- [Update the kernel package appropriately to ensure a bootable system](https://www.certdepot.net/rhel7-update-the-kernel-package/ "RHEL7: Update the kernel package appropriately to ensure a bootable system.").
- [Modify the system bootloader](https://www.certdepot.net/rhel7-get-started-grub2/).

## Manage users and groups

- [Create, delete, and modify local user accounts](https://www.certdepot.net/sys-create-delete-local-user-accounts/ "SYS: Create, delete, and modify local user accounts.").
- [Change passwords and adjust password aging for local user accounts](https://www.certdepot.net/sys-change-passwords-and-adjust-password-aging/ "SYS: Change passwords and adjust password aging for local user accounts.").
- [Create, delete, and modify local groups and group memberships](https://www.certdepot.net/sys-create-delete-and-modify-local-groups/ "SYS: Create, delete, and modify local groups and group memberships.").
- [Configure a system to use an existing authentication service for user and group information](https://www.certdepot.net/rhel7-configure-system-use-existing-ldap-directory-service-user-group-information/ "RHEL7: Configure a system to use an existing LDAP directory service for user and group information.").

## Manage security

- [Configure firewall settings using firewall-config, firewall-cmd, or iptables](https://www.certdepot.net/rhel7-get-started-firewalld/ "RHEL7: How to get started with Firewalld.").
- [Configure key-based authentication for SSH](https://www.certdepot.net/rhel7-configure-ssh-key-based-authentication/ "RHEL7: Configure SSH key-based authentication.").
- [Set enforcing and permissive modes for SELinux](https://www.certdepot.net/selinux-set-enforcing-and-permissive-modes/ "SELINUX: Set enforcing and permissive modes for SELinux.").
- [List and identify SELinux file and process context](https://www.certdepot.net/selinux-list-file-and-process-context/ "SELINUX: List and identify SELinux file and process context.").
- [Restore default file contexts](https://www.certdepot.net/selinux-restore-default-file-contexts/ "SELINUX: Restore default file contexts.").
- [Use boolean settings to modify system SELinux settings](https://www.certdepot.net/selinux-use-boolean-settings/ "SELINUX: Use boolean settings to modify system SELinux settings.").
- [Diagnose and address routine SELinux policy violations](https://www.certdepot.net/selinux-diagnose-policy-violations/ "SELINUX: Diagnose and address routine SELinux policy violations.").

[1:15:02](https://www.youtube.com/watch?v=Qt7l-TFBMo4&t=4502s) - Chmod and Chgrp Commands [1:30:04](https://www.youtube.com/watch?v=Qt7l-TFBMo4&t=5404s) - Linux File Structure and Boot Process [1:37:59](https://www.youtube.com/watch?v=Qt7l-TFBMo4&t=5879s) - VI Editor [1:48:59](https://www.youtube.com/watch?v=Qt7l-TFBMo4&t=6539s) - User Administration [2:26:01](https://www.youtube.com/watch?v=Qt7l-TFBMo4&t=8761s) - Create New Linux File System [2:21:22](https://www.youtube.com/watch?v=Qt7l-TFBMo4&t=8482s) - File System Check and Swap Management [2:35:21](https://www.youtube.com/watch?v=Qt7l-TFBMo4&t=9321s) - Recover Root Password [2:45:26](https://www.youtube.com/watch?v=Qt7l-TFBMo4&t=9926s) - Disk Quotas and Access Lists [3:05:27](https://www.youtube.com/watch?v=Qt7l-TFBMo4&t=11127s) - Volume and Printer Management [3:16:29](https://www.youtube.com/watch?v=Qt7l-TFBMo4&t=11789s) - Scheduling and Process Administration [3:29:32](https://www.youtube.com/watch?v=Qt7l-TFBMo4&t=12572s) - Backup and Restore [3:44:33](https://www.youtube.com/watch?v=Qt7l-TFBMo4&t=13473s) - Networking [3:58:27](https://www.youtube.com/watch?v=Qt7l-TFBMo4&t=14307s) - SELinux [4:05:35](https://www.youtube.com/watch?v=Qt7l-TFBMo4&t=14735s) - Remote Connection [4:11:44](https://www.youtube.com/watch?v=Qt7l-TFBMo4&t=15104s) - FTP Server 1 [4:29:48](https://www.youtube.com/watch?v=Qt7l-TFBMo4&t=16188s) - FTP Server 2 [4:36:54](https://www.youtube.com/watch?v=Qt7l-TFBMo4&t=16614s) - Package Administration [4:54:54](https://www.youtube.com/watch?v=Qt7l-TFBMo4&t=17694s) - Network File System 1 [5:08:53](https://www.youtube.com/watch?v=Qt7l-TFBMo4&t=18533s) - Network File System 2 [5:19:00](https://www.youtube.com/watch?v=Qt7l-TFBMo4&t=19140s) - Samba Server 1 [5:30:57](https://www.youtube.com/watch?v=Qt7l-TFBMo4&t=19857s) - Samba Server 2 [5:40:09](https://www.youtube.com/watch?v=Qt7l-TFBMo4&t=20409s) - DHCP Server [5:55:09](https://www.youtube.com/watch?v=Qt7l-TFBMo4&t=21309s) - Network Information Service [6:11:07](https://www.youtube.com/watch?v=Qt7l-TFBMo4&t=22267s) - DNS 1 [6:31:09](https://www.youtube.com/watch?v=Qt7l-TFBMo4&t=23469s) - DNS 2 [6:42:07](https://www.youtube.com/watch?v=Qt7l-TFBMo4&t=24127s) - Apache Server [7:01:06](https://www.youtube.com/watch?v=Qt7l-TFBMo4&t=25266s) - Basic Sendmail Configuration [7:09:06](https://www.youtube.com/watch?v=Qt7l-TFBMo4&t=25746s) - Logical Volume Manager [7:29:06](https://www.youtube.com/watch?v=Qt7l-TFBMo4&t=26946s) - RAID
## System Updates and Repos

`yum` - CentOS
`apt-get` - Debian Linux
### `rpm` 

RPM stands for "Red Hat Package Manager." It is a package management system and a file format used primarily in Linux-based operating systems to package, distribute, install, upgrade, and manage software packages. RPM was originally developed by Red Hat, Inc., but it has since been adopted by many other Linux distributions.

Here are key points about RPM:

1. **Package Management**: RPM provides a standardized way to package software applications and libraries, making it easier to distribute and manage software on Linux systems.
    
2. **File Format**: An RPM package is a compressed archive that contains files, metadata, and installation scripts required to install and manage software. The package file typically has a `.rpm` extension.
    
3. **Metadata**: RPM packages include metadata that describes the package, such as the package name, version, release, dependencies, and more. This metadata helps package managers resolve dependencies and ensure proper installation.
    
4. **Installation and Removal**: RPM allows users to install software packages on their Linux system using package management commands like `rpm` or higher-level package managers like `yum` (for Red Hat-based systems) or `dnf` (for newer Red Hat-based systems) and `zypper` (for SUSE Linux). Packages can also be uninstalled with RPM.
    
5. **Dependency Management**: RPM handles software dependencies by checking whether the required libraries or packages are installed before installing a new package. If dependencies are missing, RPM can automatically attempt to resolve them.
    
6. **Verification**: RPM can verify the integrity of installed packages, checking for file conflicts, unauthorized changes, or missing files. This helps maintain system stability and security.
    
7. **Querying and Listing**: RPM provides commands to query the system's package database and list installed packages, facilitating package management tasks.
    
8. **Compatibility**: While RPM was originally developed by Red Hat and is closely associated with Red Hat-based distributions like Fedora, CentOS, and RHEL (Red Hat Enterprise Linux), it has been adopted by other Linux distributions, including SUSE and openSUSE. Different distributions may have variations in package management tools and package repositories but share the common RPM package format.
    
9. **Building RPM Packages**: Software developers and maintainers can use tools like `rpmbuild` to create their RPM packages for distribution. This allows them to package their software and include necessary metadata for installation on RPM-based systems.

- Check if you have package

```bash
$ rpm -qa | grep <package_name>
```

- Install a Package

```bash
$ rpm -ihv /tmp/<package_name>
```

- Get package Info

```bash
$ rpm -qi <package_name>
```

- Find Package configuration Files

```bash
$ rpm -qc <package_name>
```

- Remove a Package

```bash
$ rpm -e <package_name>
```

- Tell what Package a command is from

```bash
$ which <command>

$ rpm -qf <command_path>
```

## Creating Local Repository (Yum Server)

1. Mount CDROM (Optical) drive (disk that has all the packages)

```bash
$ mnt /dev/sr0
```
## System Upgrade and Patch Management

Two Types of upgrades

- Major Version Upgrades - X.0
	- Backup Files - Build new Server - Transfer Files
- Minor Version Upgrades - 0.X
	- can be done through package manager update commands `yum update -y` or `upgrade` (deletes packages)

## Rollback Updates and Patches

On Virtual Machines you have the ability to rollback changes by creating a snapshot before making any changes, but on a physical machine this is not the case and you must rely on other methods.

- Rollback a package (patch)

```bash
$ yum history undo <package>
```

- Rollback an update

	- Downgrading a system to minor versions is not recommended as this might leave the system in an undesired or unstable state
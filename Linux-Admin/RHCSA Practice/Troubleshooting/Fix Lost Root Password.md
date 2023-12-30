Resetting a forgotten root password on Red Hat Enterprise Linux 8 (RHEL 8) involves accessing the GRUB boot loader and initiating a single-user mode or emergency mode to modify the root password. Here's a step-by-step guide to reset the root password on RHEL 8:

1. **Reboot the System**:
    
    - Begin by rebooting your RHEL 8 system.
    
2. **Access the GRUB Menu**:
    
    - As soon as the BIOS/UEFI screen completes (but before the OS starts loading), press a key like `Esc`, `Shift`, or `F8` to access the GRUB menu. The exact key can depend on the hardware manufacturer.
    
3. **Edit GRUB Boot Parameters**:
    
    - In the GRUB menu, highlight the kernel you usually boot from (typically the first option).
    - Press `e` to edit the boot parameters for this kernel.
    
4. **Modify Kernel Boot Parameters**:
    
    - Find the line that starts with `linux` (or `linux16` or `linuxefi` depending on your system).
    - At the end of this line, add `rd.break`. This will interrupt the boot process before the system hands control over to `systemd`, giving you a chance to reset the root password.
    - Press `Ctrl + X` or `F10` to boot with these parameters.
    
5. **Remount the Root Filesystem**:
    
    - Once you're in the emergency mode (a shell prompt), remount the root filesystem with read-write access:
        
```bash
$ mount -o remount,rw /sysroot
```

- Change the root to the system root directory:

```bash
$ chroot /sysroot
```
        
6. **Reset the Root Password**:
    
    - Now, reset the root password using the `passwd` command:
        
```bash
$ passwd
```
        
-  Follow the prompts to enter and confirm the new root password.

7. **Ensure SELinux Relabeling**:
    
    - For SELinux to update its labels correctly on the next boot, type:
        
```bash
$ thouch /.autorelabel
```
        
8. **Exit and Reboot**:
    
    - Type `exit` to leave the chroot environment.
    - Type `exit` again to exit the emergency mode. The system should continue booting.
    - The system will reboot, and SELinux will relabel the filesystem, which might take some time depending on the size of your filesystem.
    
1. **Log in Using the New Root Password**:
    
    - After the system reboots, you can now log in using the new root password.
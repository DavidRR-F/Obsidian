### WiFi

entry wifi shell

```bash
iwctl
```

scan wifi networks

```bash
station wlan0 get-networks
```

exit and connect to network

```bash
exit 
iwctl --passphase "passphare" station wlan0 connect <network name>
```

### Set root passwd for installer

```bash
passwd
```

### Partition and Install Archlinux on volume

```bash
lsblk
```

create boot partition

```bash
fdisk /dev/nvme0n1

Command (m for help): g # empty partition
Command (m for help): n # create new partition
Partition number (1-128, default 1):
First sector (2048-1000215182, default 2048):
Last sector, +/-sectors or +/-size{K,M,G,T,P}: +1G
```

create efi partition

```bash
Command (m for help): n # create new partition
Partition number (1-128, default 2):
First sector (2048-1000215182, default 10000000182):
Last sector, +/-sectors or +/-size{K,M,G,T,P}: +1G
```

create lvm partition

```bash
Command (m for help): n # create new partition
Partition number (1-128, default 3):
First sector (2048-1000215182, default 10000000182):
Last sector, +/-sectors or +/-size{K,M,G,T,P}:
```

choose partition type

```bash
Command (m for help): t
Partition number (1-128, default 3):
Partition type or alias (type L to list all): 44
```

Finalize

```bash
Command (m for help): w
```

format partitions

```bash
mkfs.fat -F32 /dev/nvme0n1p1
mkfs.ext4 /dev/nvme0n1p2
cryptsetup luksFormat /dev/nvme0n1p3
```

#### Setup LVM

open encrypted partition

```bash
cryptsetup open --type luks /dev/nvme0n1p3 lvm
```

create volume for lvm

```bash
pvcreate /dev/mapper/lvm
```

create volume group

```bash
vgcreate volgroup0 /dev/mapper/lvm
```

create logical volume for root file system

```bash
lvcreate -L 30GB volgroup0 -n lv_root
```

create logical volume for home file system

```bash
lvcreate -L 200GB volgroup0 -n lv_home
```

verify

```bash
vgdisplay
lvdisplay
```

Insert kernel module and activate all volume groups

```bash
modprobe dm_mod
vgscan
vgchange -ay
```

format logical volume groups

```bash
mkfs.ext4 /dev/volgroup0/lv_root
mkfs.ext4 /dev/volgroup0/lv_home
```

mount partitions

```bash
mount /dev/volgroup0/lv_root /mnt
mkdir /mnt/boot # create dir to mount boot partition
mount /dev/nvme0n1p2 /mnt/boot
mkdir /mnt/home # create dir to mount home partition
mount /dev/volgroup0/lv_home /mnt/home
```

## Install archlinux required packages

install base packages

```bash
pacstrap -i /mnt base
```

generate fstab file

```bash
genfstab -U -p /mnt >> /mnt/etc/fstab
```

login to in-progress installation

```bash
arch-chroot /mnt
```

set root password for installation

```bash
passwd
```

create your user

```bash
useradd -m -g users -G wheel david
passwd david
```

#### install packages

base packages

```bash
pacman -S base-devel dosfstools grub efibootmgr lvm2 mtools vi networkmanager os-prober sudo
```

install gui of choice

```bash
pacman -S i3-wm i3status i3lock dmenu gdm
```

install linux kernel and backup lts kernel

```bash
pacman -S linux linux-headers linux-lts linux-lts-headers
```

install linux kernel firmware

```bash
pacman -S linux-firmware
```

setup video card driver

```bash
lspci # looking for gpu
```

```bash
# if amd or intel gpu
pacman -S mesa
# if invidia gpu
pacman -F nvidia nvidia-utils nvidia-lts
```

install hardware decoding package

```bash
# if intel
pacman -S intel-media-driver # brodwell or newer
# if amd
pacman -S libva-mesa-driver
```

Edit configuration file

```bash
vi /etc/mkinitcpio.conf

# HOOKS
HOOKS=(base udev autodetect modconf kms keyboard keymap consolefont block encrypt lvm2 filesystems fsck)
```

generate config

```bash
mkinitcpio -p linux
mkinitcpio -p linux-lts
```

set locale

```bash
vi /etc/locale.gen
# uncomment en_US.UTF-8 UTF-8 or your locale
locale-gen
```

edit grub

```bash
vi /etc/default/grub
# modify
GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 cryptdevice=/dev/nvme0n1p3:volgroup0 quiet"
```

setup efi partition

```bash
mkdir /boot/EFI
mount /dev/nvme0n1p1 /boot/EFI
```

install grub bootloader

```bash
grub-install --target=x86_64-efi --bootloader-id=grub_uefi --rechecl
```

copy user locale to boot directory

```bash
cp /usr/share/locale/en\@quot/LC_MESSSAGES/grub/mo /boot/grub/locale/en.mo
```

generate config file for bootloader

```bash
grub-mkconfig -o /boot/grub/grub.cfg
```

enable gdm and network manager

```bash
systemctl enable gdm
systemctl enable NetworkManager
```

### Unmount and Reboot

```bash
exit
umount -a
```

```bash
reboot
```
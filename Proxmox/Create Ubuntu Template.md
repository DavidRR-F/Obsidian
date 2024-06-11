![[Pasted image 20240609162047.png]]

![[Pasted image 20240609162107.png]]

![[Pasted image 20240609162126.png]]

Delete the disk 

![[Pasted image 20240609162221.png]]

Add cloud-init drive

![[Pasted image 20240609162608.png]]
## SSH into proxmox shell

install the image

```bash
wget <ubuntu-cloud-image>
```

set gui serial port

```bash
qm set <vm-id> --serial0 socket --vga serial0
```

update the image file extension to use `qcow2`

```bash
mv <ubuntu-image> <ubuntu-image>.qcow2
```

Resize image to your preferred minimum

```bash
qmeu-img resize <ubuntu-image>.qcow2 16G
```

import disk

```bash
qm importdisk <vm-id> <ubuntu-image> <storage-disk>
```

Add the disk to your vm

your-vm -> Hardware -> Hard Disk

![[Pasted image 20240609161304.png]]

Edit boot order

![[Pasted image 20240609164105.png]]
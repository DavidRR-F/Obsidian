# Setup

## Prerequisites 

Before configuring k8s you for this configuration you will need a minimum of 2 debian based linux vms preferably with static ip addresses and/or ip reservations.

## Preconfiguration

Disable swap

```bash
# IF ENABLED COMMENT OUT IN FSTAB
free -m to check
```

Edit `/etc/sysctl.conf` to enable ipv4 forwarding

```bash
# UNCOMMENT
net.ipv4.ip_forwarding=1
```

Load netfilter kernel module

```bash
sudo modprobe br_netfilter
echo "br_netfilter" | sudo tee -a /etc/modules-load.d/k8s.conf
```

Set k8s network settings

```bash
sudo tee -a /etc/sysctl.d/k8s.conf <<EOF 
net.bridge.bridge-nf-call-iptables = 1 
net.ipv4.ip_forward = 1 
net.bridge.bridge-nf-call-ip6tables = 1 
EOF

sudo sysctl --system
```

## Installing Container Runtime - Containerd

Install the containerd package and deps

```bash
sudo apt install containerd apt-transport-https ca-certificates crul gnupg -y
sudo systemctl status containerd
```

create `/etc/containerd` and generate the default configuration

```bash
mkdir /etc/containerd
containerd config default | sudo tee /etc/containerd/config.yaml
```

*Note*: make sure SystemdCgroup is set to `true` in the configuration

## Install k8s

Install k8s repository and packages

```bash
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://
packages.cloud.google.com/apt/doc/apt-key.gpg
sudo apt install 
sudo apt install kubeadm kubectl kubelet
```

### Master Node

Initialize kubeadmin configuration

```bash
kubeadm init \
--control-plane-endpoint={{ ipv4-address }} \
--node-name={{ hostname }} \
--pod-network-cidr={{ pod-suubnet }}
```

Create Kube Config file for youe kubeadmin user and copy the admin configuration to it 

```bash
touch ~/.kube/config
cp /etc/kubernetes/admin.conf ~/.kube/config
```

Configure the overlay network

```bash
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
```

### Worker Node(s)

Print and copy the join command from the master node 

```bash
kubeadm token create --print-join-command
```

Paste in the command to join the node to the cluster

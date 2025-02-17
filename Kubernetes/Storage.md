# Storage in Docker

## Storage Drivers

Common storage drivers are dependant on the os and org. need but include the following.
- AUFS
- ZFS
- BTRFS
- DEVICE MAPPER
- OVERLAY
### File System

Docker stores data on the local file system by creating a folder structure at the parent directory `/var/lib/docker` by default w/ various sub-directories for storing different kinds of data like `aufs`, `containers`, `image`, `volumes`, etc...

### Layered architecture

When docker builds images, it does so in a layered architecture (three tar balls in a trench coat).

![[Pasted image 20250209134042.png]]

## Volume Drivers

Docker uses volumes to add persistent storage to docker containers that will live past the containers life-cycle. 

![[Pasted image 20250209134808.png]]

The default docker volume plugin is called `local`, but depending or the use case and/or platform there are many other options:
- Azure File Storage
- Convoy
- DigitalOcean Block Storage
- Flocker
- gce-docker
- GlusterFS
- VMware vSphere Storage

# Container Storage Interface (CSI)

Similar to the CNI and CRI, The Container Storage Interface as an interface layer that allows multiple container storage solutions to run on kubernetes.

It defines a set of remote procedure calls that is called by the container orchestrator (kubernetes) and must be implemented by the storage drivers.

![[Pasted image 20250209140416.png]]

# Kubernetes Volumes

You can configure Volumes on kubernetes similar to docker in the pod definition file. For Example, mounting container data to a directory on the host

*Example:* Host Path Volume

```yaml
apiVersion: v1
kind: Pod
metadata:
	name: random-number-generator
spec:
	containers:
	- image: alpine
	  name: alpine
	  command: ["/bin/sh","-c"]
	  args: ["shuf i- 0-100 -n 1 >> /opt/number.out;"]
	volumeMounts: # volume in container
	- mountPath: /opt
	  name: data-volume
volumes: # volume on host
- name: data-volume
  hostPath: 
	path: /data
```

This is *not* a good solution for a multi-node cluster since the data is stored on a single node and if and not accessible to instances of the container that are running on other nodes in the cluster.

Kubernetes supports many network file storage solutions for mounting volumes that will be accessible to all instances of a pod in the cluster *which is the preferred method*

*Example:* Aws Elastic Blob Storage

```yaml
...
volumes:
- name: data-volume
  awsElasticBlockStore:
	volumeID: <volume-id>
	fsType: ext4
```

*Note: do not use hostPath in production environment*

## Persistent Volumes

Persistent volumes in kubernetes allows you to centrally manage volumes outside of pod definitions.

A Persistent volume is a cluster wide pool of storage volumes configured by a kubernetes administrator to be used by users deploying applications on the cluster.
type: Directory

Users can select volume pools from this storage using persistent volume claims

*Example:* Persistent Volume

```yaml
apiVersion: v1
kind: PersistentVolume
metadata:
	name: pv-voll
spec:
	accessModes: # define how volume should be mounted on the host
		- ReadWriteOnce # ReadOnlyMany, ReadWriteMany
	capacity: # amount of storage reserved for the volume
		storage: 1Gi
	awsElasticBlockStore:
		volumeID: <volume-id>
		fsType: ext4
```

### Persistent Volume Claims

This is a separate object in the kubernetes namespace that allows applications to request use of the storage in a persistent volume.

Every persistent volume claim is bound to a single persistent volume during the binding process where kuberenetes finds a volume with the available capacity, access modes, volume modes, and storage class as requested by the claim.

*Note: you can use labels to bind to specific volumes as needed*

Persistent Volumes and Claims have a 1-to-1 relationship. Meaning that no other claims can use a volume that is claimed even if has remaining capacity

*Example:* Persistent Volume Claim

```yaml
apiVersion: v1 
kind: PersistentVolumeClaim
metadata:
	name: myclaim
spec:
	accessModes:
		- ReadWriteOnce
	resources:
		requests:
			storage: 500Mi
```

Persistent Volumes are set to `persistentVolumeReclaimPolicy:` *Retain* by default which means if a claim on the volume is removed, it will remain in the cluster until it is manually deleted and is still not eligible for reuse by any other claims. The other configurable options are:
- *Delete:* Delete the volume on claim removal
- *Recycle:* Scrub the data on claim removal and make available to new claims

*Note: if pv is set to `WaitForFirstConsuer` the claim will not bind to the pv until use is requested*
## Storage Class

When creating persistent volumes using a distributed file system (like aws elastic blob storage). You first have to create to disk on the storage device and the create the persistent volume on kubernetes which is *static provisioning*.

A Storage Class allows for the automation of disk creation on the storage device when defining persistent volumes claims which is *dynamic provisioning*.

*Example:* Storage Class Object

```yaml
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
	name: google-storage
provisioner: kubernetes.io/gce-pd
```

*Note: this removes the need to define a persistent volume object since it will be created automatically*

In the persistent volume claim you can specify the storage class name

*Example:* Storage Class Reference in Claim

```yaml
...
spec:
...
	straogeClassName: google-storage
...
```
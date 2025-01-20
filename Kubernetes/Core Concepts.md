
## Cluster Architecture

![[Pasted image 20250119093210.png]]

### Master Node Control Plane Components

- **ETCD**: Key value database in kuberenetes
- **Scheduler**: Identifies the correct node to place a container on
- **Controller Manager**: 
	- **Node Controller**: Handle onboarding new nodes and node health
	- **Replication Controller**: Ensures correct amount of containers are running
- **Api Server**: Responsible for orcestrating all operations in the cluster

### Worker Node Components

- **Kubelet**: Agent running on all nodes that listens for instructions from the api server to deploy/destroy containers on node as well as sending status information
- **Kube-proxy**: Facilitates worker to worker node communication
- **Container Runtime**: Runtime for containers on selected worker nodes

## ETCD 

A key value store used by kubernetes (port 2379 be default). It stores information reguarding the cluster including nodes, pods, configs, secrets, accounts, roles, bingings, and others.

This can be setup:
- manually, by extracting the binaries and running the executable. Which runs etcd as a systemd service `etcd.service`
- with kubeadm, which runs etcd as a pod in the kube-system namespace

### ETCD Commands

ETCDCTL is the CLI tool used to interact with ETCD.ETCDCTL can interact with ETCD Server using 2 API versions – Version 2 and Version 3. By default it’s set to use Version 2. Each version has different sets of commands.

For example, ETCDCTL version 2 supports the following commands:

```
etcdctl backup
etcdctl cluster-health
etcdctl mk
etcdctl mkdir
etcdctl set
```

Whereas the commands are different in version 3

```
etcdctl snapshot save
etcdctl endpoint health
etcdctl get
etcdctl put
```

To set the right version of API set the environment variable ETCDCTL_API command

```
export ETCDCTL_API=3
```

When the API version is not set, it is assumed to be set to version 2. And version 3 commands listed above don’t work. When API version is set to version 3, version 2 commands listed above don’t work.

Apart from that, you must also specify the path to certificate files so that ETCDCTL can authenticate to the ETCD API Server. The certificate files are available in the etcd-master at the following path. We discuss more about certificates in the security section of this course. So don’t worry if this looks complex:

```
--cacert /etc/kubernetes/pki/etcd/ca.crt
--cert /etc/kubernetes/pki/etcd/server.crt
--key /etc/kubernetes/pki/etcd/server.key
```

So for the commands, I showed in the previous video to work you must specify the ETCDCTL API version and path to certificate files. Below is the final form:

```
kubectl exec etcd-controlplane -n kube-system -- sh -c "ETCDCTL_API=3 etcdctl get / \
  --prefix --keys-only --limit=10 / \
  --cacert /etc/kubernetes/pki/etcd/ca.crt \
  --cert /etc/kubernetes/pki/etcd/server.crt \
  --key /etc/kubernetes/pki/etcd/server.key"
```

## Kube Api Server

Responsible for authenticating users, validating request, retrieving data, and updating etcd. Other services like the Scheduler and kubelet use the api to preform updates in the cluster

This Api Server can be run similarly to etcd, either as a systemd service `kube-apiserver.service` or as a pod with kubeadm 

You can also enable a swagger ui

## Kube Controller Manager

### Node Controller

The node controller monitors the status of the worker nodes through the kube-apiserver:
- default interval of 5s to monitor the health of the nodes.
- After 40s if a node is not responding it is marked as unreachable
- 5m eviction Timeout. If it does not come back up it removes the pods on the node and provisions them to a healthy node

### Replication Controller

Monitors the status of replicaset's so the desired number of pods are available at all times within the set. if a pod dies it creates a new pod.

Again can be installed as a systemd service `kube-controller-manager.service` or pod with kubeadm

## Kube Scheduler

This is responsible for scheduling pods on nodes. It doesn't place the pod on the node (that is the kubelets job) but decides which pod goes to which node

How it selects nodes:

- Filters nodes based on pod system requirements
- Ranks nodes with a priority function to rate nodes from 0-10

## Kubelet

Agents running on worker nodes and kube-scheduler node that place pods and send monitoring information at regular intervals.

What does it do:
- Registers the node with the master node(s)
- Creates PODs
- Monitors Node and its PODs

**Note**: kubeadm does not deploy kubelets. you must manually install kubelets on your worker nodes

## Kube Proxy

- **Pod Network**: Internal network that spans all nodes in a cluster to which all pods can connect to

Kube Proxy is a process that runs on each node in the cluster. It looks for new services in a cluster and creates rulesets to forward traffic to those new services to the backend pods using ip table rules
## Pods

![[Pasted image 20250119104622.png]]

A pod is a single instance of an application and the smallest object you can create in kubernetes.

### Multi Container PODs

A single pod can contain multiple containers but they are not the same container (having a replica of the same container requires a new pod)
### Pods with yaml

in kubernetes pods are defined with yaml configuration files

Pods require the following root level properties to be defined:

```yaml
apiVersion: v1 # version of kube-api used to create the object
# pods/service use v1 replicaset/deployments use apps/v1
kind: Pod # type of object you are creating
metadata: # data about the object the is a valid key in metadata
	name: mypod
	labels: # dynamic key value pairs (any you want to define)
		app: myapp
spec: # provide additional information for object
	containers: # container list
		- name: nginx-container
		  image: nginx
```

#### Commands

You can create pods from yaml with the following example

```bash
kubectl create -f <file>.yml
```

Get pod information

```bash
kubectl describe pod <pod name>
```

## ReplicaSets

Creating replications of pods allows for high availablity in the form of application up time and load balancing. You can define a replica set in a cluster to handle the availablity of an application under load

*Example:*

```yaml
apiVersion: apps/v1
kind: ReplicaSet
metadata:
	name: myapp-replicaset
	labels: 
		app: myapp
		type: front-end
spec:
	template: # provides pod template to be used to create replicas
		metadata:
			name: myapp-pod
			labels:
				apps: myapp
				type: front-end
		spec:
			containers:
			- name: nginx-container
			  image: nginx
	replicas: 3 # number of replicas to create
	selector: # helps identify what pods fall under replica set
	# needed because replica sets can also manage pods that
	# where not created as part of the replicaset creation
		matchLabels:
			type: front-end
```

#### Labels and Selectors

Labeling can act as a filter to instantiate a replicaset on a given amount of pods that share that label using a selector

#### Scaling ReplicaSet

- Updating the number of replicas in the yaml configuration and run `kubectl replace -f <file>.yml`
- Running the scale command `kubectl scale --replicas=6 -f <file>.yml` or `kubectl scale --replicas=6 replicaset <name>`
	- this will not update the file

## Deployments

![[Pasted image 20250120071344.png]]

Deployments enable you to implement rolling updates, undo changes, and pause or resume changes as required to applications in a cluster

*Example:*

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
	name: myapp-deployment
	type: front-end
spec:
	template:
		metadata:
			name: myapp-pod
			labels:
				apps: myapp
				type: front-end
		spec:
			containers:
			- name: nginx-container
			  image: nginx
	replicas: 3
	selector:
		matchLabels:
			type: front-end
	
```

```bash
kubectl create deployment --image nginx nginx --dry-run -o yaml >> deploy.yml
```
## Services

![[Pasted image 20250120073555.png]]

Services help connect applications with other applications or users

Services are objects in kubernetes that have multiple use cases:

- **NodePortService**: listen to a port on a node then forward the traffic to the port on the pod running the webapp
- **ClusterIPService**: creates a virtual ip inside the cluster to enable communication between different services
- **LoadBalancerService**: Provisions a load balancer for a given application

### NodePort

![[Pasted image 20250120073831.png]]

*Example:*

```yaml
apiVersion: v1
kind: Service
metadata:
	name: myapp-service
spec:
	type: NodePort
	ports:
		- targetPort: 80
		  port: 80 # only manditory field
		  nodePort: 30008 # range 30000-32767
	selector: # add labels defined in pod definition to map service to pods
		app: myapp
		type: front-end
```

![[Pasted image 20250120074543.png]]

### Cluster IP

![[Pasted image 20250120075823.png]]

*Examples:*

```yaml
apiVersion: v1
kind: Service
metadata:
	name: back-end
spec:
	type: ClusterIP
	ports:
		- targetPort: 80 # port where the backend is exposed
		  port: 80 # port where the service is exposed
	selector: # pod labels to map to service
		app: myapp
		type: back-end
```

### Load Balancer

![[Pasted image 20250120080533.png]]

*Example:*

***Note: this configuration only works with supported cloud platforms***

```yaml
apiVersion: v1
kind: Service
metadata:
	name: myapp-service
spec:
	type: LoadBalancer # if not on supported cloud platform acts as NodePort
	ports:
	 - targetPort: 80
	   port: 80
	   nodePort: 30008
```

## NameSpaces

Namespaces are used to group application groups together which helps organize each namespaces resources and facilitate communication (applications can communicate with applications in other namespaces by using their internal fqdn `*.cluster.local`)

![[Pasted image 20250120082222.png]]

You can specify a namespace for an application to go in

```yaml
apiVersion: v1
...
metadata:
	...
	namespace: dev
	...
```

You create new namespaces as objects

```yaml
apiVersion: v1
kind: Namespace
metadata:
	name: dev
```

You can set the default namespace to get object from using `kubectl get` with the following

```bash
kubectl config set-context $(kubectl config current-context) --namespace=<name>
```

### Resource Quota

A resource quota is an object that limits resources for a given namespace

```yaml
apiVersion: v1
kind: ResourceQuota
metadata:
	name: compute-quota
	namespace: dev
spec: # namespace limits
	hard:
		pods: "10"
		requests.cpu: "4"
		requests.memory: 5Gi
		limits.cpu: "10"
		limits.memory: 10Gi
```

## Imperative vs Declarative

![[Pasted image 20250120084439.png]]

![[Pasted image 20250120084820.png]]

## Kubectl Apply

With kubectl apply when removing an attribute in the local file if the attribute is instantiated in the live object it will remain in the live object

![[Pasted image 20250120100243.png]]

![[Pasted image 20250120100449.png]]

## How Scheduling Works

Every pod has a spec field called `nodeName` that is not set by default. Kubernetes will add it automatically when the scheduler goes through the pods looking for those that do not have the property set. They and then scheduled via a random algorithm
## Manual Scheduling

For *New pods*, you can manual schedule a pod by defining the `nodeName` field in you configuration

```yaml
apiVersion: v1
kind: Pod
metadata:
	name: nginx
	labels:
		name: nginx
spec:
	containers:
	- name: nginx
	  image: nginx
	  ports:
	    - containerPort: 8080
	nodeName: node02
```

For *Existing pods*, you can create a binding object

```yaml
apiVersion: v1
kind: Binding
metadata:
	name: nginx
target:
	apiVersion: v1
	kind: Node
	name: node02
```

or use `kubectl replace --force -f <file>.yaml` on the pod yaml file after modifying (this will delete the existing pod)

## Labels and Selectors

Labels are methods to group things together in kubernetes while selectors filter items by labels for a given functionality

![[Pasted image 20250120175453.png]]

For example you can get pods w/ specific labels

```bash
kubectl get pods -l env=dev
```
### Annotations

Used to record other details for information purposes

```yaml
apiVersion: apps/v1
kind: ReplicaSet
metadata:
	name: simple-webapp
	labels:
		app: app1
		function: front-end
	annotations:
		buildversion: 1.34
```

## Taints and Toleration

Taints and Tolerations are used as restrictions on what pods can be scheduled on a node

- **Taints**: Restriction set on a node

```bash
kubectl taint nodes <name> key=value:<taint-effect>
```

Their are 3 taint effects:
	- *NoSchedule*: pods will not be scheduled on the node
	- *PreferNoSchedule*: avoid placing pod on the node
	- *NoExecute*: New pods wont be schedule *and* existing pods will be evicted

- **Toleration**: Tolerance of restrictions set on a node on a pod

if
```bash
kubectl taint nodes node1 app=blue:NoSchedule
```
then
```yaml
apiVersion: v1
kind: Pod
metadata:
	name: myapp-pod
spec:
	containers:
	- name: nginx-container
	  image: nginx
	tolerations: # all values need to be in double quotes
	- key: "app"
	  operator: "Equal"
	  value: "blue"
	  effect: "NoSchedule"
```

## Node Selectors

![[Pasted image 20250120184607.png]]

Node selectors are key value pair added to nodes. In Pod Definitions, you can choose a `nodeSelector` to specify that the pod should only by deployed on nodes with the specified selector.

You can add a node selector to a node using:

```bash
kubectl label nodes <node> <key>=<value>
```

## Node Affinity

Give the same functionality as `nodeSelector` w/ addition features to limit pod placement on specific nodes. 

Example: (Equivalent to nodeSelector Example)

```yaml
appVersion: v1
kind: Pod
metadata:
	name: myapp-pod
spec:
	containers:
	- name: data-processor
	  image: data-processor
	affinity:
		nodeAffinity:
			requiredDuringSchedulingIgnoreDuringExecution:
				nodeSelectorTerms:
				- matchExpressions:
					- key: size
					  operator: In
					  values:
					  - Large
```

### Node Affinity Types

There are two states for node affinity *DuringScheduling* and *DuringExecution* 

Available:
- `requiredDuringSchedulingIgnoredDuringExecution`: label is required on node during scheduling
- `preferredDuringSchedulingIgnoredDuringExecution`: label is preferred but can be ignored if none are found

Planned:
- `requiredDuringSchedulingRequiredDuringExecution`: label is required on node during scheduling and execution of the pod
- `preferredDuringSchedulingRequiredDuringExecution`: label is preferred when scheduling a pod but is required during execution of the pod

## Resource Limits

- *Response Request*: the minimum amount of resources requested by a container

```yaml
apiVersion: v1
kind: Pod
metadata:
	name: simple-webapp-color
	labels:
		name: simple-webapp-color
spec: 
	containers:
	- name: simple-wbapp-color
	  image: simple-webapp-color
	  ports:
		  - containerPort: 8080
	  resources:
		  requests: # minimum system requirement
			  memory: "4Gi" # 4 gibibytes
			  cpu: 2 # 2 vcpus or 1 hyperthread
		  limits: # maximum system requirements
			  memory: "5Gi"
			  cpu: 4
		  
```

Containers cannot use more cpu than its limit is set to (the cpu will throttle to prevent this), but it can use more memory. *If the pod constantly uses more memory than its limit it will terminate with error OOM (Out Of Memory)*

#### Default Behavior

Any pod can consume as much resource as required on any node and suffocate other pods or processes

##### CPU

![[Pasted image 20250121201803.png]]
##### Memory

![[Pasted image 20250121201929.png]]

### LimitRange

Define default values to be set for containers that are created without a request or limit defined in the pod definition.

*Note: Only effects pods on creation not existing pods*

```yaml
apiVersion: v1
kind: LimitRange
metadata:
	name: cpu-resource-contraint
spec:
	limits:
	- default: # default limit
	    cpu: 500m
	  defaultRequest: # default request
		cpu: 500m
	  max: # max limit that can be set
		cpu: "1"
	  min: # minimum request that can be set
	    cpu: 100m
	  type: Container
	- default: # default limit
	    memory: 1Gi
	  defaultRequest: # default request
		memory: 1Gi
	  max: # max limit that can be set
		memory: 1Gi
	  min: # minimum request that can be set
	    memory: 500Mi
	  type: Container
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
## DaemonSets


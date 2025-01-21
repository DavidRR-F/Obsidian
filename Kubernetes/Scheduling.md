
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
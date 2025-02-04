
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

Daemon Sets are like Replica sets in that they help deploy multiple instances of pods, but unlike replicasets, daemonsets runs a single instance of a pod on each node in a cluster. Whenever a new node is added to the cluster, a replica of all daemon sets is added to it automatically.

![[Pasted image 20250203194941.png]]

Daemon Sets are good for use cases such as monitoring and log viewers.

*Example*

```yaml
apiVersion: apps/v1
kind: DaemonSet
metadata: 
	name: monitoring-daemon
spec:
	selector:
		matchLabels:
			app: monitoring-agent
	template:
		metadataa:
			labels:
				app: montoring-agent
		spec:
			containers:
			- name: monitoring-agent
			  image: monitoring-agent:latest
```

### How does it work

Daemonsets (since v1.12) use the default scheduler and NodeAffinity rules to schedule a pod on each node.

## Static Pods

The `kubelet` can manage a node independently without a `kube-api-server` by configuring the `kubelet` to read pod definition files from a directory on the nodes server designated to store information about pods *Example:* `/etc/kubernetes/manifests`.

The `kubelet` will periodically check the directory for files to read and create pods on the host and can ensure the pod stays alive removing pods and adding changes as part of the periodic checking.

*Note: You can only create pods this way*

You can configure the designated directory path by defining the `--pod-manifest-path` option in the `kubelet.service` on the nodes host machine or provide a path to another config file `--config=kubeconfig.yaml` in the `kubelet.service` and define the `staticPodPath: <dir>`

### Use Cases
Since static pods are defined in a static directory on a node if their where to be a crash then on restart of the node the static pods would be immediately re-created.

![[Pasted image 20250203203452.png]]

*Note: This is how the kubeadmin tool sets up a cluster*

*Note: Static Pods have a suffix of the node they are deployed on*
## Multiple Schedulers

You can define additional schedulers for specific applications that require more than the default scheduler provides.

When creating a pod/deployment you can specify in the configuration that it uses a specific scheduler

*Example*

```yaml
...
spec:
...
	schedulerName: my-scheduler
...
```

#### Defining Additional Schedulers

Each scheduler uses a different configuration file. You can deploy an additional scheduler by defining a new scheduler service with its specific configuration file

*Example*

```bash
# my-scheduler.service
ExecStart=/usr/local/bin/kube-scheduler \\
  --config=/etc/kubernetes/config/my-scheduler-config.yaml
```

*Note: best practice is to deploy scheduler as a pod*
#### Deploy Additional Scheduler as a Pod

*Example*

```yaml
apiVersion: v1
kind: Pod
metadata:
	name: my-scheduler
	namespace: kube-system
spec:
	containers:
	- command:
	  - kube-scheduler
	  - --address=127.0.0.1
	  - --kubeconfig=/etc/kubernetes/scheduler.conf
	  - --config=/etc/kubernetes/my-scheduler-config.yaml
	image: k8s.gcr.io/kube-scheduler-amd64:v1.11.3
	name: kube-scheduler
```

`my-scheduler-config.yaml`

```yaml
apiVersion: kubescheduler.config.k8s.io/v1
kind KubeSchedulerConfiguration
profiles:
- schedulerName: my-scheduler
leaderElection: # used when running scheduler on multiple master nodes 
# only one instance runs at a time
	leaderElect: true
	resourceNamespace: kube-system
	resourceName: lock-obkect-my-scheduler
```

*Note: you can view scheduler events to see what scheduler picked up a pod/deployment with `kubectl get events -o wide`*

### Configuring Scheduler Profiles

#### Scheduling Phases

![[Pasted image 20250203214413.png]]

1. **Scheduling Queue:** Pods waiting on being scheduled are placed in a queue they are placed in the queue based on the priority defined on the pod

```yaml
# Priority Class Object
apiVersion: scheduling.k8s.io/v1
metadata:
	name: high-priority
value: 1000000
globalDefault: false
description: "This priority class should be used for XYZ service pods only."
```

```yaml
...
spec:
	priorityClassName: high-priority
...
```

2. **Filter:** Nodes that can't run the pod are filtered out. For Example filtering based on the pods resource limits
3. **Scoring:** Nodes are scored w/ different weights. (uses factors such as total available resources etc..)
4. **Binding:** The pod is bound to the node w/ the highest score

#### Extension Points

![[Pasted image 20250203214734.png]]

At each phase of the scheduling process there is an extension point which a plugin can be added to.

#### Scheduler Profiles

Running multiple schedulers can lead to computational overhead as well as race conditions. To Combat the k8s provides *Scheduler Profiles* (v1.18). This allows you to configure multiple profiles within the same scheduler by adding more entries to the list of profiles

*Example*

```yaml
apiVersion: kubescheduler.config.k8s.io/v1
kind: KubeSchedulerConfiguration
profiles:
- schedulerName: my-scheduler-1
- schedulerName: my-scheduler-2
```

This allows multiple schedulers to be run in the same binary as apposed to separate binaries for each scheduler

##### Configuring Scheduler Profiles

Under each scheduler profile you can configure plugins for the desired affect

*Example*

```yaml
apiVersion: kubescheduler.config.k8s.io/v1
kind: KubeSchedulerConfiguration
profiles:
- schedulerName: my-scheduler-1
  plugins:
	score:
		disabled:
		- name: TaintToleration
		enabled:
		- name: MyCustomPlugin1
		- name: MyCustomPlugin2
- schedulerName: my-scheduler-2
  plugins:
	preScore:
		disabled:
		- name: '*' # all
	score:
		disabled:
		- name: '*'
```

## Admissions Controllers
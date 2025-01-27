# Prerequisites

## Network Namespaces

Network Namespaces are specific networks that are separated fromthe hosts network. While the host has visibility into all network namespaces running on it, the processes (such as containers) are isolated to only its network namespace

![[Pasted image 20250125093948.png]]

create network namespace on linux

```bash
ip netns <name>
```

### Connecting Network Namespaces

#### Manual Connection

You can create a virtual eth (pipe) for 2 network namespaces, specify their connection and assign them to a namespace

![[Pasted image 20250125095049.png]]

*Example:*

```bash
# create veth connetions
ip link add veth-<name> type veth peer name veth-<name>
# attach veths
ip link set veth-<name> netns <name>
# assign ips
ip -n <name> addr add 192.168.1.1 dev veth-<name>
# initialize links
ip -n <name> link set veth-<name> up
```

#### Virtual Switch

You can create a virtual switch on the host and add network namespaces to the virtual network to facilitate cross namespace communication

![[Pasted image 20250125095843.png]]

*Example:* (Linux Bridge)

```bash
# create v switch
ip link add <bname> type bridge
# set up
ip link set dev <bname> up
# add network namespace
ip link add veth-<name> type veth peer name veth-<name>-br
ip link set veth-<name> netns <name>
ip link set veth-<name>-br master <bname>
# assign ip addresses as before
# you can assess this network from the host by assigning an host ip address to the vswtich
ip addr add 192.168.15.5/24 dev <bname>
```

##### Namespace Upstream Traffic

Since each namespace contains it own routing table. By default, it will not have a gateway to the hosts lan or internet.

We can confiure external traffic routing by assigning a route to the vswitches host ip address to reach the host lan network

```bash
# this assumes nat is enabled for 192.168.15.0/24
# iptables -t nat -A POSTROUTING -s 192.168.15.0/24 -j MASQUERADE 
ip route add 192.168.1.0/24 via 192.168.15.5
```

Once that is configured, we can also add a default gateway in the virtual network the points to the host to route to the internet

```bash
# from in a namespace
ip route add default via 192.168.15.5
```

##### Namespace Downstream Traffic

To make the virtual network available to external traffic (i.e. assessing an application in the v network) you configure port forwarding rules to forward traffic on a given port to that port in the network namespace

*Example:*

```bash
iptables -t nat -A PREROUTING --dport 80 --to-destination 192.168.15.2:80 -j DNAT
```
## Docker Networking

![[Pasted image 20250125103251.png]]

### Bridge Network

Docker uses network namespaces and virtual switching for the creation and isolation of containers:
- Docker creates a virtual network bridge (docker0)
- When containers are created they are given their own network namespace and connected to the bridge network

![[Pasted image 20250125102217.png]]

## CNI (Container Networking Interface)

CNI is a standardiztion in container orcestration tools for implementing network namespace networking

![[Pasted image 20250125103424.png]]

### CNI Rules

- Container Runtime must create network namespace
- Identify network the container must attach to
- Container Runtime to invoke Network Plugin (bridge) when container is *added*
- Container Runtime to invoke Network Plugin (bridge) when container is *deleted*
- JSON format of the network configuration
- Must spport command line arguments add/del/check
- must support parametes container id, network ns etc..
- must manage ip address assignment to PODs
- must return results in a specific format

# Cluster Networking

## IP & FQDN
![[Pasted image 20250125104639.png]]
- each node must have at least one interface connected to a network
- each interface must have an ip address configured
- the host must have a unique name and mac address

## Ports
![[Pasted image 20250125104752.png]]

# POD Networking

![[Pasted image 20250125152433.png]]

The pods on each node follow the CNI model were, by default, the node creates a virtual (bridge) network. Each pod has their own network namespace which is attached to the virtual network

*Note: all containers in a pod have the same network namespace*

*Note: each virtual network on each pod will define its own subnet*

![[Pasted image 20250125154235.png]]

Kubernetes does not implement cni scripting to configure pod networking by default. Instead it relies on cni plugins like *calico*, *flannel*, *weave*, *cilium*, *kube-router*, or a custom script stored in the `/etc/cni/net.d/net-script.conflist

![[Pasted image 20250125160731.png]]

Theses script follow the cni standardization for defining container runtime networks where a container is created:
- **Add**
	- Create veth pair
	- Attach veth pair
	- Assign IP Address
	- Bring Up Interface
- **Delete**
	- Delete veth pair
# CNI in Kubernetes

CNI Plugins are invoked by the container runtime (in this case containerd). The cni plugins are stored in the `/opt/cni/bin` directory, but which plugin to use and its configuration is stored in the `/etc/cni/net.d/*.conflist` (if there are multiple files it will choose in alphabetical order)

![[Pasted image 20250125161328.png]]

*Example*

```json
// 10-bridge.conf
{
	"cniVersion": "0.2.0",
	"name": "mynet",
	"type": "bridge",
	"bridge": "cni0",
	"isGateway": true, // provide gateway ip for subnet
	"ipMasq": true, // packets leaving are rewritten with bridges's ip (nat)
	"ipam": { // how ip addresses are assinged to containers
		"type": "host-local",
		"subnet": "10.22.0.0/16",
		"routes": [
			{ "dst": "0.0.0.0/0" }
		]	
	}
}
```
``
## CNI Plugin Weave Example

![[Pasted image 20250125163217.png]]

The CNI Plugin deploys and agent on each node. These agents communicate with each other to exchange information about the nodes, networks, and pods on them. with each agent storing the topology of the entire cluster. It creates its own bridge network on the nodes (weave) then assigns ip addresses to each network.

*Note: pods in the same nodes will use the cni bridge network to communicate*
### Deploying CNI Plugin

CNI Plugins can be deployed on kubernetes as services/daemonsets either manually or with a single apply common given kubernetes is already configured

```bash
kubectl apply -f https://github.com/weaveworks/weave/releases/download/v2.8.1/weave-daemonset-k8s.yaml
```

### Kubernetes Networking Table

| **Scenario**               | **Communication Method**                                                                                 | **CNI Involvement**               |
| -------------------------- | -------------------------------------------------------------------------------------------------------- | --------------------------------- |
| Containers in the same pod | localhost (shared network namespace)                                                                     | no                                |
| pods on the same node      | CNI bridge                                                                                               | yes (local routing though bridge) |
| pods on different nodes    | CNI Plugin's inter-node routing (overlay network or border gateway protocol depending on the cni plugin) | yes (routing between nodes)       |

### Ipam (ip address managment) CNI Plugin

Based on CNI standards it is the responsibility of the network solution provider to manage ip address assignments to PODs

CNI comes with 2 built-in plugins to handle ip address management
- **DHCP**: manages ips across cluster
- **host-local**: manages ips locally on each host 

# Service Networking

## Services
Services are virtual objects that apply networking logic across the cluster.

### How they work
When a service is created it is assigned an ip address from a pre-defined range. The *kube-proxy* guesses that ip and creates forwarding rules on each node on the cluster saying that any traffic of that ip should go to the traffic of the pod.

#### How are these rules created
These rules can be created multiple ways by defined proxy types:
- *userspace*: listens on a port for each service and proxies the connection to the pod
- *ipvs*: create ipvs rules (linux kernel deature that proovides load balancing for tcp and udp)
- *iptables* (default): to create packet filters or *nat* configurations

*Note: find the proxy type by inspecting the kube-proxy logs*

```bash
# to find proxy type
kubectl logs <kube-proxy-pod-name> -n kube-system
```
### IpTables in Kubernetes
When a service is created kubernetes assigns an ip to it specified in the *kube-api-server's cluster-ip-range* (Default 10.0.0.0/24) 

```bash
kubectl cluster-info dump | grep -i cluster-ip-range
# cluster-service-ip-range for services
or in
/etc/kubernetes/manifests/kube-apiserver.yaml
```

The service by default uses iptables to create nat rules for the intended functionality

*Note: these rules will have a commit with the service name for easy lookup*

```bash
iptables -L -t nat | grep -i <service-name>
```

*Note: these entries can be found in the kube-proxy logs* `/var/log/kube-proxy.log`
### Service Types

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

# DNS in Kubernetes

Kubernetes deploys a built-in dns server in the cluster by default for internal dns resolution `pod-to-pod` or `pod-to-service` etc..

![[Pasted image 20250126095730.png]]

When ever a service is created, *kube-dns* creates a record for the created service by mapping the service name to the ip address of the service. this allows services to be reached using their name. 

For communication between namespaces, the *kube-dns* creates a subdomain for each namespace by its name. You append the namespace to the end of the record for communication with services outside of the namespace

### DNS Resolution for services

All of the services are then grouped together within another subdomain `svc`

All services and pods are grouped together into a root domain for the cluster `cluster.local` (this is the fqdn for the service)

![[Pasted image 20250126101257.png]]

### DNS Resolution for pods

for each pods kubernetes creates a name by replacing `.` w/ `-` in the ip address. The namespace remains the same and the type subdomain is set to `pod` instead of `svc` w/ the same root domain

*Note: this is disabled by default*

*Example*

```bash
curl https://10-244-2-5.apps.pod.cluster.local
```

## CoreDNS in Kubernetes

With kubernetes 1.12^ the recommended dns server in kubernetes is CoreDNS. 

CoreDNS is deployed as 2 pods (deployment for redundancy) in the kube-system namespace in the cluster.

CoreDNS requires a configuration file `/etc/coredns/Corefile` the defines a number of plugin configurations

```json
.:53 {
	errors
	health
	kubernetes cluster.local in-addr.arpa ip6.arpa {
		pods insecure // creates record for pod
		upstream
		fallthrough in-addr.arpa ip6.arpa
	}
	prometheus :9153
	proxy . /etc/resolv.conf // set to use nameserver form kube node
	cache 30
	reload
}
```

*Note: this file is passed in as a configmap object in kubernetes*

CoreDNS also creates a clusterip service `kube-dns` to make it available to other pods in the cluster

The ip address for this service is configured as the nameserver on pods (this is an automated process performed by the kubelet). the pods resolv.conf will also have a search entries for services which allows you to resolve services without the fqdn (this will not be the case for other pods)

```conf
nameserver 10.96.0.10
search default.svc.cluster.local svc.cluster.local cluster.local
```

# Ingress

Allows users to access applications on the kubernetes cluster using a single externally accessible url that you can configure to route to different services within the cluster based on the url path while also implementing ssl/tls security.

![[Pasted image 20250126130008.png]]

Ingress allows you to define all of the loadbalancing, authentication, ssl, and url based routing configurations within the cluster itself rather than externally though a series of load balancers and proxies

## How it works

Ingress is implemented in kubernetes by defining the deploymentment solution like nginx, traefik, etc.. Then specify a set of rules to configure the ingress

## Ingress Controller

Kubernetes does not come with an ingress controller by default. You have to select a loadbalancer/reverse proxy solution and deploy it to your cluster.

*Example*

Deployment: Deploys ingress controller

```yaml 
apiVersion: apps/v1
kind: Deployment
metadata:
	name: nginx-ingress-controller
spec:
	replicas: 1
	selector:
		matchLabels:
			name: nginx-ingress-controller
	template:
		metadata:
			labels:
				name: nginx-ingress
		spec:
			containers:
				- name: nginx-ingress-controller
				  image: quay.io/kubernetes-ingress-controller/nginx-ingress-controller:0.21.0
			args:
				# command to start controller
				- /nginx-ingress-controller
				# configmap path (must create configmap object)
				- --configmap=$(POD_NAMESPACE)/nginx-configuration
			env: # required envs
				- name: POD_NAME
				  valueFrom:
					fieldRef:
						fieldPath: metadata.name
			   - name: POD_NAMESPACE
				  valueFrom:
					fieldRef:
						fieldPath: metadata.namespace
			ports:
				- name: http
				  containerPort: 80
				- name: https
				  containerPort: 443
				
```

ConfigMap: Stores nginx configurations

```bash
apiVersion: v1
kind: ConfigMap
metadata:
	name: nginx-configuration
```

Service: exposes ingress to external port

```yaml
apiVersion: v1
kind: Service
metadata:
	name: nginx-ingress
spec:
	type: NodePort
	ports: 
	- port: 80
	  targetPort: 80
	  protocol: TCP
	  name: http
	- port: 443
	  targetPort: 443
	  protocol: TCP
	  name: https
	selector:
		name: nginx-ingress
```

ServiceAccount: gives permissions for monitoring and configuration (roles clusterroles and rolebindings)

```yaml
apiVersion: v1
kind: ServiceAccount
metadata:
	name: nginx-ingress-service-account
```

*Note: there are special images for ingress controllers as they have additional functionalities builtin specifically to be used as ingress  controllers in kubernetes*

## Ingress Resource

Ingress resources is a set of rules and configurations applied on the ingress controller such as routing traffic by domain or ur

Resources are created with a kubernetes definition resource file

*Example*

Route all traffic to wear-service

```yaml
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
	name: ingress-wear
spec:
	backend: # defines where traffic is routed to
		serviceName: wear-service
		servicePort: 80
```

### Rules

![[Pasted image 20250126133709.png]]

You can define rules in the ingress resource when you want to route traffic based on different conditions such as domain and url resolution

*Example*

Route route traffic based on url path

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
	name: ingress-wear-watch
spec:
	rules:
	- http:
		paths:
		- path: /wear
		  backend:
			  service:
				  name: wear-service
				  port: 80
		- path: /watch
		  backend:
			  service:
				  name: watch-service
				  port: 80
```

Route traffic based on domain name

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
	name: ingress-wear-watch
spec:
	rules:
	- host: web-service-1.com
	  http:
		paths:
		- backend:
			  service:
				  name: wear-service
				  port: 80
	- host: web-service-2.com
	  http:
		paths:
		- backend:
			  service:
				  name: returns-service
				  port: 80
```

Now, in k8s version **1.20+,** we can create an Ingress resource in the imperative way like this:-

```
Format - kubectl create ingress  --rule="host/path=service:port"**
```

Example -

```
kubectl create ingress ingress-test --rule="wear.my-online-store.com/wear*=wear-service:80"**
```

## Annotations and Rewrite-Target

Different ingress controllers have different options that can be used to customise the way it works. NGINX Ingress controller has many options that can be seen here. I would like to explain one such option that we will use in our labs. The Rewrite target option.

Our watch app displays the video streaming webpage at

```
 http://:/
```

Our wear app displays the apparel webpage at

```
http://:/
```

We must configure Ingress to achieve the below. When user visits the URL on the left, his/her request should be forwarded internally to the URL on the right. Note that the /watch and /wear URL path are what we configure on the ingress controller so we can forward users to the appropriate application in the backend. The applications don’t have this URL/Path configured on them:

```
http://:/watch –> http://:/

http://:/wear –> http://:/
```

Without the rewrite-target option, this is what would happen:

```

http://:/watch –> http://:/watch

http://:/wear –> http://:/wear
```

Notice watch and wear at the end of the target URLs. The target applications are not configured with /watch or /wear paths. They are different applications built specifically for their purpose, so they don’t expect /watch or /wear in the URLs. And as such the requests would fail and throw a 404 not found error.

To fix that we want to “ReWrite” the URL when the request is passed on to the watch or wear applications. We don’t want to pass in the same path that user typed in. So we specify the rewrite-target option. This rewrites the URL by replacing whatever is under rules->http->paths->path which happens to be /pay in this case with the value in rewrite-target. This works just like a search and replace function.

For example: replace(path, rewrite-target)

In our case: replace("/path","/")

```


apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: test-ingress
  namespace: critical-space
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /
spec:
  rules:
  - http:
      paths:
      - path: /pay
        backend:
          serviceName: pay-service
          servicePort: 8282
 

```

In another example given here, this could also be:

replace("/something(/|$)(.*)", "/$2")

```

apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /$2
  name: rewrite
  namespace: default
spec:
  rules:
  - host: rewrite.bar.com
    http:
      paths:
      - backend:
          serviceName: http-svc
          servicePort: 80
        path: /something(/|$)(.*)
```
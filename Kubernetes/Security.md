# RBAC Role Policies

RBAC controls when deploying to kubernetes

![[Pasted image 20250204191806.png]]

With kubectl the `.kube/config` file has a certificate to authenticate a user to the cluster. This information can be used to restrict the users access to the cluster with the information from the certificate acting as an pid

![[Pasted image 20250204192258.png]]

# Admission Controllers

Admission Controllers implement security measueres to increase the security posture of pods being deployed. For example, Not allowing public images, Not allowing containers to run as root, requiring labeling, etc..

*Examples:* Prebuilt Admission Controllers

- *AlwaysPullImages*: Every time a pod is created the images are always pulled
- *DefaultStorageClass*: Observes creation of persistent volume configurations and adds the default storage class to them if one is not specified
- *EventRateLimit*: Sets limit on kube-apiserver requests
- *NamespaceExists*: Rejects requests to namespaces that dont exist

*Note: kube-apiserver -h | grep enable-admission-plugins will get the enabled admission controllers*

## Enable Admission Controllers

You can add Admission Controller names to the `kube-apiserver.service` or the kube-apiserver's config yaml file depending on your setup

*Examples*

![[Pasted image 20250204193707.png]]

# Security Primitives

Securing kubernetes starts with requiring authentication to interact with the *kube-apiserver* to enforce who can access the cluster and what can they do

### Who can access
This is defined by the *authentication* mechanisms such as
- Files - Username and Password
- Files - Username and Tokens
- Certificates
- External Auth Providers - LDAP etc..
- Service Accounts

### What can they do
This is defined by the *authorization* mechanisms such as
- RBAC Authorization
- ABAC Authorization
- Node Authorization
- Webhook Mode

## TLS Certificates

All communications between the *kuber-apiserver* and other native kube-system service like `etcd`, `kubelet`, `kube-controller-manager`, `kube-scheduler`, and the `kube-proxy`are secured using tls encryption

## Network Policies

By default all pods can access all other pods in the cluster. This access can be restricted by defining network policies

# Authentication

## Accounts

Their are two kinds of use account the have access to kubernetes internal feature the *users* (administrators and developers) and *bots* (service accounts)

Kubernetes does not naively support the creation of users. This requires a third party authentication service to manage these users. On the other hand kubernetes does provide native support for creating service accounts

## TLS Encryption



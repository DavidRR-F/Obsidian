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
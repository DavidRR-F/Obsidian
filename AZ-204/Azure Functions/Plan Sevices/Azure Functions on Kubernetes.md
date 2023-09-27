You can deploy any azure function app to a kubernetes cluster running KEDA (Kubernetes Event-Driven Autoscaling)

```
func kubernetes deploy \
--name <name-of-function-deployment> \
--registry <container-registry-username>
```

- Kubernetes-based Functions provides the Functions runtime in a Docker container with event-driven scaling through KEDA
- KEDA can scale in to 0 instances and out to n instances
- it does this by exposing custom metrics ffor the Kubernetes autoscaler
- Using Functions contianers with KEDA makes it possible to replicate serversless function capability in any Kubernetes cluster
- These functions can also be deployed using Azure Kubernetes Services virtual nodes feature for serverless infastructure

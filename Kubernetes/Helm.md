Helm charts are yaml configuration repositories that manage the configuration of services for popular application configurations to deploy to kubernetes

## Helm Key Components

```sh
my-nginx-chart/
├── Chart.yaml
├── values.yaml
├── templates/
│   ├── deployment.yaml
│   └── service.yaml
```

### Helm Chart

A bundle of yaml files necessary to create a kubernetes application

```yaml
apiVersion: v2
name: my-nginx-chart
description: A Helm chart for deploying NGINX
version: 1.0.0
appVersion: "1.19.10"
```
### Config Values

Dynamic Configuration you can provide to customize the deployment of the helm chart

```yaml
replicaCount: 2

image:
  repository: nginx
  tag: "1.19.10"
  pullPolicy: IfNotPresent

service:
  type: ClusterIP
  port: 80

ingress:
  enabled: false

resources: {}

nodeSelector: {}

tolerations: []

affinity: {}
```

### Helm Release

The running instance of a chart combined with a specific configuration. This is what helm manages deployed applications and is what allows you to upgrade, install, or rollback any deployments

#### Helm Templating

Helm templating is what allows you to customize your kubernetes releases

```yaml 
apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ include "my-nginx-chart.fullname" . }}
  labels:
    app: {{ include "my-nginx-chart.name" . }}
    chart: {{ include "my-nginx-chart.chart" . }}
spec:
  replicas: {{ .Values.replicaCount }}
  selector:
    matchLabels:
      app: {{ include "my-nginx-chart.name" . }}
  template:
    metadata:
      labels:
        app: {{ include "my-nginx-chart.name" . }}
    spec:
      containers:
        - name: nginx
          image: "{{ .Values.image.repository }}:{{ .Values.image.tag }}"
          ports:
            - containerPort: 80
          resources:
            {{- toYaml .Values.resources | nindent 12 }}

```

## Helm Repositories

Helm repositories are online collections of Helm charts that you can use to deploy applications and services on Kubernetes. They are similar to package repositories in other ecosystems, like apt for Debian or npm for Node.js. You can find public Helm repos on platforms like Artifact Hub, which is a central repository of charts from various sources, or you can use specific repositories provided by software vendors, such as Bitnami’s Helm repo. To use a Helm repo, you add it to your Helm client using the helm repo add command, which then allows you to search, download, and install charts from that repository.

Add repository

```bash
helm repo add <helm-chart> <url>
```

Install chart

```bash
helm install <pod> <helm-chart> --version <version>
```

## Helm v2 vs Helm v3

![[Pasted image 20240812192320.png]]

## Basic Helm Commands

### `helm repo add`

Adds a new Helm chart repository to your local Helm client. This command allows you to specify a repository name and its URL, so you can later search for and install charts from that repository.

```bash
helm repo add bitnami https://charts.bitnami.com/bitnami
```

### `helm repo update`

Fetches the latest list of charts from all the repositories you have added to your Helm client. It updates your local cache with the latest versions of the charts available in the repositories.

```bash
helm repo update
```

### `helm repo list`

Lists all the Helm repositories that have been added to your local Helm client.

```bash
helm repo list
```

### `helm install`

Installs a Helm chart into your Kubernetes cluster. This command deploys the application defined by the chart and creates all the necessary Kubernetes resources.

```bash
helm install my-release bitnami/nginx
```


### `helm uninstall`

Uninstalls a release from your Kubernetes cluster. This command removes all the Kubernetes resources associated with the specified release.

```bash
helm uninstall my-release
```

### `helm status`

Displays the status of a Helm release. This command provides detailed information about the release, including its name, namespace, revision, and the status of the deployed resources.

```bash
helm status my-release
```

### `helm list`

Lists all the releases installed in your Kubernetes cluster. This command displays the release names, namespaces, revision numbers, and current status of each release.

```bash
helm list
```

### `helm list --all-namespaces`

Lists all the releases across all namespaces in your Kubernetes cluster.

```bash
helm list --all-namespaces
```
## VSCode Remote - Kuberentes SSH

Using a tool like the vscode remote kubernetes plugin allows developers to develop their code in the same environment it is deployed.

The best way to configure ssh for authentication with a git server is by *ssh agent forwarding*. This allows the developer to use a local ssh key to authenticate with git from the remote server without storing any ssh keys in kubernetes

## Setup

Download the `Remote SSH` and `Remote - Kubernetes` VSCode plugins

Enable ssh agent forwarding in vscode `Preferences: Open Settings (JSON)`

```json
{
	...
	"remote.SSH.forwardAgent": true,
	"remote.kubernetes.enableSshAgentForwarding": true
	...
}
```

On your local machine configure ssh-agent to run with an ssh key added in your `.bashrc` or `.zshrc`

```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

# to check if working run ssh-add -l
```

Copy your local ssh socket to the pod

```bash
kubectl cp $SSH_AUTH_SOCK <pod-name>:/home/developer/socket/agent
```

Set the SSH_AUTH_SOCK environment variable to point to the previous file

```bash
kubectl exec -it <pod-name> -- /bin/bash "echo 'export SSH_AUTH_SOCK=/home/developer/socket/agent' >> /home/developer/.bashrc"
```

Verify the configuration in the pod

```bash
ssh -T git@github.com
```

## Connecting

You can decide to use either the Remote SSH method or the Remote Kubernetes Method/

### Remote Kubernetes

Simply select the pod in the gui and left click select attach

### Remote SSH *Preferred*

Copy you public ssh key into the pod.

```bash
kubectl cp ~/.ssh/id_rsa.pub <pod-name>:/home/developer/.ssh/id_rsa.pub
```

Add the configuration to your ssh/config

```
Host my-k8s-dev-pod
	HostName 127.0.0.1
	Port 2222
	User developer
	IdentityFile ~/.ssh/id_rsa
	AddKeysToAgent yes
	ForwardAgent yes
	ProxyCommand kubectl port-forward pod/my-pod 2222:22 >/dev/null 2>&1 &
```

Now in vscode you should see the option to connect to the host you configured
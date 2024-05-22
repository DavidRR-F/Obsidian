1. **Download Jenkins CLI From your Server**

```bash
wget http://<your-server>/jnlpJars/jenkins-cli.jar -O ~/jenkins-cli.jar
```

2. **Create a access token**

In `Dashboard >> <User> >> Configure` Add new Token and make note of the secret value

3. **Create a Configuration File**:

```bash
touch ~/.jenkins-cli-config 
chmod 600 ~/.jenkins-cli-config 
vi ~/.jenkins-cli-config
```


**Add the following content**:

```bash
JENKINS_URL="http://<your-server>" 
JENKINS_USER="<your-username>" 
JENKINS_API_TOKEN="<your-api-token>"
```

4. Create a Shell Script to Run Jenkins CLI

```bash
touch ~/.jenkins-cli.sh 
chmod 700 ~/.jenkins-cli.sh 
vi ~/.jenkins-cli.sh
```


**Add the following content**:

```bash
#!/bin/bash  

# Load Jenkins configuration 
source ~/.jenkins-cli-config  

# Execute jenkins-cli.jar with provided arguments 
java -jar ~/jenkins-cli.jar -s $JENKINS_URL -auth $JENKINS_USER:$JENKINS_API_TOKEN "$@"
```

5. Create an Alias for Jenkins CLI

```bash
vi ./~zshrc
alias jenkins-cli="$HOME/jenkins-cli.sh"
```
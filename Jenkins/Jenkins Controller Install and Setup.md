 **![](https://attachment.freshservice.com/inline/attachment?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6MzA1NjcxNTk5NCwiZG9tYWluIjoibWFyeXZpbGxlY29sbGVnZS5mcmVzaHNlcnZpY2UuY29tIiwidHlwZSI6MX0.WcK9mS2Ckt0YMv9QVhVp0vZSX_6ks1O5Kj1b37r1F8Y)**
# **Overview**
The Jenkins Controller provides a centralized GUI for managing Jenkins agents that run various CI/CD and ETL script tasks.

For more information consult the Jenkins Official installation documentation: [https://www.jenkins.io/doc/book/installing/linux/#debianubuntu](https://www.jenkins.io/doc/book/installing/linux/#debianubuntu)

## **Steps**

### **Install Java**
Install the latest Jenkins compatible Java OpenJDK version and 

```bash
sudo apt update
sudo apt install fontconfig openjdk-17-jre
java -version
```

### **Install Jenkins**

For a production environment, get the latest stable LTS repository from debian stable repositories and install Jenkins

```bash
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian/jenkins.io-2023.key

echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt-get update

sudo apt-get install jenkins
```

this will automatically start the Jenkins daemon and GUI (default port 8080). Then via the browser you can login using the default credentials
  
```bash
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

***Note: Secure GUI Behind Reverse Proxy***

## **Configure Github Access**


To configure jenkins to be able to access github, You will need to create a github personal access token with repo and repo_hook permissions that is authorized for the maryvillecollege repository

  

![](https://attachment.freshservice.com/inline/attachment?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6MzA1NzA3NjA0NiwiZG9tYWluIjoibWFyeXZpbGxlY29sbGVnZS5mcmVzaHNlcnZpY2UuY29tIiwidHlwZSI6MX0.kEKaMDCG9ZlABlXSTjZ9cM1AQtAIu3A63qiCpyAFtgM)

After creating the token copy it. Then in jenkins go to Managed Jenkins >> Credentials and create a new credential using the access token as the password and the username the github user that the token was created with.

![](https://attachment.freshservice.com/inline/attachment?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6MzA1NzA3NjA3MiwiZG9tYWluIjoibWFyeXZpbGxlY29sbGVnZS5mcmVzaHNlcnZpY2UuY29tIiwidHlwZSI6MX0.CUzhejUXfvXJO8jU-xQlCj2tQRhsUPU-rCGI7_-mo-w)
## **Configure Azure Entra ID Login** (Optional)


In order to enable GUI authentication using Azure you will need to install the Microsoft Entra ID plugin via jenkin. Go to Mange Jenkins >> Plugins >> Available Plugins. From there you can search for the plugin, install it and reboot jenkins for changes to take effect.

  

**![](https://attachment.freshservice.com/inline/attachment?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6MzA1NzA3NTc5MiwiZG9tYWluIjoibWFyeXZpbGxlY29sbGVnZS5mcmVzaHNlcnZpY2UuY29tIiwidHlwZSI6MX0.nX1SuVMXqX6H7oLEUmimOHnx3JtY3GEzGlfaybabKuA)**  
After the plugin is installed, In Your Azure Portal, go to the azure app registrations and find already created the Jenkins App Registration. Record the Client ID, Tenant ID, and create a client secret to use for jenkins. In Jenkins, go to Manage Jenkins >> Security to add the authentication creational with azure. from there you can add additional authentication configurations as needed

**![](https://attachment.freshservice.com/inline/attachment?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6MzA1NzA3NTg3MCwiZG9tYWluIjoibWFyeXZpbGxlY29sbGVnZS5mcmVzaHNlcnZpY2UuY29tIiwidHlwZSI6MX0.JsR0t1PTpFOqURtxzvgoogjOy1d-7RHKKH64JurXG80)**  

  


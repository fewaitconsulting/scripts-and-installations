# **<span style="color:green">FEWA IT CONSULTING</span>**

### **<span style="color:green">Contact Information</span>**
- **Phone:** +1 (289) 257-6694
- **Website:** [FEWA IT Consulting](https://fewaitconsulting.cloud/)
- **Email:** [frank.takang@fewaitconsulting.cloud](mailto:frank.takang@fewaitconsulting.cloud)

## **SonarQube Installation and Setup on AWS EC2 Redhat Instance**

### **Prerequisites**
- An active AWS account
- A Redhat EC2 instance (t2.medium) with at least 4GB of RAM
- A security group with required ports open (e.g., port 9000 for SonarQube)
- Attached security group to the EC2 instance
- Java OpenJDK 17 installed

### **Step 1: Create Sonar User**

As a good security practice, it's recommended to create a new user to manage the SonarQube server.
```sh
# Create a new user called 'sonar'
sudo useradd sonar

# Grant sudo access to the 'sonar' user
sudo echo "sonar ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/sonar

# Set the hostname for the SonarQube server
sudo hostnamectl set-hostname sonar

# Switch to the 'sonar' user
sudo su - sonar
```
### **Step 2: Enable Password Authentication**

Enable password authentication in the server for easier access management.
```sh
# Enable password authentication
sudo sed -i "/^[^#]*PasswordAuthentication[[:space:]]no/c\PasswordAuthentication yes" /etc/ssh/sshd_config

# Restart the SSH service
sudo service sshd restart
```
### **Step 3: Install Java JDK 17**

Install the necessary software in the opt directory, including Java JDK 17, required for SonarQube to run.

```sh
# Change to the /opt directory
cd /opt

# Install unzip, wget, and git
sudo yum -y install unzip wget git

# Install Java JDK 17
sudo yum install java-17-openjdk-devel -y
```
### **Step 4: Download and Extract SonarQube Server**

Download and extract the SonarQube server software.

```sh
# Download SonarQube version 9.9.7
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.9.7.96285.zip

# Extract SonarQube archive
sudo unzip sonarqube-9.9.7.96285.zip

# Remove the downloaded zip file
sudo rm -rf sonarqube-9.9.7.96285.zip

# Rename the extracted directory for simplicity
sudo mv sonarqube-9.9.7.96285 sonarqube
```
### **Step 5: Grant File Permissions**

Grant file permissions to the sonar user to start and manage SonarQube.

```sh
# Change ownership of the SonarQube directory
sudo chown -R sonar:sonar /opt/sonarqube/

# Change permissions of the SonarQube directory
sudo chmod -R 775 /opt/sonarqube/
```
### **Step 6: Start SonarQube Server**

Start the SonarQube server and check its status.

```sh
# Start the SonarQube server
sh /opt/sonarqube/bin/linux-x86-64/sonar.sh start 

# Check the status of the SonarQube server
sh /opt/sonarqube/bin/linux-x86-64/sonar.sh status
```
### **Step 7: Ensure SonarQube is Running**

Ensure that SonarQube is running and access it via the browser.

```sh
# Check if SonarQube is running
curl -v localhost:9000

# Default SonarQube credentials
# Username: admin
# Password: admin
```
Here's the formatted content in Markdown (.md):

```markdown
### Access SonarQube

Once SonarQube is installed and running, you can access it on the browser using the format:

```
http://EC2-Public-IP:9000
```

Replace `EC2-Public-IP` with your EC2 instance’s actual public IP address.
```

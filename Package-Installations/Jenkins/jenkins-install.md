# **<span style="color:green">FEWA IT CONSULTING</span>**

### **<span style="color:green">Contact Information</span>**
- **Phone:** +1 (289) 257-6694
- **Website:** [FEWA IT Consulting](https://fewaitconsulting.cloud/)
- **Email:** [frank.takang@fewaitconsulting.cloud](mailto:frank.takang@fewaitconsulting.cloud)

## **Jenkins Installation and Setup on AWS EC2 Redhat Instance**

### **Prerequisites**
- An active AWS account
- A Redhat EC2 instance (t2.medium) with 4GB RAM
- A security group with required ports open (e.g., port 8080 for Jenkins)
- Attached security group to the EC2 instance
- Java OpenJDK 17 installed

### **Step 1: Set Timezone and Hostname**

Set the timezone and hostname for the Jenkins server.

```sh
# Set the timezone to America/New_York
sudo timedatectl set-timezone America/New_York

# Change the hostname to 'jenkins'
sudo hostnamectl set-hostname jenkins
```

### **Step 2: Install Required Packages**

Install essential packages needed for Jenkins.

```sh
# Install necessary packages
sudo yum install wget tree vim git nano unzip -y
```

### **Step 3: Add Jenkins Repository**

Add the Jenkins repository to your system.

```sh
# Add the Jenkins repository to yum
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo

# Import the Jenkins key
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

# Upgrade the system packages
sudo yum upgrade -y
```

### **Step 4: Install Java and Jenkins**

Install Java and Jenkins, and then start Jenkins.

```sh
# Install the required dependencies and Java
sudo yum install fontconfig java-17-openjdk -y

# Install Jenkins
sudo yum install jenkins -y
```

### **Step 5: Enable and Start Jenkins**

Enable Jenkins to start on boot and start the Jenkins service.

```sh
# Reload systemd manager configuration
sudo systemctl daemon-reload

# Enable Jenkins to start on boot
sudo systemctl enable jenkins

# Start Jenkins service
sudo systemctl start jenkins

# Check the status of Jenkins service
sudo systemctl status jenkins

# End of Jenkins installation
echo "End of Jenkins installation"

# Switch back to the ec2-user
sudo su - ec2-user
```

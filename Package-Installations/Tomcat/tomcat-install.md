# **<span style="color:green">FEWA IT CONSULTING</span>**

### **<span style="color:green">Contact Information</span>**
- **Phone:** +1 (289) 257-6694
- **Website:** [FEWA IT Consulting](https://fewaitconsulting.cloud/)
- **Email:** [frank.takang@fewaitconsulting.cloud](mailto:frank.takang@fewaitconsulting.cloud)

## **Apache Tomcat Installation and Setup on AWS EC2 Redhat Instance**

### **Prerequisites**
- An active AWS account
- A Redhat EC2 instance (t2.micro)
- A security group with required ports open (e.g., port 8080 for Tomcat)
- Attached security group to the EC2 instance
- Java OpenJDK 17 installed

### **Step 1: Set Hostname and Install Java**

Set the hostname and install the necessary Java version.

```sh
# Change the hostname to 'tomcat'
sudo hostnamectl set-hostname tomcat

# Switch to the ec2-user
sudo su - ec2-user

# Change to the /opt directory
cd /opt

# Install Git and Wget
sudo yum install git wget -y

# Install Java JDK 17
sudo yum install java-17-openjdk-devel -y

# Install Wget and Unzip packages
sudo yum install wget unzip -y
```

### **Step 2: Download and Extract Tomcat**

Download and extract the Apache Tomcat server.

```sh
# Download Apache Tomcat version 9.0.91
sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.91/bin/apache-tomcat-9.0.91.zip

# Extract the downloaded Tomcat zip file
sudo unzip apache-tomcat-9.0.91.zip

# Remove the zip file to clean up
sudo rm -rf apache-tomcat-9.0.91.zip
```

### **Step 3: Set Up Tomcat Directory and Permissions**

Rename the Tomcat directory for better naming conventions and set the necessary permissions.

```sh
# Rename the Tomcat directory
sudo mv apache-tomcat-9.0.91 tomcat9

# Assign executable permissions to the Tomcat home directory
sudo chmod 777 -R /opt/tomcat9

# Change the owner to 'ec2-user'
sudo chown ec2-user -R /opt/tomcat9
```

### **Step 4: Start Tomcat and Create Soft Links**

Start the Tomcat server and create soft links for easier management.

```sh
# Start the Tomcat server
sh /opt/tomcat9/bin/startup.sh

# Create soft links to start and stop Tomcat
sudo ln -s /opt/tomcat9/bin/startup.sh /usr/bin/starttomcat
sudo ln -s /opt/tomcat9/bin/shutdown.sh /usr/bin/stoptomcat

# Use the soft link to start Tomcat
starttomcat

# Switch back to the ec2-user
sudo su - ec2-user
```

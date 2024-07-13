# **<span style="color:green">FEWA IT CONSULTING</span>**

### **<span style="color:green">Contact Information</span>**
- **Phone:** +1 (289) 257-6694
- **Website:** [FEWA IT Consulting](https://fewaitconsulting.cloud/)
- **Email:** [frank.takang@fewaitconsulting.cloud](mailto:frank.takang@fewaitconsulting.cloud)

## **Apache Maven Installation and Setup on AWS EC2 Redhat Instance**

### **Prerequisites**
- An active AWS account
- A security group with required ports open (e.g., port 22 for SSH)
- A Redhat EC2 instance (t2.medium) with at least 4GB of RAM
- Attached security group to the EC2 instance
- Java OpenJDK 1.8 or higher installed

### **Step 1: Install Java JDK 17+ and Other Necessary Software**

First, we'll set up the hostname and switch to the `ec2-user`. Then, we will install Java JDK 17+, Git, wget, nano, tree, and unzip.

```sh
# Set the hostname to 'maven'
sudo hostnamectl set-hostname maven

# Switch to ec2-user
sudo su - ec2-user

# Change to /opt directory
cd /opt

# Install wget, nano, tree, unzip, and Git
sudo yum install wget nano tree unzip git-all -y

# Install Java JDK 17+
sudo yum install java-17-openjdk-devel -y

# Verify the Java installation
java -version

# Verify the Git installation
git --version
```
### **Step 2: Download and Install Maven**

Next, we will download, extract, and install Maven.

```sh
# Download Maven
sudo wget https://dlcdn.apache.org/maven/maven-3/3.9.8/binaries/apache-maven-3.9.8-bin.zip

# Extract the Maven zip file
sudo unzip apache-maven-3.9.8-bin.zip

# Remove the zip file to clean up
sudo rm -rf apache-maven-3.9.8-bin.zip

# Rename the Maven directory
sudo mv apache-maven-3.9.8/ maven
```
### **Step 3: Set Environment Variables**

Set the environment variables for Maven in the ~/.bash_profile for the ec2-user.

```sh
# Edit the .bash_profile to add Maven environment variables
vi ~/.bash_profile

# Add the following lines to the file
export M2_HOME=/opt/maven
export PATH=$PATH:$M2_HOME/bin
```
### **Step 4: Refresh Profile and Verify Maven Installation**

Finally, refresh the profile to apply the changes and verify the Maven installation.

```sh
# Refresh the profile to apply the changes
source ~/.bash_profile

# Verify the Maven installation
mvn -version

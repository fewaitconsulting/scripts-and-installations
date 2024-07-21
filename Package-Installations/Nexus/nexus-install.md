# **<span style="color:green">FEWA IT CONSULTING</span>**

### **<span style="color:green">Contact Information</span>**
- **Phone:** +1 (289) 257-6694
- **Website:** [FEWA IT Consulting](https://fewaitconsulting.cloud/)
- **Email:** [frank.takang@fewaitconsulting.cloud](mailto:frank.takang@fewaitconsulting.cloud)

## **Nexus Installation and Setup on AWS EC2 Redhat Instance**

### **Prerequisites**
- An active AWS account
- A Redhat EC2 instance (t2.medium) with at least 4GB of RAM
- A security group with required ports open (e.g., port 8081 for Nexus)
- Attached security group to the EC2 instance
- Java OpenJDK 17 installed

### **Step 1: Create Nexus User**

As a good security practice, it's recommended to create a new user to manage the Nexus server.

```sh
# Set the hostname for the Nexus server
sudo hostnamectl set-hostname nexus

# Create a new user called 'nexus'
sudo useradd nexus

# Grant sudo access to the 'nexus' user
sudo echo "nexus ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/nexus

# Switch to the 'nexus' user
sudo su - nexus
```

### **Step 2: Install Java and Other Required Software**

Install the necessary software, including Java JDK 17, required for Nexus to run.

```sh
# Change to the /opt directory
cd /opt

# Install wget, git, nano, and unzip
sudo yum install wget git nano unzip -y

# Install Java JDK 11 & 17
sudo yum install java-17-openjdk-devel -y
sudo yum install java-11-openjdk-devel -y
```

### **Step 3: Download and Extract Nexus**

Download and extract the Nexus software.

```sh
# Download Nexus
sudo wget https://download.sonatype.com/nexus/3/nexus-3.70.1-02-java11-unix.tar.gz 

# Extract the Nexus tar.gz file
sudo tar -zxvf nexus-3.70.1-02-java11-unix.tar.gz

# Rename the Nexus directory
sudo mv /opt/nexus-3.70.1-02 /opt/nexus

# Remove the tar.gz file to clean up
sudo rm -rf nexus-3.70.1-02-java11-unix.tar.gz
```

### **Step 4: Grant File Permissions**

Grant file permissions to the nexus user to start and manage Nexus.

```sh
# Change the owner and group permissions for the Nexus and sonatype-work directories
sudo chown -R nexus:nexus /opt/nexus
sudo chown -R nexus:nexus /opt/sonatype-work

# Change the permissions for the Nexus and sonatype-work directories
sudo chmod -R 775 /opt/nexus
sudo chmod -R 775 /opt/sonatype-work
```

### **Step 5: Configure Nexus to Run as Nexus User**

Open the `/opt/nexus/bin/nexus.rc` file and uncomment the `run_as_user` parameter to set it as the nexus user.

```sh
# Set the run_as_user parameter in the nexus.rc file
echo 'run_as_user="nexus"' | sudo tee /opt/nexus/bin/nexus.rc
```

### **Step 6: Configure Nexus to Run as a Service**

Configure Nexus to run as a service.

```sh
# Create a symbolic link for the Nexus service
sudo ln -s /opt/nexus/bin/nexus /etc/init.d/nexus

# Enable and start the Nexus service
sudo systemctl enable nexus
sudo systemctl start nexus

# Check the status of the Nexus service
sudo systemctl status nexus

echo "End of Nexus installation"
```

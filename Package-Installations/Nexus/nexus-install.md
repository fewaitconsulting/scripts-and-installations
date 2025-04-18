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

# Install Java JDK 17
sudo yum install java-17-openjdk-devel -y

# Verify Java installation
java -version

```

### **Step 3: Download and Extract Nexus**

Download and extract the Nexus software.

```sh
    # Download Nexus
    sudo wget https://download.sonatype.com/nexus/3/nexus-3.75.1-01-unix.tar.gz

    # Extract the Nexus tar.gz file
    sudo tar -zxvf nexus-3.75.1-01-unix.tar.gz

    # Rename the Nexus directory for simplicity
    sudo mv /opt/nexus-3.75.1-01 /opt/nexus

    # Remove the tar.gz file to clean up
    sudo rm -rf nexus-3.75.1-01-unix.tar.gz
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

# Setting Up a Systemd Service for Nexus

## Create a Systemd Service File

### Open a new service file for Nexus:
```bash
sudo vi /etc/systemd/system/nexus.service
```

### Add the following content:
```ini
[Unit]
Description=Nexus Repository Manager
After=network.target

[Service]
Type=forking
User=nexus
Group=nexus
ExecStart=/opt/nexus/bin/nexus start
ExecStop=/opt/nexus/bin/nexus stop
Restart=on-abort
LimitNOFILE=65536

[Install]
WantedBy=multi-user.target
```

- Ensure the `User=nexus` matches the user running Nexus.  
- Check if `/opt/nexus/bin/nexus` exists; if it's installed in another location, update the path.

```sh

# Reload, Enable and start the Nexus service
sudo systemctl daemon-reload
sudo systemctl enable nexus
sudo systemctl start nexus

# Check the status of the Nexus service
sudo systemctl status nexus

```

## **<span style="color:green">Access Nexus</span>**

- **Open your web browser and go to** `http://<your-ip-address>:8081`.

## **<span style="color:green">Retrieve the Admin Password</span>**

**Use the following command to display the initial admin password:**
```bash
    # View the admin password
    cat /opt/sonatype-work/nexus3/admin.password
```


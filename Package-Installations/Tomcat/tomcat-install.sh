#!/bin/bash

# Step 1: Set Hostname and Install Java

echo "Setting hostname to 'tomcat'..."
sudo hostnamectl set-hostname tomcat

# Change to the /opt directory
echo "Switching to /opt directory..."
cd /opt

# Install git, wget, and unzip
echo "Installing git, wget, and unzip..."
sudo yum install git wget unzip -y

# Install Java JDK 17
echo "Installing Java JDK 17..."
sudo yum install java-17-openjdk-devel -y

# Step 2: Download and Extract Tomcat

echo "Downloading Apache Tomcat 9.0.98..."
sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.98/bin/apache-tomcat-9.0.98.zip

echo "Extracting Apache Tomcat..."
sudo unzip apache-tomcat-9.0.98.zip

# Clean up by removing the zip file
echo "Cleaning up zip file..."
sudo rm -rf apache-tomcat-9.0.98.zip

# Rename the directory for simplicity
echo "Renaming Tomcat directory to 'tomcat9'..."
sudo mv apache-tomcat-9.0.98 tomcat9

# Step 3: Set Up Tomcat Directory and Permissions

echo "Assigning permissions to Tomcat directory..."
sudo chmod 777 -R /opt/tomcat9

# Change the owner to 'ec2-user'
echo "Changing ownership to ec2-user..."
sudo chown ec2-user -R /opt/tomcat9

# Step 4: Start Tomcat and Create Soft Links

echo "Starting Tomcat server..."
sh /opt/tomcat9/bin/startup.sh

# Create soft links for easier management
echo "Creating soft links for starting and stopping Tomcat..."
sudo ln -s /opt/tomcat9/bin/startup.sh /usr/bin/starttomcat
sudo ln -s /opt/tomcat9/bin/shutdown.sh /usr/bin/stoptomcat

# Start Tomcat using the soft link
echo "Starting Tomcat using soft link..."
starttomcat

echo "Tomcat setup completed successfully!"

# Switch back to the ec2-user
echo "Switching User to ec2-user ..."
sudo su - ec2-user

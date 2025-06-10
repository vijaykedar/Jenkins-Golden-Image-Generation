#!/bin/bash

# Install Terraform #
curl -O https://releases.hashicorp.com/terraform/1.9.8/terraform_1.9.8_linux_amd64.zip https://releases.hashicorp.com/terraform/
sudo apt install -y unzip
sudo unzip terraform_1.9.8_linux_amd64.zip -d /usr/local/bin/

# Install AWS Cli
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo apt install unzip && unzip awscliv2.zip
sudo ./aws/install --bin-dir /usr/bin --install-dir /usr/bin/aws-cli --update

# Install Packer #
wget https://releases.hashicorp.com/packer/1.8.7/packer_1.8.7_linux_amd64.zip
sudo unzip packer_1.8.7_linux_amd64.zip -d /usr/local/bin

# Install Trivy #
sudo apt update
sudo apt install -y wget apt-transport-https gnupg lsb-release
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo apt-key add -
echo deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main | sudo tee -a /etc/apt/sources.list.d/trivy.list
sudo apt update
sudo apt install -y trivy

# Install JRE #
sudo apt install -y openjdk-17-jre


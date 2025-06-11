#---------------------------------------------#
# Author: Adam WezvaTechnologies
# Call/Whatsapp: +91-9739110917
#---------------------------------------------#

#!/bin/bash
efs=$1
sudo su
echo "#----------------------#"
echo "-- Install ansible --"
echo "#----------------------#"
sudo apt-get update -y
sudo apt-get install ansible -y

cd /home/ubuntu
echo "#-------------------------------------#"
echo "-- Extracting ansible scripts --"
echo "#-------------------------------------#"
if [ ! -f jenkinsrole.tar ];
then
  echo "ERROR: jenkinsrole.tar not found!"
  exit 1
fi
tar -xvf jenkinsrole.tar

echo "#------------------------------------------------------------#"
echo "-- Running ansible playbook to install Jenkins --"
echo "#------------------------------------------------------------#"
ansible-playbook jenkins.yml -e "efs=$efs"

echo "#----------------------#"
echo "-- Remove ansible --"
echo "#----------------------#"
sudo apt-get remove -y ansible

#---------------------------------------------#
# Author: Adam WezvaTechnologies
# Call/Whatsapp: +91-9739110917
#---------------------------------------------#

#---------------------------------------------#
# Author: Adam WezvaTechnologies
# Call/Whatsapp: +91-9739110917
#---------------------------------------------#

#!/bin/bash
efs=$1

echo "#----------------------#"
echo "-- Install ansible --"
echo "#----------------------#"
sudo apt update
sudo apt install -y ansible

cd /home/ubuntu
echo "#-------------------------------------#"
echo "-- Extracting ansible scripts --"
echo "#-------------------------------------#"
tar -xvf jenkinsrole.tar

echo "#------------------------------------------------------------#"
echo "-- Running ansible playbook to install Jenkins --"
echo "#------------------------------------------------------------#"
ansible-playbook jenkins.yml -e "efs=$efs"

echo "#----------------------#"
echo "-- Remove ansible --"
echo "#----------------------#"
sudo apt remove -y ansible

#---------------------------------------------#
# Author: Adam WezvaTechnologies
# Call/Whatsapp: +91-9739110917
#---------------------------------------------#
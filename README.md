# jenkins_goldenimage

<html><body><h3 style="font-size:50px;color:blue;">Vijay | <font style="color:red;"> www.devopsfront.com | <font style="color:green;"> contact@devopsfront.com </h3>
</body></html>

## Ensure Packer 1.8.7 is available - the script is tested against this version at the time of creation ##
 $ wget https://releases.hashicorp.com/packer/1.8.7/packer_1.8.7_linux_amd64.zip
 $ unzip packer_1.8.7_linux_amd64.zip -d /usr/local/bin


## Create zip file
 $ tar -cvf jenkinsrole.tar role/ jenkins.yml

## Set AWS access/secret key environment variables & run the following
 $ packer build aws-ami.json# Jenkins-Golden-Image-Generation

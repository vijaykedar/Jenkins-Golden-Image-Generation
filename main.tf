provider "aws" {
  region = "ap-south-1"
}

data "aws_efs_file_system" "myefs" {
  tags = {
    Name = "jrp"
  }
}

resource "null_resource" "script_file" {
  provisioner "local-exec" {
    command = "packer build -var efsid=${data.aws_efs_file_system.myefs.id} aws-ami.json"
  }
}


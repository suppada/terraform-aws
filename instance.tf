provider "aws" {
  region = var.aws_region
}

// EC2 Instance Resource for Module
data "aws_ami" "ansible" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "name"
    values = ["al2023-ami-2023*"]
  }
}

resource "aws_instance" "ec2_instance" {
  count                       = var.ec2_count
  instance_type               = var.instance_type
  ami                         = data.aws_ami.ansible.id
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.sg.id]
  iam_instance_profile        = aws_iam_instance_profile.profile.name
  user_data                   = file("user-ansible.sh")
  associate_public_ip_address = true
  subnet_id                   = var.subnet_id
  monitoring                  = true
  availability_zone           = "us-east-2a"
  ebs_block_device {
    device_name = "/dev/xvda"
    volume_size = var.volume_size
  }

  tags = {
    Name        = var.instance_name
    Environment = var.environment_tag
    Owner       = var.owner
    Project     = var.project
  }
}
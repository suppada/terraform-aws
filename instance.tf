resource "aws_instance" "ec2_instance" {
  count                       = var.ec2_count
  instance_type               = var.instance_type
  ami                         = "ami-0fc82f4dabc05670b"
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

###################### Key Pair ######################
resource "aws_key_pair" "ssh_key_terraform" {
  key_name   = var.key_name
  public_key = var.access_key

  tags = {
    Name      = "Key Pair"
    ManagedBy = var.tags_ManagedBy
  }
}
###################### ### #### ######################


###################### EC2 ######################
resource "aws_instance" "ec2_terraform" {
  count                  = 2
  ami                    = count.index == 0 ? var.ami[0] : var.ami[1]
  instance_type          = var.instance_type
  subnet_id              = count.index == 0 ? aws_subnet.subnet_1a.id : aws_subnet.subnet_1b.id
  vpc_security_group_ids = [aws_security_group.sg_terraform.id]

  tags = {
    Name      = "EC2_${count.index + 1}"
    ManagedBy = var.tags_ManagedBy
  }

  key_name = aws_key_pair.ssh_key_terraform.key_name
}
###################### ### ######################
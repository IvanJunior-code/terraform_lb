###################### VPC ######################
resource "aws_vpc" "vpc_terraform" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name      = "VPC"
    ManagedBy = var.tags_ManagedBy
  }
}
###################### ### ######################


###################### Subnet ######################
resource "aws_subnet" "subnet_terraform" {
  vpc_id                  = aws_vpc.vpc_terraform.id
  cidr_block              = var.subnet_cidr_block
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name      = "Subnet"
    ManagedBy = var.tags_ManagedBy
  }

}
###################### ###### ######################
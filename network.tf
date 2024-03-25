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
resource "aws_subnet" "subnet_1a" {
  vpc_id                  = aws_vpc.vpc_terraform.id
  cidr_block              = var.subnet_cidr_block[0]
  availability_zone       = var.availability_zone[0]
  map_public_ip_on_launch = true

  tags = {
    Name      = "Subnet 1a"
    ManagedBy = var.tags_ManagedBy
  }

}

resource "aws_subnet" "subnet_1b" {
  vpc_id                  = aws_vpc.vpc_terraform.id
  cidr_block              = var.subnet_cidr_block[1]
  availability_zone       = var.availability_zone[1]
  map_public_ip_on_launch = true

  tags = {
    Name      = "Subnet 1b"
    ManagedBy = var.tags_ManagedBy
  }

}
###################### ###### ######################

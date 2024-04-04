###################### Internet Gateway ######################
resource "aws_internet_gateway" "gw_terraform" {
  vpc_id = aws_vpc.vpc_terraform.id

  tags = {
    Name = "Internet Gateway"
  }
}
###################### ######## ####### ######################


###################### Route Table ######################
resource "aws_route_table" "route_table_terraform" {
  vpc_id = aws_vpc.vpc_terraform.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw_terraform.id
  }

  tags = {
    Name = "Route Table"
  }
}
###################### ##### ##### ######################


###################### Route Table Association ######################
resource "aws_route_table_association" "association_subnet_route" {
  subnet_id      = aws_subnet.subnet_1a.id
  route_table_id = aws_route_table.route_table_terraform.id
}
###################### ##### ##### ########### ######################

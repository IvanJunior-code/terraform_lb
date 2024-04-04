###################### Security Group ######################
resource "aws_security_group" "sg_terraform" {
  name        = var.sg_name
  description = "Allow SSH, HTTP, HTTPS inbound traffic and outbound traffic"
  vpc_id      = aws_vpc.vpc_terraform.id

  tags = {
    Name = "Security Group"
  }
}
###################### ######## ##### ######################


# # Definindo o security group para o load balancer
# resource "aws_security_group" "lb_sg" {
#   name        = "lb_sg"
#   description = "Security group for the load balancer"
#   vpc_id      = aws_vpc.vpc_terraform.id

#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name      = "Load Balancer Security Group"
#
#   }
# }


###################### Security Group Ingress Rule ######################
# resource "aws_vpc_security_group_ingress_rule" "ingress_ssh_ipv4" {
#   security_group_id = aws_security_group.sg_terraform.id
#   description       = "Allow SSH inbound traffic IPv4."
#   cidr_ipv4         = "0.0.0.0/0"
#   from_port         = 22
#   ip_protocol       = "tcp"
#   to_port           = 22

#   tags = {
#     Name      = "Ingress Rule SSH IPv4"
#
#   }
# }

resource "aws_vpc_security_group_ingress_rule" "ingress_http_ipv4" {
  security_group_id = aws_security_group.sg_terraform.id
  description       = "Allow HTTP inbound traffic IPv4."
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80

  tags = {
    Name = "Ingress Rule HTTP IPv4"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ingress_https_ipv4" {
  security_group_id = aws_security_group.sg_terraform.id
  description       = "Allow HTTPS inbound traffic IPv4."
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443

  tags = {
    Name = "Ingress Rule HTTPS IPv4"
  }
}
###################### ######## ##### ####### #### ######################


###################### Security Group Egress Rule ######################
# resource "aws_vpc_security_group_egress_rule" "egress_ssh_ipv4" {
#   security_group_id = aws_security_group.sg_terraform.id
#   description       = "Allow SSH outbound traffic IPv4."
#   cidr_ipv4         = "0.0.0.0/0"
#   from_port         = 22
#   ip_protocol       = "tcp"
#   to_port           = 22

#   tags = {
#     Name      = "Egress Rule SSH IPv4"
#
#   }
# }

resource "aws_vpc_security_group_egress_rule" "egress_http_ipv4" {
  security_group_id = aws_security_group.sg_terraform.id
  description       = "Allow HTTP outbound traffic IPv4."
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80

  tags = {
    Name = "Egress Rule HTTP IPv4"
  }
}

resource "aws_vpc_security_group_egress_rule" "egress_https_ipv4" {
  security_group_id = aws_security_group.sg_terraform.id
  description       = "Allow HTTPS outbound traffic IPv4."
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443

  tags = {
    Name = "Egress Rule HTTPS IPv4"
  }
}
###################### ######## ##### ###### #### ######################
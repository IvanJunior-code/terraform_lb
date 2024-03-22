# Definindo o security group para o load balancer
resource "aws_security_group" "lb_sg" {
  name        = "lb_sg"
  description = "Security group for the load balancer"
  vpc_id      = aws_vpc.vpc_terraform.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Criando o load balancer
resource "aws_lb" "my_load_balancer" {
  name               = "my-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = [aws_subnet.subnet_1a.id, aws_subnet.subnet_1b.id] # Substitua pelas suas subnets

  enable_deletion_protection = false
}

# Criando o listener do load balancer
resource "aws_lb_listener" "my_listener" {
  load_balancer_arn = aws_lb.my_load_balancer.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my_target_group.arn
  }
}

# Definindo o target group
resource "aws_lb_target_group" "my_target_group" {
  name     = "my-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc_terraform.id
}

# Associando as instâncias EC2 ao target group
resource "aws_lb_target_group_attachment" "web_attachment" {
  count           = 2
  target_group_arn = aws_lb_target_group.my_target_group.arn
  target_id        = aws_instance.ec2_terraform[count.index].id
}
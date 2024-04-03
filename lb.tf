# Criando o load balancer
resource "aws_lb" "my_load_balancer" {
  name               = "my-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg_terraform.id]
  subnets            = [aws_subnet.subnet_1a.id, aws_subnet.subnet_1b.id]

  enable_deletion_protection = false

  tags = {
    Name      = "Load Balancer"
    ManagedBy = var.tags_ManagedBy
  }
}

# Criando o listener do load balancer
resource "aws_lb_listener" "my_listener" {
  load_balancer_arn = aws_lb.my_load_balancer.arn
  port              = 80
  protocol          = "HTTP"
  depends_on        = [aws_lb_target_group.my_target_group]

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my_target_group.arn
  }

  tags = {
    Name      = "Load Balancer Listener"
    ManagedBy = var.tags_ManagedBy
  }
}

# Definindo o target group
resource "aws_lb_target_group" "my_target_group" {
  name       = "my-target-group"
  port       = 80
  protocol   = "HTTP"
  vpc_id     = aws_vpc.vpc_terraform.id
  depends_on = [aws_instance.ec2_terraform]

  tags = {
    Name      = "Load Balancer Target Group"
    ManagedBy = var.tags_ManagedBy
  }
}

# Associando as instâncias EC2 ao target group
resource "aws_lb_target_group_attachment" "web_attachment" {
  count            = 2
  target_group_arn = aws_lb_target_group.my_target_group.arn
  target_id        = aws_instance.ec2_terraform[count.index].id
}
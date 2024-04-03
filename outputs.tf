output "dns" {
  value = "http://${aws_lb.my_load_balancer.dns_name}"
}
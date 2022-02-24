output "all_zones" {
  value = local.az
}
output "public-ip" {
  value = aws_instance.public_vm[*].public_ip
}
output "private-ip" {
  value = aws_instance.private_vm[*].private_ip
}
output "public_ssh_commands" {
  value = [for i in aws_instance.public_vm[*]: format("ssh -o ServerAliveInterval=5 -i ~/.ssh/aws/key ${var.ssh_user[var.instance_os]}@%s",i.public_ip)]
}
output "private_ssh_commands" {
  value = [for i in aws_instance.private_vm[*]: format("ssh -o ServerAliveInterval=5 -i ~/.ssh/aws/key ${var.ssh_user[var.instance_os]}@%s",i.private_ip)]
}

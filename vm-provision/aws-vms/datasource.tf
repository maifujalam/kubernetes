data "aws_vpc" "get_vpc" {
#  filter {
#    name   = "tag:Name"
#    values = [var.ocp_cluster_vpc_name]
#  }
    tags = {
    Name = var.vpc_name
  }
}
data "aws_subnet" "get_subnet" {
  count = length(var.subnets)
#  filter {
#    name   = "tag:Name"
#    values = [var.subnets]
#  }
  tags = {
    Name = element(var.subnets,count.index)
  }
}
data "aws_availability_zones" "available" {
  state = "available"
}
data "template_file" "host_template" {
  template = <<EOF
[server]

%{ for ip in aws_instance.public_vm[*].public_ip ~}
${ip} ${"\n"}
%{ endfor ~}

[all:vars]
ansible_user=${var.ssh_user[var.instance_os]}
ansible_ssh_private_key_file=${var.private_key_path}
ansible_ssh_common_args='-o StrictHostKeyChecking=no'
$ansible_python_interpreter=/bin/python3
EOF
}
#data "template_file" "install_nginx" {
#  template = <<EOF
#    sudo systemctl status sshd
#    sudo apt update -y
#    sudo apt install nginx -y
#    sudo systemctl enable nginx
#    sudo chmod 777 -R /var/www/html/
#    echo "<h1>Hello World from $(hostname)</h1>" | tee >> /var/www/html/index.html
#    sudo systemctl restart nginx
#  EOF
#}
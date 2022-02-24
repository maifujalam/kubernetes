locals {
  ports = var.ingress_ports
  az= slice(sort(data.aws_availability_zones.available.names),0,min(length(var.subnets),var.instance_count))
}
resource "aws_key_pair" "key" {
  public_key = file(var.public_key_path)
  key_name   = var.instance_key
  tags = {
    Name = var.instance_key
    owner = "alam"
  }
}
resource "aws_security_group" "sg" {
  name = "${var.instance_name}-${var.security_group}"
  vpc_id = data.aws_vpc.get_vpc.id
  dynamic "ingress" {
    for_each = local.ports
    content {
      from_port = ingress.value
      to_port = ingress.value
      protocol = "tcp"
      cidr_blocks = ["10.0.0.0/16"]
    }
  }
  ingress {
    from_port = -1
    protocol  = "ICMP"
    to_port   = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags   = {
    Name = var.security_group
    owner = "alam"
  }
}
resource "aws_instance" "public_vm" {
  count =  var.enable_public_ip? var.instance_count : 0
  ami                         = var.ami[var.instance_os]
  instance_type               = var.instance_type.c2-m4
  tags                        = {
    Name = "${var.instance_name}-${count.index+1}"
    owner= "alam"
    oc = var.ami[var.instance_os]
  }
  key_name                    = var.instance_key
  subnet_id                   = data.aws_subnet.get_subnet[count.index % length(local.az)].id
  vpc_security_group_ids      = [aws_security_group.sg.id]
  associate_public_ip_address = var.enable_public_ip
  availability_zone = element(local.az,count.index % length(local.az))
  root_block_device {
    volume_size = var.root_volume_size
    delete_on_termination = true
  }
  provisioner "remote-exec" {
    inline = [
      "echo server provisioned.",
      "sudo apt update -y"
    ]
  }
  connection {
    type = "ssh"
    user = var.ssh_user[var.instance_os]
    password = ""
    private_key = file(var.private_key_path)
    host = self.public_ip
  }
  lifecycle {
    ignore_changes = [ami,security_groups]
  }
}
resource "aws_instance" "private_vm" {
  count =  var.enable_public_ip? 0: var.instance_count
  ami                         = var.ami[var.instance_os]
  instance_type               = var.instance_type.c2-m4
  tags                        = {
    Name = "private-${var.instance_name}-${count.index+1}"
    owner= "alam"
    oc = var.ami[var.instance_os]
  }
  key_name                    = var.instance_key
  subnet_id                   = data.aws_subnet.get_subnet[count.index % length(local.az)].id
  vpc_security_group_ids      = [aws_security_group.sg.id]
  associate_public_ip_address = var.enable_public_ip
  availability_zone = element(local.az,count.index % length(local.az))
  root_block_device {
    volume_size = var.root_volume_size
    delete_on_termination = true
  }
  user_data = <<EOF
#!/bin/bash
apt update -y
apt install nginx -y
systemctl enable nginx
chmod 777 -R /var/www/html/
echo "<h1>Hello World from $(hostname)</h1>" | tee >> /var/www/html/index.html
systemctl restart nginx
  EOF
  lifecycle {
    ignore_changes = [ami,security_groups]
  }
}
resource "local_file" "ansible" {
  count =  var.enable_public_ip? 1 : 0
  content = data.template_file.host_template.rendered
  filename = "${path.cwd}/ansible/hosts"
  provisioner "local-exec" {
    command= <<EOF
             ansible-playbook ${path.cwd}/ansible/install_nginx.yaml -i ${path.cwd}/ansible/hosts
    EOF
  }
}
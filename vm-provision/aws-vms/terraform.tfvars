region = "us-east-1"
instance_name = "k8s-rhel"
instance_os = "rhel"  # it will be ubuntu or rhel
root_volume_size = 10
instance_count = 1
allowed_ports = [
  {"port":"4","protocol":"4","description":"IP-IP"},
  {"port":"22","protocol":"TCP","description":"ssh"},
  {"port":"80","protocol":"TCP","description":"http"},
  {"port":"179","protocol":"TCP","description":"BGP"},
  {"port":"443","protocol":"TCP","description":"https"},
  {"port":"5001","protocol":"TCP","description":"app-1"},
  {"port":"4789","protocol":"UDP","description":"vxlan"},
  {"port":"5473","protocol":"TCP","description":"typha"},
  {"port":"6443","protocol":"TCP","description":"k8s-api"},
  {"port":"8080","protocol":"TCP","description":"http"},
  {"port":"5000","protocol":"TCP","description":"nexus"},
  {"port":"30001","protocol":"TCP","description":"k8s-dashboard"}
]
vpc_name = "vpc-1"
subnets = ["private-subnet-2-a","private-subnet-2-b","private-subnet-2-c"]
security_group = "sg-k8s"
instance_key = "vm-key"
public_key_path = "~/.ssh/aws/key.pub"
private_key_path = "~/.ssh/aws/key"
enable_public_ip = false    # Value can be true or false.For Public VM:- true, for Private VM:- false.

## KUBERNETES LEARNINGS
This project is a POC for hands-on experience with kubernetes. 

dnf --disablerepo '*' --enablerepo extras swap centos-linux-repos centos-stream-repos
dnf distro-sync

dnf --disablerepo '*' --enablerepo centos-stream-repos
dnf distro-sync

ansible master -m ping -i host_local

sudo yum install -y kubelet:1.24.0 kubeadm:1.24.0 kubectl:1.24.0 --disableexcludes=kubernetes

runtime-endpoint: unix:///var/run/containerd.sock
image-endpoint: unix:///var/run/containerd.sock
timeout: 2
debug: true
pull-image-on-create: false


/usr/lib/systemd/system/containerd.service
#!/bin/bash

cat <<EOF | sudo tee /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-\$basearch
enabled=1
gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF
sudo yum clean all
#sudo yum install -y kubelet kubeadm kubectl --disableexcludes=kubernetes
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y containerd kubelet kubeadm kubectl --downloadonly --downloaddir=/vagrant/packages/. --nobest
sudo rpm -Uhv /vagrant/packages/*.rpm

###### Verify Containerd  ########
containerd -v
sudo systemctl enable --now containerd.service

########### Kubelet #############
kubelet --version
sudo systemctl enable --now kubelet

############ kubeadm ######
kubeadm version

########## kubectl #######
kubectl version
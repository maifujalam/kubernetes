#!/usr/bin/bash
########## Cleanup Old K8s Config #########
FILE=/home/vagrant/.kube/config
if [ -f "$FILE" ]; then
    printf "\n Deleting existing k8s Cluster...\n\n"
    kubeadm reset --force
fi

################ Linux Kernel Module ########################
echo "Add linux kernel modules..."
cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
  overlay
  br_netfilter
EOF
modprobe overlay
modprobe br_netfilter
printf "\nVerify Linux kernel modules are added"
lsmod | grep br_netfilter
lsmod | grep overlay

################ Verify System Variables #######################
printf "\n Verify system variables are set to 1. \n\n"
# sysctl params required by setup, params persist across reboots
cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
  net.bridge.bridge-nf-call-iptables  = 1
  net.bridge.bridge-nf-call-ip6tables = 1
  net.ipv4.ip_forward                 = 1
EOF
# Apply sysctl params without reboot
sudo sysctl --system
su - vagrant -c "sysctl net.bridge.bridge-nf-call-iptables net.bridge.bridge-nf-call-ip6tables net.ipv4.ip_forward"

############ Set SELINUX to Permissiove ######
# Set SELinux in permissive mode (effectively disabling it)
sudo setenforce 0
sudo sed -i 's/^SELINUX=enforcing$/SELINUX=permissive/' /etc/selinux/config

########## Disable Swap ##########
printf "Diableling SWAP and FIREWALL"
swapoff -a
# Disable swap permanently
sudo systemctl disable --now firewalld

############# Enable kubelet and containerd #########
sudo systemctl enable --now containerd.service
sudo chmod -R 777 /var/run/containerd/
sudo systemctl enable --now kubelet

####################### Init K8s Cluster ########################
printf "\nInitializing Cluster...\n\n"
  kubeadm init --config /vagrant/kubeadm-init/init-default.yaml

printf "\nCopying Config Files...\n\n"
  su - vagrant -c 'mkdir -p $HOME/.kube'
  su - vagrant -c 'sudo cp -vf /etc/kubernetes/admin.conf $HOME/.kube/config'
  su - vagrant -c 'sudo cp -vf /etc/kubernetes/admin.conf /vagrant/config'
  su - vagrant -c 'sudo chown $(id -u):$(id -g) $HOME/.kube/config'

printf "\nsleeping for 5 seconds...\n"
sleep 5

printf "\nInstalling Tigera Operator for Calico CNI...\n\n"
  su - vagrant -c 'kubectl create -f /vagrant/manifests/tigera-operator-v3.26.0.yaml'

printf "\nInstalling Calico CNI with VXLAN...\n\n"
  su - vagrant -c 'kubectl create -f /vagrant/manifests/calico-install-vxlan.yaml'

printf "\nInstalling metric server...\n\n"
   su - vagrant -c 'helm install metrics-server /vagrant/manifests/metrics-server -n kube-system'

printf "\nInstalling k8s Dashboard...\n\n"
  su - vagrant -c 'kubectl create -f /vagrant/manifests/k8s-dashboard-v2.7.0.yaml'

printf "\nCooling down for 30 seconds...\n"
  sleep 30

printf "\n Creating dashboard User...\n\n"
  su - vagrant -c 'kubectl apply -f /vagrant/manifests/dahboard-admin-user.yaml'

printf "\n Extracting dashboard token\n"
  su - vagrant -c 'kubectl -n kubernetes-dashboard create token admin-user --duration=8760h > /vagrant/dashboard_token.txt'

printf "Append token in kubeconfig file.\n"
  su - vagrant -c 'sed -i "/client-key-data/a\    token: $(cat /vagrant/dashboard_token.txt)" /vagrant/config'
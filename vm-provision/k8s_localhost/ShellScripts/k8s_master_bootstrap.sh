#!/usr/bin/bash

sh /vagrant/ShellScripts/1_download-packages.sh
sh /vagrant/ShellScripts/2_configure_network.sh
sh /vagrant/ShellScripts/3-configure_firealld_selinux.sh
sh /vagrant/ShellScripts/4_config_crictl.sh
sh /vagrant/ShellScripts/5_install_helm.sh
########## Cleanup Old K8s Config #########
FILE=/home/vagrant/.kube/config
if [ -f "$FILE" ]; then
    printf "\n Deleting existing k8s Cluster...\n\n"
    kubeadm reset --force
fi
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
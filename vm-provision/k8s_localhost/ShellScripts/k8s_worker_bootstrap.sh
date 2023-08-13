#!/bin/bash
sh /vagrant/ShellScripts/1_download-packages.sh
sh /vagrant/ShellScripts/2_configure_network.sh
sh /vagrant/ShellScripts/3-configure_firealld_selinux.sh
sh /vagrant/ShellScripts/4_config_crictl.sh
########## Cleanup Old K8s Config #########
FILE=/home/vagrant/.kube/config
if [ -f "$FILE" ]; then
    printf "\n Deleting existing k8s Cluster...\n\n"
    kubeadm reset --force
fi
####################### Init K8s Cluster ########################
printf "\nJoining worker to cluster...\n\n"

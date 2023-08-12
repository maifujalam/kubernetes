############ Set SELINUX to Permissiove ######
# Set SELinux in permissive mode (effectively disabling it)
sudo setenforce 0
sudo sed -i 's/^SELINUX=enforcing$/SELINUX=permissive/' /etc/selinux/config

########## Disable Swap ##########
printf "Diableling SWAP and FIREWALL ..."
swapoff -a
# Disable swap permanently
sudo systemctl disable --now firewalld

############# Enable kubelet and containerd #########
sh /vagrant/ShellScripts/config.sh
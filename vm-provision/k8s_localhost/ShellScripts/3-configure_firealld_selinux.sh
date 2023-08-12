############ Set SELINUX to Permissiove ######
# Set SELinux in permissive mode (effectively disabling it)
printf "Configuring Firewalld"
sudo setenforce 0
sudo sed -i 's/^SELINUX=enforcing$/SELINUX=permissive/' /etc/selinux/config

########## Disable Swap ##########
printf "Diableling SWAP and FIREWALL ..."
swapoff -a
# Disable swap permanently
sudo systemctl disable --now firewalld
printf "Firewall and Selinux config Completed"
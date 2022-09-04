**_MANDATORY steps to follow while Cluster Deployment.:-_**
1.1. Add survey with following extra_var in Ansible Tower:-
     1. master_ip(text)     => This should take internal ip address of master-01(leader) node.
     2. extra_ip(text)      => This should take external ip address of master-01(leader) node.
     3. cluster_name(text)  => This should be a cluster name (/iac/cluster_name) folder will be created 
     4. platform(options)   => Should be GCP or Local .It is platform where we are deploying cluster.
    
 OR

1.2. Add this in global-vars.yaml when running from CLI.
     1. master_ip     => This should take internal ip address of master-01(leader) node.
     2. extra_ip      => This should take external ip address of master-01(leader) node.
     3. cluster_name  => This should be a cluster name (/iac/cluster_name) folder will be created
     4. platform      => Should be GCP or Local .It is platform where we are deploying cluster.

5. Finally, run 0.global-vars-config.yaml on localhost.This will update extra vars required to configure cluster.


**To enable IP Forwarding follow below:-**
1. Edit /etc/sysctl.conf and add below lines.

    net.ipv4.ip_forward=1
    net.bridge.bridge-nf-call-iptables=1
    net.bridge.bridge-nf-call-ip6tables = 1
    Reboot systemctl: sudo sysctl -p

2. sysctl net.ipv4.ip_forward=1

**Additional for Flannel Network**
1. echo "net.ipv4.conf.flannel/1.forwarding=1" | sudo tee -a /etc/sysctl.conf
2. sudo sysctl -p


**FULL RESET KUBERENETS CLUSTER**
1. sudo -i
2. sudo kubeadm reset
3. systemctl stop kubelet
4. systemctl stop docker
5. rm -rfv /var/lib/cni/
6. rm -rfv /var/lib/kubelet/*
7. rm -rfv /etc/cni/
8. iptables -F && iptables -t nat -F && iptables -t mangle -F && iptables -X  (iptables -F,iptables -X)
9. ifconfig cni0 down
10. ip link delete cni0
11. ifconfig flannel.1 down
12. ip link delete flannel.1
13. ifconfig docker0 down
14. systemctl restart docker
15. systemctl restart kubelet
16. sysctl -p

**Delete Calico Tunnel**
1. sudo ip link set tunl0 down
2. sudo ip link delete tunl0
3. ip link delete cali435e4f604ee


**CONTAINERD**
Download: containerd.io-1.6.7-3.1.el8.x86_64.rpm
mkdir containerd && cd containerd
cp containerd.io-1.6.7-3.1.el8.x86_64.rpm containerd -v
sudo yum install --downloadonly --downloaddir=. containerd.io-1.6.7-3.1.el8.x86_64.rpm
sudo yum localinstall containerd/*.rpm
sudo systemctl restart containerd.service
sudo systemctl enable containerd.service
sh ShellScripts/get_crictl.sh
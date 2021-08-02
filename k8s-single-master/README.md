1. kubeadm init --apiserver-advertise-address=10.30.0.5 --upload-certs  --kubernetes-version=1.21.1 --pod-network-cidr=192.168.0.0/16 -v=6
2. k run nginx --image=nginx --port=80 --expose
3. k get po,svc,ep 
4. k create service nodeport 
5. 

sysctl -a | grep 'net.ipv4.conf.flannel/1.forwarding'
sysctl -a | grep 'net.ipv4.ip_forward'
iptables -P FORWARD ACCEPT

Edit /etc/sysctl.conf
Add line: net.ipv4.ip_forward=1
Reboot

sysctl net.ipv4.ip_forward=1

echo 1 > /proc/sys/net/ipv4/ip_forward
echo "net.bridge.bridge-nf-call-iptables=1" | sudo tee -a /etc/sysctl.conf
echo "net.bridge.bridge-nf-call-ip6tables = 1" | sudo tee -a /etc/sysctl.conf
echo "net.ipv4.ip_forward=1" | sudo tee -a /etc/sysctl.conf
sudo sysctl -p
echo "net.ipv4.conf.flannel/1.forwarding=1" | sudo tee -a /etc/sysctl.conf




FULL RESET KUBERENETS
1. sudo -i
2. sudo kubeadm reset
3. systemctl stop kubelet
4. systemctl stop docker
5. rm -rfv /var/lib/cni/
6. rm -rfv /var/lib/kubelet/*
7. rm -rfv /etc/cni/
8. iptables -F && iptables -t nat -F && iptables -t mangle -F && iptables -X
9. ifconfig cni0 down
10. ip link delete cni0
11. ifconfig flannel.1 down
12. ip link delete flannel.1
13. ifconfig docker0 down
14. systemctl restart docker
15. systemctl restart kubelet
16. sysctl -p


1. sudo ip link set tunl0 down
2. sudo ip link delete tunl0
3. ip link delete cali435e4f604ee
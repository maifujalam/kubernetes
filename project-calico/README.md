**Calico Networking**  
This project is to set up overlay network using different calico networking modes like:- 

0. direct-routing-all
1. Direct  
2. IPinIP 
3. VX-LAN 
4. 
5. 

caloctl apply -f 0.deafult-ippool.yaml

Open port: nc -l -p 80

VM Setup:-
1. make sure u have tcpdump present

WireShark Setup:-
1. ssh into vm and enable password authentication in : sudo vi /etc/ssh/sshd_config
2. Configure wireshark SSH remote Capture
3. Pass  ssh server address and port 22 
4. For auth pass username:vagrant key:~/.vagrant.d/insecure_private_key
5. capture: eth1,click sudo mode,clear all filters and click save parameters on start
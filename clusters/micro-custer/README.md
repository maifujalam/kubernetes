Q. How to access kubernetes cluster?
A. 1. Make sure you have kubectl installed ( apt install kubectl=1.21.0-00 )
   2. Copy config file to ~/.kube folder (create folder if not present)  
   3. set environment variable in ~/.bashrc with KUBECONFIG=path/to/config
   4. Pass --kubeconfig=config at every kubectl command
   
Q. How to access kubernetes dashboard?
A. 1. make sure your connected with gslab vpn and VCenter vpn.
   2. got to https://10.136.58.4:30000/ 
   3. Click accept risk and continue(may ask multiple times)
   4. pass config file or provided token

Q. How to access Grafana Dashboard?
A. 1.http://master-ip:30001/login (replace master-ip with ip of cluster node) i.e  http://10.136.58.4:30001/login
   2.Default Password: admin/prom-operator

Q. Why I cannot open dashboard with chrome?
A. Chrome does not allow self-signed certificate which we are using for https.
   So dashboard is only accessible by mozilla firefox

Q. What are the IPs of my nodes?

VM Name	    IP Address	   Memory	CPU	     OS	        Storage
Master-Node	10.136.58.4	   8 GB	    4 Core	 Centos 8	100 GB
Worker-1	10.136.58.5	   64 GB	16 Core	 Centos 8	500 GB
Worker-2	10.136.57.250  64 GB	16 Core	 Centos 8	500 GB


Q. Where I can get cluster setup additional file?
   1. ssh into master node 
   2. /iac/cluster_vc

Additional Notes:- Firewall and SELinux have been disabled.Please add rules according to kubernetes docs if you need to enable.

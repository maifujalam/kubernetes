Q. How to access kubernetes cluster?
A. 1. Make sure you have kubectl installed ( apt install kubectl=1.21.0-00 )
   2. Copy config file to ~/.kube folder (create folder if not present)  
   3. set environment variable in ~/.bashrc with KUBECONFIG=path/to/config
   4. Pass --kubeconfig=config at every kubectl command
   
Q. How to access kubernetes dashboard?
A. 1. make sure your connected with gslab vpn and VCenter vpn.
   2. got to https://10.136.58.131:30000/ 
   3. Click accept risk and continue(may ask multiple times)
   4. pass config file or provided token

Q. Why I cannot open dashboard with chrome?
A. Chrome does not allow self-signed certificate which we are using for https.
   So dashboard is only accessible by mozilla firefox

Q. What are the IPs of my nodes?
A. 10.136.58.131
   10.136.58.132
   10.136.58.133

Q. Where I can get cluster setup additional file?
   1. ssh into master node 
   2. /iac/micro_cluster

Additional Notes:- Firewall and SELinux have been disabled.Please add rules according to kubernetes docs if you need to enable.

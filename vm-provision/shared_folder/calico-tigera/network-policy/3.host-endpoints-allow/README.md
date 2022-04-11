**Introduction:-**
Disable access to a node on all ports(exclusing nodeports,calico failsafe ports).Calico internally allow failsafe ports like:- 22,bgp,ipip port.
This is done in 2 steps:-
    a. Creating global network policy to access node only to  localhost on TCP/UDP.
    b. Enable/Create host endpoint security by patching kubecontrollersconfiguration


**Setps to Enable host endpoint security**

1. Create global network policy: k apply -f allow-localhost.yaml
2. Create Host Endpoints: 
   calicoctl patch kubecontrollersconfiguration default --patch='{"spec": {"controllers": {"node": {"hostEndpoint": {"autoCreate": "Enabled"}}}}}'

3. Delete Host Endpoints:
   calicoctl patch kubecontrollersconfiguration default --patch='{"spec": {"controllers": {"node": {"hostEndpoint": {"autoCreate": "Disabled"}}}}}'

4. get host endpoints: calicoctl get heps
                       k get heps
5. If running on other nic then localhost ,then it will other nic cidr.
6. Verify Host endpoint security:
   a. Open a new connection on port 5555: nc 172.17.78.6 5555
   b. Create a new connection on port 5555: nc -w 3 172.17.78.6 5555 OR  telnet 172.17.78.6 5555 (can remove -w 3 also)
7. 
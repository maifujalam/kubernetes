1. Get iptable rules for all services: sudo iptables -v -t nat -L KUBE-SERVICES     [ -v verbose,-t table of type nat,-L list of KUBE-SERVICE ]

Each iptables chain consists of a list of rules that are executed in order until a rule matches. The key columns/elements to note in this output are:

target - which chain iptables will jump to if the rule matches
prot - the protocol match criteria
source, and destination - the source and destination IP address match criteria
the comments that kube-proxy includes
the additional match criteria at the end of each rule - e.g dpt:80 that specifies the destination port match
You can see this chain includes rules to jump to service specific chains, one for each service.

KUBE-SERVICES -> KUBE-SVC-XXXXXXXXXXXXXXXX -> KUBE-SEP-XXXXXXXXXXXXXX

If there were 3 service endpoints then the first chain matches would be probability 0.33333333, the second probability 0.5, and the last unconditional. 
The result of this is that each service endpoint receives a third of the traffic (on average).

**Debug service:**
1. Describe first chain (KUBE-SERVICES): `sudo iptables -v -n -t nat -L KUBE-SERVICES | grep -E summary`  [ v: verbose,n: numeric,t: type (i.e nat),L: List name]
2. Describe second chain (KUBE-SVC-XXXXXXXXXXXXXXXX): `sudo iptables -v -n -t nat -L KUBE-SVC-OIQIZJVJK6E34BR4 ` [SVC: Service]
3. Describe third chain (KUBE-SEP-XXXXXXXXXXXXXX) :` sudo iptables -v -n -t nat -L KUBE-SEP-RI5SSFZ3YPZOMF6I `  [ SEP: Service Endpoint]
    
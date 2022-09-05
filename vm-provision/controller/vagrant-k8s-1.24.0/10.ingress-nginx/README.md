--set-string controller.service.externalTrafficPolicy=Local 
kubectl -n ingress-nginx patch service ingress-ingress-nginx-controller -p '{"spec": {"type": "LoadBalancer", "externalIPs":["35.200.228.26"]}}'
--set-string controller.service.externalIPs={"35.200.228.26"}
helm install ingress ingress-nginx/ingress-nginx --version=4.0.1 --namespace ingress-nginx --create-namespace  --set-string controller.kind=DaemonSet  -v=7
helm install ingress ingress-nginx/ingress-nginx --version=4.0.1 --namespace ingress-nginx --create-namespace  -v=7
helm upgrade ingress ingress-nginx/ingress-nginx --version=4.0.1 --namespace ingress-nginx --create-namespace   --set controller.service.loadBalancerIP="35.200.228.26" -v=7

helm upgrade ingress ingress-nginx/ingress-nginx --version=4.0.1 --namespace ingress-nginx --create-namespace --set-string controller.service.externalTrafficPolicy=Local 
  --set-string controller.nodeSelector.kubernetes.io/hostname=master --set-string controller.tolerations={key: "key"
  #    operator: "Equal|Exists"
  #    value: "value"
  #    effect: "NoSchedule|PreferNoSchedule|NoExecute(1.6 only)"} -v=7

Set default certificate (Line no. 157) : 
Deployment types can be:-
  1. node-port    (only accessed on 30000-32768) ( they are accessible from internet through public ip,but vulnerable)
  2. host network ( can be accessed on 80 and 443)
  3. edge ( setup edge haproxy) ( its simimar to node port but hare vms are private vm, and they are not accessible from internet)
  4. Load Balancer (If using GKE)
  5. Metal LB (if using private provider or localhost)
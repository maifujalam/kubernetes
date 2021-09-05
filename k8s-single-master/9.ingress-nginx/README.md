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


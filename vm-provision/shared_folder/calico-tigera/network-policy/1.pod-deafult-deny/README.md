1. After default deny is applied.If allow rule is applied on the pod,then allow will take precedence for both ingress and egress.
2. Above rule can be changed using order(i.e precedence).Lower order takes higher precedence(will take effect early).
3. Default order value from kubernetes network policy is 1000.

1. k apply -f tigera-operator.yaml
2. k apply -f install-calico.yaml
3. kubectl get tigerastatus/calico
4. kubectl get pods -n calico-system [make sure all are running]
5. k describe GlobalNetworkPolicy default-app-policy
6. k
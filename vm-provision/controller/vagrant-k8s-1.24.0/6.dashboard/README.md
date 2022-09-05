helm install kubernetes-dashboard/kubernetes-dashboard --name my-release -f values.yaml
helm install k8s-dashboard kubernetes-dashboard/kubernetes-dashboard --version=5.0.0 --namespace kubernetes-dashboard --create-namespace --values=values.yaml --dry-run

helm template k8s-dashboard kubernetes-dashboard/kubernetes-dashboard --version=5.0.0 --namespace kubernetes-dashboard --create-namespace --values=values.yaml --output-dir=abc

k apply -f abc --dry-run=client

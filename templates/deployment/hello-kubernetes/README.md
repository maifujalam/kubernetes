
https://github.com/paulbouwer/hello-kubernetes

helm install --create-namespace --namespace hello-kubernetes hello-world ./hello-kubernetes \
  --set ingress.configured=true --set ingress.pathPrefix=hello-world \
  --set service.type=ClusterIP

helm install --create-namespace --namespace hello-kubernetes custom-message ./hello-kubernetes \
  --set ingress.configured=true --set ingress.pathPrefix=custom-message \
  --set service.type=ClusterIP \
  --set message="This is my custom message!"
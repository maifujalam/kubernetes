1. alias k=kubectl
2. k exec -it p1 -- /bin/sh
3. k get po -o custom-columns=NAME:.metadata.name,IP:.status.podIP,NODE:.spec.nodeName
4. 
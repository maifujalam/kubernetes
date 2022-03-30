1. Reference: https://www.digitalocean.com/community/tutorials/how-to-set-up-an-elasticsearch-fluentd-and-kibana-efk-logging-stack-on-kubernete
2. Its only for developemt not for production.If want to enable production then enable security for elastic search.
3. Verify elastic search: 
   a. port foward from container to localhost: `kubectl port-forward es-cluster-0 9200:9200 --namespace=kube-logging`
   b. Curn from another terminal in master node: `curl http://localhost:9200/_cluster/state?pretty`
   c. If elasticsearch install os successful then we will receive a json format output
4. 
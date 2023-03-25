#!/bin/bash
kubectl run busybox0 --image=busybox --restart=Never -- /bin/sh -c "sleep 3600;echo boo"

#!/bin/bash
kubectl run busybox1 --image=busybox --restart=Never -- /bin/sh -c "sleep 3600;echo boo"
echo "sleeping for 30s"
sleep 60

kubectl run busybox2 --image=busybox --restart=Never -- /bin/sh -c "sleep 3600;echo boo"
echo "sleeping for 30s"
sleep 60

kubectl run busybox3 --image=busybox --restart=Never -- /bin/sh -c "sleep 3600;echo boo"
echo "sleeping for 30s"
sleep 60

kubectl run busybox4 --image=busybox --restart=Never -- /bin/sh -c "sleep 3600;echo boo"
echo "sleeping for 30s"
sleep 60

kubectl run busybox5 --image=busybox --restart=Never -- /bin/sh -c "sleep 3600;echo boo"
echo "sleeping for 30s"
sleep 60

kubectl delete po busybox1
echo "sleeping for 30s"
sleep 60

kubectl delete po busybox2
echo "sleeping for 30s"
sleep 60

kubectl delete po busybox3
echo "sleeping for 30s"
sleep 60

kubectl delete po busybox4
echo "sleeping for 30s"
sleep 60

kubectl delete po busybox5
echo "sleeping for 30s"
sleep 60


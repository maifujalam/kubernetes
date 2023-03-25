#!/bin/bash
kubectl create ns a1
echo "sleeping for 30s"
sleep 60

kubectl create ns a2
echo "sleeping for 30s"
sleep 60

kubectl create ns a3
echo "sleeping for 30s"
sleep 60

kubectl create ns a4
echo "sleeping for 30s"
sleep 60

kubectl create ns a5
echo "sleeping for 30s"
sleep 60

kubectl delete ns a1
echo "sleeping for 30s"
sleep 60

kubectl delete ns a2
echo "sleeping for 30s"
sleep 60

kubectl delete ns a3
echo "sleeping for 30s"
sleep 60

kubectl delete ns a4
echo "sleeping for 30s"
sleep 60

kubectl delete ns a5
echo "sleeping for 30s"
sleep 60

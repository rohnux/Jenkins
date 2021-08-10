#!/bin/sh

deployment_name=$1
namespace=$2
spec=hgw-consent-manager
export pod_label=$(kubectl get deployment $deployment_name -n $namespace -o json | jq .spec.template.metadata.labels.app | sed 's/"//g')
echo $pod_label
export pod_list=$(kubectl get pod --selector=app=$pod_label -n $namespace | awk '{print $1}' | sed 1d)
echo $pod_list
for pod_name in $pod_list ;
     do
           kubectl delete pod $pod_name -n $namespace
     done
     
     
     
 # Run Shell script using command ->  ./pod_restart_script.sh demo-service demo-namespace 

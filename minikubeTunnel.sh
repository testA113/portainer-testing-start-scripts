#!/bin/bash

while [[ $(minikube status  | grep kubeconfig: | awk '{print $2}') != "Configured" ]]; 
    do echo "waiting for minikube to start" && sleep 4;   
done

sudo minikube tunnel
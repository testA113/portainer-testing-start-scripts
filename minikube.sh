#!/bin/bash

# start minikube with ingress
minikube start --extra-config=apiserver.service-node-port-range=1-65535 --addons ingress metrics-server --kubernetes-version=v1.23.0

# start portainer using the manifest
sudo kubectl apply -f ~/Desktop/portainer/manual-testing/kubernetes/portainer-ce.yaml
# start the agent
sudo kubectl apply -f ~/Desktop/portainer/manual-testing/kubernetes/portainer-agent-k8s.yaml

# get the ip for the agent
clusterIp=$(sudo kubectl -n portainer get all | grep service/portainer-agent | head -n 1 | awk '{print $3}')
port=$(sudo kubectl -n portainer get all | grep service/portainer-agent | head -n 1 | awk '{print $5}' | awk -F  ":" '/1/ {print $1}')
echo "${clusterIp}:${port}"

# get the portainer url
sudo minikube service --url portainer -n portainer

# optional to run, exposing the https portainer port 
# kp expose deployment portainer --name=portainersvc --type=LoadBalancer --port=9443 --target-port=9443
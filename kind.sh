#!/bin/bash

kind create cluster --config=kindconfig.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
helm repo add metrics-server https://kubernetes-sigs.github.io/metrics-server/

helm upgrade --namespace kube-system --install \
    --atomic \
    --set args={--kubelet-insecure-tls} \
    metrics-server \
    metrics-server/metrics-server

kubectl apply -f ~/Desktop/portainer/manual-testing/kubernetes/portainer-ce.yaml


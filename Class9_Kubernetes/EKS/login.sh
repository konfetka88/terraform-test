#!/bin/bash
aws eks --region us-east-1 update-kubeconfig --name my-cluster
kubectl get ns
kubectl get nodes
kubectl get pods -n kube-system
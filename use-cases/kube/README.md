# Simple Kubernetes deployment on minikube

The example does the following:

- Creates nginx deployment via properties
- Creates another nginx deployment via Kubernetes definition file
- Creates mysql deployment via Helm

## Prerequisites

The installation requires:

- minikube
- kubectl
- opera
- openshift
- helm
- community.kubernetes Ansible collections

## Installation

Tested on Ubuntu 20.04...

Installing minikube:

```
wget https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
minikube start
``` 

Installing kubectl:

```
curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
kubectl version --client
```

Installing opera and openshift:

```
python3 -m venv .venv && . .venv/bin/activate
pip install opera openshift
``` 

Installing Helm v3.4.0:

```
export HELM_VERSION=v3.4.0
mkdir helm && cd helm
wget https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz
tar -zxvf helm-${HELM_VERSION}-linux-amd64.tar.gz
sudo cp linux-amd64/helm /usr/local/bin/helm
cd ..
rm -rf helm
```

Installing Ansible Kubernetes collections:

```
ansible-galaxy collection install community.kubernetes
```

## Running example

Simply run the example via opera CLI:

```
opera deploy service.yaml
```

To undeploy:

```
opera undeploy
```
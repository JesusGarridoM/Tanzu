#!/bin/bash

echo "Iniciando descarga de kubectl"
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
echo "Iniciando descarga de checksum"
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "Validar checksum"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
echo "Instalar kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
echo "Version de kubectl"
kubectl version --client

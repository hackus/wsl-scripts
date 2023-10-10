#!/bin/bash

#https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
#https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/

echo muric | sudo -S ls
sudo rm -R /etc/kubernetes/manifests
sudo apt-get purge kubeadm kubectl kubelet kubernetes-cni kube* << 'EOF'
Y
EOF

sudo rm -rf ~/.kube

sudo apt-get update
# apt-transport-https may be a dummy package; if so, you can skip that package

echo '*************************************************************'
echo "installing tools"
echo '*************************************************************'

sudo apt-get install -y apt-transport-https ca-certificates curl

echo '*************************************************************'
echo "GPG "
echo '*************************************************************'
sudo rm /etc/apt/keyrings/kubernetes-apt-keyring.gpg
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

# This overwrites any existing configuration in /etc/apt/sources.list.d/kubernetes.list
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.28/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list

sudo apt-get update


echo '*************************************************************'
echo "Install packages"
echo '*************************************************************'
sudo apt-get install -y --allow-change-held-packages kubelet kubeadm kubectl
echo '*************************************************************'
echo "Hold"
echo '*************************************************************'
sudo apt-mark hold kubelet kubeadm kubectl
#https://github.com/kubernetes/kubeadm/issues/610

echo muric | sudo -S ls
#disable swap
sudo swapoff -a

echo '*************************************************************'
echo 'Reset kubeadm'
echo '*************************************************************'
sudo kubeadm reset << 'EOF'
Y
EOF
#echo 'Environment="KUBELET_EXTRA_ARGS=--fail-swap-on=false"' >> /etc/systemd/system/kubelet.service.d/10-kubeadm.conf

echo '*************************************************************'
echo 'Restart demon-reload and kubelet'
echo '*************************************************************'
sudo systemctl daemon-reload
sudo systemctl restart kubelet

sudo cp /etc/containerd/config.toml /etc/containerd/config.toml_backup
sudo rm /etc/containerd/config.toml

echo '*************************************************************'
echo 'Restart containerd'
echo '*************************************************************'
sudo systemctl restart containerd


echo '*************************************************************'
echo 'Init kubeadm'
echo '*************************************************************'
sudo kubeadm init
#sudo kubeadm init --ignore-preflight-errors Swap
#kubeadm init --config kubeadm-config_not_needed.yaml

nohup wsl > file1 2>&1 &

folder=~./kube
filename=$folder/config

mkdir -p ~/.kube



echo '*************************************************************'
echo 'Check filename exists'
echo '*************************************************************'
if [ -f $filename ]; then
  echo filename already exists
else
  sudo cp /etc/kubernetes/admin.conf ~/.kube/config
fi

#mkdir -p $HOME/.kube
#sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config


echo '*************************************************************'
echo 'Change permissions'
echo '*************************************************************'
sudo chown $(id -u):$(id -g) ~/.kube/config
#Below is only for root user
#export KUBECONFIG=~/.kube/config/admin.conf
#unset KUBECONFIG

#fixing network issues

echo '*************************************************************'
echo 'Fix network issues'
echo '*************************************************************'
kubectl apply -f https://github.com/weaveworks/weave/releases/download/v2.8.1/weave-daemonset-k8s.yaml

# avoid taint exceptions
#taint
#kubectl taint nodes --all node.kubernetes.io/not-ready
#kubectl taint nodes --all node-role.kubernetes.io/control-plane
#untaint
kubectl taint nodes --all node.kubernetes.io/not-ready-
kubectl taint nodes --all node-role.kubernetes.io/control-plane-

#sudo snap install google-cloud-cli  # version 444.0.0, or
#sudo snap install google-cloud-sdk  # version 444.0.0

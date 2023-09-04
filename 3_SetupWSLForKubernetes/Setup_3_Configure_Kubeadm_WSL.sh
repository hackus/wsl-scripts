#https://github.com/kubernetes/kubeadm/issues/610

#disable swap
sudo swapoff -a

sudo kubeadm reset
#echo 'Environment="KUBELET_EXTRA_ARGS=--fail-swap-on=false"' >> /etc/systemd/system/kubelet.service.d/10-kubeadm.conf

sudo systemctl daemon-reload
sudo systemctl restart kubelet

sudo cp /etc/containerd/config.toml /etc/containerd/config.toml_backup
sudo rm /etc/containerd/config.toml
sudo systemctl restart containerd
sudo kubeadm init
#sudo kubeadm init --ignore-preflight-errors Swap
#kubeadm init --config kubeadm-config_not_needed.yaml

nohup wsl > file1 2>&1 &

folder=~./kube
filename=$folder/config

mkdir -p ~/.kube

if [ -f $filename ]; then
  echo filename already exists
else
  sudo cp /etc/kubernetes/admin.conf ~/.kube/config
fi

#mkdir -p $HOME/.kube
#sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config

sudo chown $(id -u):$(id -g) ~/.kube/config
sudo export KUBECONFIG=/etc/kubernetes/admin.conf

#fixing network issues
kubectl apply -f https://github.com/weaveworks/weave/releases/download/v2.8.1/weave-daemonset-k8s.yaml



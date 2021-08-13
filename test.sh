#!/bin/sh
sudo apt install net-tools
sudo apt -y install curl apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt update
sudo apt install -y curl gnupg2 software-properties-common apt-transport-https ca-certificates
sudo apt-get install docker.io -y
sudo apt -y install vim git curl wget kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab
sudo swapoff -a
sudo sysctl --system
sudo modprobe overlay
sudo modprobe br_netfilter
sudo tee /etc/sysctl.d/kubernetes.conf<<EOF
         net.bridge.bridge-nf-call-ip6tables = 1
         net.bridge.bridge-nf-call-iptables = 1
         net.ipv4.ip_forward = 1
         EOF
sudo systemctl daemon-reload
sudo systemctl restart docker
sudo systemctl enable docker
sudo systemctl enable kubelet




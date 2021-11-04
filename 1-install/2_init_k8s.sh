#! /bin/bash
#  Description: 注意这个只在master上面执行

# 这几条环境变量的命令需要手动执行
# export MASTER_IP=192.168.66.145
# export APISERVER_NAME=k8s.master
# export POD_SUBNET=172.18.0.1/16
# echo "${MASTER_IP}        ${APISERVER_NAME}" >> /etc/hosts

rm -f kubeadm-config.yaml
cat <<EOF >./kubeadm-config.yaml 
apiVersion: kubeadm.k8s.io/v1beta2 
kind: ClusterConfiguration 
kubernetesVersion: v1.18.2 
imageRepository: registry.cn-hangzhou.aliyuncs.com/google_containers 
controlPlaneEndpoint: "${APISERVER_NAME}:6443" 
networking:   
  serviceSubnet: "10.96.0.0/16"   
  podSubnet: "${POD_SUBNET}"   
  dnsDomain: "cluster.local" 
EOF

kubeadm init --config=kubeadm-config.yaml --upload-certs

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

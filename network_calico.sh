#! /bin/bash
#  Description: 安装网络插件calico，实现和node节点网络互通，这个只需要在master上面安装

rm -f calico-3.13.1.yaml
wget https://kuboard.cn/install-script/calico/calico-3.13.1.yaml 
kubectl apply -f calico-3.13.1.yaml

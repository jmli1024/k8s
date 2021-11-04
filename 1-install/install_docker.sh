#! /bin/bash

install_docker() {
    echo "Starting to install docker-ce"
    yum install -y yum-utils device-mapper-persistent-data lvm2
    yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
    yum -y install https://mirrors.aliyun.com/docker-ce/linux/centos/7/x86_64/stable/Packages/containerd.io-1.2.13-3.1.el7.x86_64.rpm
    yum install -y docker-ce-19.03.8 docker-ce-cli-19.03.8
    systemctl enable docker.service && systemctl restart docker.service
    docker version
}

install_docker

#! /bin/bash
#  Description: 调用环境脚本，安装k8s服务

clear &&  echo -e "\033[33m 开始部署环境 \033[0m"
sleep 1
echo -e "\033[33m 开始部署Docker环境 \033[0m"
sleep 1
sh install_docker.sh
clear && echo -e "\033[33m 开始部署Docker-compose环境 \033[0m"
sh install_docker-compose.sh
sleep 1
clear && echo -e "\033[33m 开始部署kubernetes服务 \033[0m"
sh install_k8s.sh

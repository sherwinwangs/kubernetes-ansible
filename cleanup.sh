#!/bin/bash
systemctl stop kubelet
docker ps -a |awk '{print $1}'|xargs docker stop
docker ps -a |awk '{print $1}'|xargs docker rm
rm -rf /data/nexus
docker images|grep 192.168|awk '{print $1":"$2}'|xargs docker rmi
systemctl stop docker

rm -rf /var/lib/etcd /etc/kubernetes /opt/kubernetes-ansible/.cluster
rm -rf /etc/cni /etc/docker

# 生成一键安装脚本
# for i in `ls 0{1,2,3,4,5,6}*`;do cat $i >>90_install.yml;echo -e " >> 90_install.yml;done
#for i in `ls 0{1,2,3,4,5,6}*`;do cat $i >>90_install.yml;done

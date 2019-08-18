#!/bin/bash

images=(
    registry.aliyuncs.com/google_containers/pause:3.1
    registry.aliyuncs.com/google_containers/etcd:3.3.10
    registry.aliyuncs.com/google_containers/kube-apiserver:v1.15.1
    registry.aliyuncs.com/google_containers/kube-controller-manager:v1.15.1
    registry.aliyuncs.com/google_containers/kube-scheduler:v1.15.1
    registry.aliyuncs.com/google_containers/kube-proxy:v1.15.1
    registry.aliyuncs.com/google_containers/coredns:1.5.0
    quay-mirror.qiniu.com/coreos/flannel:v0.11.0-amd64
    quay-mirror.qiniu.com/kubernetes-ingress-controller/nginx-ingress-controller:0.25.0
    googlecontainer/defaultbackend-amd64:1.5
    sonatype/nexus3
)

for imageName in ${images[@]} ; do
    docker pull ${MY_REGISTRY}/$imageName
done


#calico needed
#calico/cni:v3.8.2
#calico/pod2daemon-flexvol:v3.8.2
#calico/node:v3.8.2
#calico/kube-controllers:v3.8.2
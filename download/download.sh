#!/bin/bash
KUBERNETES_VERSION=v1.15.1
ETCD_VERSION=v3.3.10
DOCKER_VERSION=18.09.8
CFSSL_VERSION=R1.2

# cfssl
https://pkg.cfssl.org/${CFSSL_VERSION}/cfssl_linux-amd64
https://pkg.cfssl.org/${CFSSL_VERSION}/cfssljson_linux-amd64
https://pkg.cfssl.org/${CFSSL_VERSION}/cfssl-certinfo_linux-amd64

# k8s-binary
https://dl.k8s.io/${KUBERNETES_VERSION}/kubernetes-server-linux-amd64.tar.gz

# etcd
https://github.com/coreos/etcd/releases/download/${ETCD_VERSION}/etcd-${ETCD_VERSION}-linux-amd64.tar.gz
https://storage.googleapis.com/etcd/${ETCD_VERSION}/etcd-${ETCD_VERSION}-linux-amd64.tar.gz


# docker
https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz

cni: https://github.com/containernetworking/plugins/releases

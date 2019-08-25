# Description
This project is used to setup kubernetes and ci/cd toolchain automatically via ansible-playbook.

## Dependence
- ansible==2.8.3

## playbook workflow
1. chrony
   1. Synchronization time (All components communicate using SSL,so asynchronization of time may result in invalid certificates )
2. Certficates
   1. Generate certificate on ansible controller,include ca,etcd, kube_proxy,kubeconfig
3. Prepare
   1. os_init:  remove redundant packages and install required packages
   2. Common init: disable swap, load kernel module, and modify kernel parameters
   3. Distributation files, include binary files and certification
4. nexus
   1. install nexus and init nexus via grovvy script, include create blob,create repo,change admin password.
   2. pull images from @images.json to nexus local
   3. Retag images and push to nexus use the nexus admin password defined in inventory files
5. Etcd
   1. install docker
   2. install kubelet
   3. install etcd
6. Kube_master
   1. install docker when not installed
   2. install kubelet when not installed
   3. install kube_master(kube-apiserver,kube-controller-manager,kube-scheduler)
   4. install kube-proxy
7. Kube_node
   1. install kubelet when not installed
8. network plugins
   1. flannel, depends on the var set in inventory CLUSTER_NETWORK 
   2. calico , depends on the var set in inventory CLUSTER_NETWORK 
9. Install addons 
   1. Coredns
   2. ingress-nginx
   3. demoapp
## Usage
2. Prepare some VMs depends on the inventory files, change the root password for ssh login.
2. download necessary dependence binary file and put it into ${base_dir}/bin dir detail file tree as download/binary_filelist.txt,current can be download from official sites or baidupan sharedfile links: https://pan.baidu.com/s/1UhGugwOeh1mp1mJBNScoQA password:3ka4
3. change inventory/k8s.dev before you run ansible-playbook
4. run command ansible-playbook -i inventory/k8s.dev --extra-vars "@images.json" 90_install.yml, after few min the kubernetes is finnish setup

##  todo list
1. nexus
   1. [ok]setup a nexus and init by groovy scripts automation. 
   2. [ok]download image and push used image to repo
   3. create a a proxy registry,a private registry listen port 9001, and a group listen port 9002 add member proxy and private to this group.
   4. add nginx loadbalace in front of nexus,forward get request to port 9002 and put request to port 9001
2. Enhancement
   1. multi-version support
   2. helm support
   3. more addon support, eg prometheus,grafana,efk,argocd,istio
   4. [ok]put some of service config to configmap: kube-proxy
   5. after installation, check per service status
   6. [ok] 更改daemonset的pod更新策略，默认是ondelete，查看方法：kubectl get ds/nginx-ingress-controller -n ingress-nginx -o go-template='{{.spec.updateStrategy.type}}{{"\n"}}'
   7. Check the service before deploying it, and if the check is installed, skip it.
3. Accessibility
   1. download binary file and put file to dir by script
   2. [ok] Packing the entire environment for Dockerfile improves script portability and compatibility
   3. create a Vargrantfile to build a development easily.
4. bug to fix
   1. [ok] When the yum module fails to install the package when the network is bad, the play and task will not continue to execute. Solution: Add the number of retries
   2. There are some problems in detecting kube-proxy, flannel, ingress and other start-up modes. At present, the detection service on the first master is detected, and kubectl is not deployed on node node
   3. If the first step time is not synchronized, the certificate will be invalid
5. notice
   1. If the service's IP access is not available, but the pod's IP access is available, please note that the service selector is correctly written.
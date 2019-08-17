# Description
This project is used to setup kubernetes and ci/cd toolchain automatically via ansible-playbook.

## Dependence
- ansible==2.8.3

## Usage
1. download used docker image mannually by script download/docker_image.sh
2. download necessary dependence binary file and put it into ${base_dir}/bin dir detail file tree as download/binary_filelist.txt,current can be download from official sites or baidupan sharedfile links: https://pan.baidu.com/s/1UhGugwOeh1mp1mJBNScoQA password:3ka4
3. change inventory/k8s.dev before you run ansible-playbook
4. run command ansible-playbook -i inventory/k8s.dev 99_install.yml, after few min the kubernetes is finnish setup

##  todo list
1. [ok]setup a nexus and init by groovy scripts automation. 
2. [ok]download image and push used image to repo
3. after installation, check per service status
4. [ok]put some of service config to configmap: kube-proxy
5. download binary file and put file to dir by script
6. multi-version support
7. helm support
8. more addon support, eg prometheus,grafana,efk,argocd,istio
9. add install ansible script
10. create a a proxy registry,a private registry listen port 9001, and a group listen port 9002 add member proxy and private to this group.
11. add nginx loadbalace in front of nexus,forward get request to port 9002 and put request to port 9001
12. [ok]set docker registry password for every node
13. [ok]kube_node 中的 kubelet 和kube-proxy拆分开，避免无法组织playbook的执行顺序
14. [ok]ssl证书和kubeconfig文件统一在admin节点上创建
15. [ok] 更改daemonset的pod更新策略，默认是ondelete，查看方法：kubectl get ds/nginx-ingress-controller -n ingress-nginx -o go-template='{{.spec.updateStrategy.type}}{{"\n"}}'
16. [ok]打包整个环境为Dockerfile提高脚本的可移植性和兼容性
17. [ok]yum模块在网络不好时安装软件包失败之后，后面的play和task不会继续执行，这是个bug,解决方法，目前使用package模块，暂时没有发现问题
18. 检测kube-proxy和flannel,ingress等启动的检测方式有问题，目前检测第一个master上检测服务，node节点上没有部署kubectl
19. 当etcd节点是kube_node的节点的话，kube_node这一步需要跳过
20. 如果service的ip访问不通，但是pod的ip能访问通，请注意service的selector是否写的正确
21. 第一步时间如果不同步，后面生成的证书就会有问题，这个问题暂时没解决，急需要解决
22. init ansible controller machine script
23. 部署服务之前对服务进行检查，如果检查已经安装，那么跳过。

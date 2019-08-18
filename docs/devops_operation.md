# devops维护常用
- kubectl label nodes <node-name> <label-key>=<label-value>  给node打标签，如果是修改需要加--overwrite
- kubectl label nodes <node-name> <label-key>- 删除node资源的标签
- kubectl explain pod.spec.nodeSelector 查看如何使用nodeSelector去使用标签

-  kubectl explain pod.metadata.labels  查看某个资源的定义方式，例如labels
- kubectl label --overwrite pods foo status=unhealthy 添加并覆盖pod名称为foo的status标签
- kubectl label pods foo bar- 删除标签可以用-号

### kubeadm 安装过程中需要参考的点

```
preflight:
[WARNING IsDockerSystemdCheck]: detected "cgroupfs" as the Docker cgroup driver. The recommended driver is "systemd". Please follow the guide at https://kubernetes.io/docs/setup/cri/


[mark-control-plane] Marking the node kubernetes-master-01 as control-plane by adding the label "node-role.kubernetes.io/master=''"
[mark-control-plane] Marking the node kubernetes-master-01 as control-plane by adding the taints [node-role.kubernetes.io/master:NoSchedule]#PreferNoSchedule,NoExecute

#去掉label
kubectl label node node1 node-role.kubernetes.io/master-

#去掉污点
kubectl taint nodes <node-name> node-role.kubernetes.io/master:NoSchedule- 

  mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config

You should now deploy a pod network to the cluster.
Run "kubectl apply -f [podnetwork].yaml" with one of the options listed at:
  https://kubernetes.io/docs/concepts/cluster-administration/addons/

calico cni插件地址:https://github.com/projectcalico/cni-plugin/tags
https://docs.projectcalico.org/v3.8/getting-started/kubernetes/installation/integration#installing-the-calico-cni-plugins

```
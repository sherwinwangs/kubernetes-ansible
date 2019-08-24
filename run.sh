docker run -d --name="ansible_k8s" -v "$(PWD)/bin:/opt/kubernetes-ansible/bin:ro" sherwinwangs/kubernetes-ansible:0.1 tail -f /dev/null

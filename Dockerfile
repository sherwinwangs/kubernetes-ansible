FROM python:3.7.4-slim
MAINTAINER Sherwin Wang <sherwinwangs@hotmail.com>

WORKDIR /opt/kubernetes-ansible

COPY ./requirements /tmp/requirements
COPY ./ /opt/kubernetes-ansible

RUN echo "===> Installing required rpm packages..."         && \
    apt-get update -y  &&  apt-get install --fix-missing    && \
    DEBIAN_FRONTEND=noninteractive           \
    cd /tmp/requirements                                    && \
    apt-get install -y $(cat deb_requirements.txt)          && \
    \
    \
    echo "===> Installing required python modules..."                                    && \
    pip install -i https://mirrors.aliyun.com/pypi/simple/ --upgrade pip setuptools      && \
    pip install -i https://mirrors.aliyun.com/pypi/simple/ -r requirements.txt || pip install -r requirements.txt && \
    \
    \
    echo "===> Removing unused APT resources..."                  && \
    apt-get clean                                                 && \
    rm -rf /var/lib/apt/lists/*  /tmp/*                           && \
    \
    \
    echo "===> Adding hosts for convenience..."        && \
    mkdir -p /etc/ansible                              && \
    echo 'localhost' > /etc/ansible/hosts
# default command: display Ansible version
CMD [ "ansible-playbook", "--version" ]
#!/bin/bash

if [ $(id -u) != "0" ]; then
    echo "Error: You must be root to run this script, please use root to initialization OS."
    exit 1
fi


system_update(){
    yum -y update
    yum -y install chrony net-tools bridge-utils bind-utils vim wget curl openssh-clients sysstat lsof telnet tree dos2unix git
}


selinux_config(){
    setenforce 0
    sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
}

timezone_config(){
    timedatectl set-local-rtc 0 && timedatectl set-timezone Asia/Shanghai
    systemctl enable chronyd && systemctl start chronyd
}

# ulimit comfig
ulimit_config(){
cat > /etc/security/limits.conf << EOF
#<domain>      <type>  <item>         <value>
*           soft   nofile       102400
*           hard   nofile       102400
*           soft   nproc        102400
*           hard   nproc        102400
EOF
}

sshd_config(){
    sed -i 's/^GSSAPIAuthentication yes$/GSSAPIAuthentication no/' /etc/ssh/sshd_config
    sed -i 's/#UseDNS yes/UseDNS no/' /etc/ssh/sshd_config
    systemctl restart sshd
}


remove_useless_package(){
    yum -y remove NetworkManager firewalld python-firewall
}

disable_ipv6() {
   # /etc/default/grub
   #GRUB_CMDLINE_LINUX="ipv6.disable=1 net.ifnames=0 biosdevname=0 rhgb quiet"
   echo "disable ipv6 and rename nic manaully"
}

clean_up(){
    rm -f /etc/ssh/*key*
    yum -y clean all
    cat /dev/null > /var/log/tallylog
    cat /dev/null > /var/log/grubby_prune_debug
    cat /dev/null > /var/log/lastlog
    cat /dev/null > /var/log/btmp
    cat /dev/null > /var/log/wtmp
    cat /dev/null > /var/log/tuned/tuned.log
    cat /dev/null > /var/log/audit/audit.log
    cat /dev/null > /var/log/messages
    cat /dev/null > /var/log/secure
    cat /dev/null > /var/log/maillog
    cat /dev/null > /var/log/spooler
    cat /dev/null > /var/log/boot.log
    cat /dev/null > /var/log/cron
    cat /dev/null > /var/log/yum.log
    cat /dev/null > /var/log/grubby
    cat /dev/null > /var/log/dmesg
    rm -rf /var/log/anaconda/* /var/log/dmesg.* /var/log/firewalld*
    history -c
    unset HISTFILE
    #rpm -e kernel-3.10.0-957.el7.x86_64
}


#main function
main(){
    system_update
    selinux_config
    timezone_config
    ulimit_config
    sshd_config
    remove_useless_package
    disable_ipv6
    clean_up
}

# execute main functions
main

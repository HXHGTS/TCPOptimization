#!/bin/sh

echo "正在移除旧内核. . ."

yum remove -y $(rpm -qa | grep kernel | grep -v $(uname -r))

echo "正在优化大文件读写性能. . ."

sed -e '* soft nofile/d;* hard nofile/d' /etc/security/limits.conf

echo "* soft nofile 65535" > /etc/security/limits.conf

echo "* hard nofile 65535" >> /etc/security/limits.conf

echo "正在开启Google BBR. . ."

sed -e 'net.core.default_qdisc = /d;net.ipv4.tcp_congestion_control = /d' /etc/sysctl.conf

echo "net.core.default_qdisc = fq" >> /etc/sysctl.conf
    
echo "net.ipv4.tcp_congestion_control = bbr" >> /etc/sysctl.conf

sysctl -p

sed -e 'ulimit -n/d;ulimit -u/d' /etc/rc.d/rc.local

echo "ulimit -n 65535" >> /etc/rc.d/rc.local

echo "ulimit -u 65535" >> /etc/rc.d/rc.local
    
chmod +x /etc/rc.d/rc.local

echo "优化完成!"


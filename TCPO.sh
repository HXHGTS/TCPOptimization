#!/bin/sh

echo "正在移除旧内核. . ."

yum remove -y $(rpm -qa | grep kernel | grep -v $(uname -r))

echo "正在优化大文件读写性能. . ."

echo "* soft nofile 100001" > /etc/security/limits.conf

echo "* hard nofile 100002" >> /etc/security/limits.conf

echo "root soft nofile 100001" >> /etc/security/limits.conf

echo "root hard nofile 100002" >> /etc/security/limits.conf

echo "* soft memlock unlimited" >> /etc/security/limits.conf

echo "* hard memlock unlimited" >> /etc/security/limits.conf

echo "正在开启Google BBR. . ."

sysctl -w net.core.default_qdisc=fq

sysctl -w net.ipv4.tcp_congestion_control=bbr

sysctl -p

sed -i '/ulimit/d' /etc/rc.d/rc.local

echo "ulimit -n 100001" >> /etc/rc.d/rc.local

echo "ulimit -u 100001" >> /etc/rc.d/rc.local
    
chmod +x /etc/rc.d/rc.local

echo "优化完成!"


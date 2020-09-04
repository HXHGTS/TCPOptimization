#!/bin/sh

echo "正在移除旧内核. . ."

yum remove -y $(rpm -qa | grep kernel | grep -v $(uname -r))

echo "正在优化大文件读写性能. . ."

rm -rf /etc/security/limits.conf

echo "* soft nofile 100001" > /etc/security/limits.conf

echo "* hard nofile 100002" >> /etc/security/limits.conf

echo "root soft nofile 100001" >> /etc/security/limits.conf

echo "root hard nofile 100002" >> /etc/security/limits.conf

echo "* soft memlock unlimited" >> /etc/security/limits.conf

echo "* hard memlock unlimited" >> /etc/security/limits.conf

echo "正在开启Google BBR. . ."

rm -rf /etc/sysctl.conf

sed -e '/net.core.default_qdisc/d;/net.ipv4.tcp_congestion_control/d' /etc/sysctl.conf > /etc/sysctl.conf.temp

cp -rf /etc/sysctl.conf.temp /etc/sysctl.conf

rm -rf /etc/sysctl.conf.temp

echo "net.core.default_qdisc = fq" >> /etc/sysctl.conf

echo "net.ipv4.tcp_congestion_control = bbr" >> /etc/sysctl.conf

sysctl -p

sed -e '/ulimit/d' /etc/rc.d/rc.local > /etc/rc.d/rc.local.temp

cp -rf /etc/rc.d/rc.local.temp /etc/rc.d/rc.local

rm -rf /etc/rc.d/rc.local.temp

echo "ulimit -n 100001" >> /etc/rc.d/rc.local

echo "ulimit -u 100001" >> /etc/rc.d/rc.local
    
chmod +x /etc/rc.d/rc.local

echo "优化完成!"


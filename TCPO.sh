#!/bin/sh

echo "正在移除旧内核. . ."

yum remove -y $(rpm -qa | grep kernel | grep -v $(uname -r))

echo "正在优化大文件读写性能. . ."

echo. > /etc/security/limits.conf

echo "* soft nofile 512000" > /etc/security/limits.conf

echo "* hard nofile 1024000" >> /etc/security/limits.conf

echo "root soft nofile 512000" >> /etc/security/limits.conf

echo "root hard nofile 1024000" >> /etc/security/limits.conf

echo "* soft memlock unlimited" >> /etc/security/limits.conf

echo "* hard memlock unlimited" >> /etc/security/limits.conf

echo "正在开启Google BBR. . ."

echo. > /etc/sysctl.conf

echo 'net.core.default_qdisc=fq' >> /etc/sysctl.conf

echo 'net.ipv4.tcp_congestion_control=bbr' >> /etc/sysctl.conf

echo 'fs.file-max=1024000' >> /etc/sysctl.conf

echo 'net.core.rmem_max=67108864' >> /etc/sysctl.conf

echo 'net.core.wmem_max=67108864' >> /etc/sysctl.conf

echo 'net.core.rmem_default=65536' >> /etc/sysctl.conf

echo 'net.core.wmem_default=65536' >> /etc/sysctl.conf

echo 'net.core.netdev_max_backlog=4096' >> /etc/sysctl.conf

echo 'net.core.somaxconn=4096' >> /etc/sysctl.conf

sysctl -p

echo. > /etc/rc.d/rc.local

echo "ulimit -n 512000" >> /etc/rc.d/rc.local

echo "ulimit -u 512000" >> /etc/rc.d/rc.local
    
chmod +x /etc/rc.d/rc.local

echo "优化完成!"


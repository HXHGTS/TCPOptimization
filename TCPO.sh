#!/bin/sh

echo "正在移除旧内核. . ."

yum remove -y $(rpm -qa | grep kernel | grep -v $(uname -r))

echo "正在优化大文件读写性能. . ."

echo "root hard nofile 65535" > /etc/security/limits.conf

echo "* soft nofile 65535" >> /etc/security/limits.conf

echo "* hard nofile 65535" >> /etc/security/limits.conf

echo "root soft nofile 65535" >> /etc/security/limits.conf

echo "root hard nofile 65535" >> /etc/security/limits.conf

echo "* soft memlock unlimited" >> /etc/security/limits.conf

echo "* hard memlock unlimited" >> /etc/security/limits.conf

echo "正在开启Google BBR. . ."

echo 'net.core.default_qdisc=fq' > /etc/sysctl.conf

echo 'net.ipv4.tcp_congestion_control=bbr' >> /etc/sysctl.conf

echo "正在优化文件io性能. . ."

echo 'fs.file-max = 2097152' >> /etc/sysctl.conf

echo 'vm.swappiness = 30' >> /etc/sysctl.conf

echo 'vm.dirty_background_ratio = 50' >> /etc/sysctl.conf

echo 'vm.dirty_ratio = 80' >> /etc/sysctl.conf

echo 'vm.overcommit_memory = 1' >> /etc/sysctl.conf

echo 'vm.max_map_count = 262144' >> /etc/sysctl.conf

echo 'kernel.sysrq = 0' >> /etc/sysctl.conf

echo 'kernel.core_uses_pid = 1' >> /etc/sysctl.conf

echo 'kernel.msgmax = 65536' >> /etc/sysctl.conf

echo 'kernel.msgmnb = 163840' >> /etc/sysctl.conf

echo 'net.ipv4.tcp_no_metrics_save = 1' >> /etc/sysctl.conf

echo 'net.ipv4.tcp_syncookies = 1' >> /etc/sysctl.conf

echo 'net.ipv4.tcp_max_tw_buckets = 50000' >> /etc/sysctl.conf

echo 'net.ipv4.tcp_sack = 1' >> /etc/sysctl.conf

echo 'net.ipv4.tcp_window_scaling = 1' >> /etc/sysctl.conf

echo 'net.ipv4.tcp_mem = 3145728' >> /etc/sysctl.conf

echo 'net.ipv4.tcp_rmem = 16777216' >> /etc/sysctl.conf

echo 'net.ipv4.tcp_wmem = 16777216' >> /etc/sysctl.conf

echo 'net.ipv4.tcp_max_orphans = 65535

echo 'net.ipv4.tcp_max_syn_backlog = 65535

echo 'net.ipv4.tcp_timestamps = 0' >> /etc/sysctl.conf

echo 'net.ipv4.tcp_synack_retries = 1' >> /etc/sysctl.conf

echo 'net.ipv4.tcp_syn_retries = 1' >> /etc/sysctl.conf

echo 'net.ipv4.tcp_tw_recycle = 1' >> /etc/sysctl.conf

echo 'net.ipv4.tcp_tw_reuse = 1' >> /etc/sysctl.conf

echo 'net.ipv4.tcp_fin_timeout = 5' >> /etc/sysctl.conf

echo 'net.ipv4.tcp_keepalive_time = 30' >> /etc/sysctl.conf

echo 'net.ipv4.ip_local_port_range = 1024 65535' >> /etc/sysctl.conf

echo 'net.core.wmem_default = 8388608' >> /etc/sysctl.conf

echo 'net.core.rmem_default = 8388608' >> /etc/sysctl.conf

echo 'net.core.rmem_max = 16777216' >> /etc/sysctl.conf

echo 'net.core.wmem_max = 16777216' >> /etc/sysctl.conf

echo 'net.core.netdev_max_backlog = 65535' >> /etc/sysctl.conf

echo 'net.core.somaxconn = 65535' >> /etc/sysctl.conf

sysctl -p

echo > /etc/rc.d/rc.local
    
chmod +x /etc/rc.d/rc.local

echo "优化完成!"


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

echo "net.ipv4.ip_forward = 1" > /etc/sysctl.conf

echo "net.ipv6.conf.all.forwarding = 1" >> /etc/sysctl.conf

echo "net.ipv6.conf.default.forwarding = 1" >> /etc/sysctl.conf

echo "net.ipv4.conf.default.rp_filter = 1" >> /etc/sysctl.conf

echo "net.ipv4.conf.default.accept_source_route = 0" >> /etc/sysctl.conf

echo "kernel.core_uses_pid = 1" >> /etc/sysctl.conf

echo "net.ipv4.tcp_syncookies = 1" >> /etc/sysctl.conf

echo "kernel.msgmnb = 65536" >> /etc/sysctl.conf

echo "kernel.msgmax = 65536" >> /etc/sysctl.conf

echo "net.ipv4.conf.all.promote_secondaries = 1" >> /etc/sysctl.conf

echo "net.ipv4.conf.default.promote_secondaries = 1" >> /etc/sysctl.conf

echo "net.ipv6.neigh.default.gc_thresh3 = 4096" >> /etc/sysctl.conf

echo "net.ipv4.neigh.default.gc_thresh3 = 4096" >> /etc/sysctl.conf

echo "kernel.softlockup_panic = 1" >> /etc/sysctl.conf

echo "kernel.sysrq = 1" >> /etc/sysctl.conf

echo "net.ipv6.conf.all.disable_ipv6 = 0" >> /etc/sysctl.conf

echo "net.ipv6.conf.default.disable_ipv6 = 0" >> /etc/sysctl.conf

echo "net.ipv6.conf.lo.disable_ipv6 = 0" >> /etc/sysctl.conf

echo "kernel.numa_balancing = 0" >> /etc/sysctl.conf

echo "kernel.shmmax = 68719476736" >> /etc/sysctl.conf

echo "kernel.printk = 5" >> /etc/sysctl.conf

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


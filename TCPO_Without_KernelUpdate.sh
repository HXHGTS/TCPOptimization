#!/bin/sh

clear

echo "正在将BBR写入内核. . ."

modprobe tcp_bbr

echo "tcp_bbr" | sudo tee -a /etc/modules-load.d/modules.conf

echo "正在优化大文件读写性能. . ."

curl https://cdn.jsdelivr.net/gh/HXHGTS/TCPOptimization/limits.conf > /etc/security/limits.conf

echo "正在开启Google BBR. . ."

curl https://cdn.jsdelivr.net/gh/HXHGTS/TCPOptimization/sysctl.conf > /etc/sysctl.conf

sysctl -p

echo "优化完成!"

echo --------------安装结果----------------

sysctl net.ipv4.tcp_congestion_control

echo --------------------------------------

exit 0

#!/bin/sh

echo "正在卸载系统软件. . ."

echo ---------------------------------------

dpkg -l | grep linux-image | awk '{print$2}'

echo ---------------------------------------

echo "多余内核请使用 apt remove -y --purge 命令卸载!"

apt-get autoremove -y

apt install -y build-essential net-tools iproute2

echo "正在优化大文件读写性能. . ."

curl https://cdn.jsdelivr.net/gh/HXHGTS/TCPOptimization/limits.conf > /etc/security/limits.conf

echo "正在开启Google BBR. . ."

curl https://cdn.jsdelivr.net/gh/HXHGTS/TCPOptimization/sysctl.conf > /etc/sysctl.conf

sysctl -p

echo "优化完成!"

exit 0

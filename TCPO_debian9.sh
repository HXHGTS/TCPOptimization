#!/bin/sh

echo "正在优化大文件读写性能. . ."

curl https://cdn.jsdelivr.net/gh/HXHGTS/TCPOptimization/limits.conf > /etc/security/limits.conf

echo "正在开启Google BBR. . ."

curl https://cdn.jsdelivr.net/gh/HXHGTS/TCPOptimization/sysctl.conf > /etc/sysctl.conf

sysctl -p

echo "正在升级系统软件. . ."

apt update -y

apt install -y build-essential

apt -t stretch-backports install linux-image-cloud-amd64

apt -t stretch-backports install linux-headers-cloud-amd64

update-grub

echo "优化完成!"

exit 0

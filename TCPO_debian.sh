#!/bin/sh

echo "正在移除旧内核. . ."

apt install byobu -y

purge-old-kernels --keep 1

echo "正在校准时间. . ."

yum install -y ntpdate

ntpdate -u time.windows.com

echo "正在优化大文件读写性能. . ."

curl https://cdn.jsdelivr.net/gh/HXHGTS/TCPOptimization/limits.conf > /etc/security/limits.conf

echo "正在开启Google BBR. . ."

curl https://cdn.jsdelivr.net/gh/HXHGTS/TCPOptimization/sysctl.conf > /etc/sysctl.conf

sysctl -p

echo "优化完成!"

exit 0

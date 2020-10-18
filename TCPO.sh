#!/bin/sh

echo "正在移除旧内核. . ."

yum remove -y $(rpm -qa | grep kernel | grep -v $(uname -r))

echo "正在优化大文件读写性能. . ."

curl https://raw.githubusercontent.com/HXHGTS/TCPOptimization/master/limits.conf > /etc/security/limits.conf

echo "正在开启Google BBR. . ."

echo "正在优化文件io性能. . ."

curl https://raw.githubusercontent.com/HXHGTS/TCPOptimization/master/sysctl.conf > /etc/sysctl.conf

sysctl -p

yum install gcc -y

echo "优化完成!"


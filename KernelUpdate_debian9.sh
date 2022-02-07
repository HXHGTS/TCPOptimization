#!/bin/sh

echo 正在升级内核. . .

echo "deb http://deb.debian.org/debian stretch-backports-sloppy main" >> /etc/apt/sources.list.d/backports.list

apt -t stretch-backports install linux-image-cloud-amd64 -y

apt -t stretch-backports install linux-headers-cloud-amd64 -y

update-grub

echo 脚本执行完成,正在重启服务器. . .

reboot

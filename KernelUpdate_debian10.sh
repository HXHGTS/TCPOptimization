#!/bin/sh

echo 正在升级内核. . .

echo "deb http://deb.debian.org/debian buster-backports main" >> /etc/apt/sources.list.d/backports.list

apt-get update -y

apt-get upgrade -y

apt-get dist-upgrade -y

echo "正在升级系统软件. . ."

apt install -y build-essential

apt -t buster-backports install linux-image-cloud-amd64 -y

apt -t buster-backports install linux-headers-cloud-amd64 -y

update-grub

echo 脚本执行完成,正在重启服务器. . .

reboot



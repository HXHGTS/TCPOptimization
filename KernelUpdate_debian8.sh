#!/bin/sh

clear

echo "开始安装升级必需工具. . ."

echo "deb http://deb.debian.org/debian jessie-backports main" > /etc/apt/sources.list.d/backports.list

apt update 

apt full-upgrade -y

apt install lsb-release

echo "正在导入核心安装源. . ."

apt update

echo "正在安装新内核. . ."

apt search linux-image

apt install -t $(lsb_release -sc)-backports linux-image-$(dpkg --print-architecture) linux-headers-$(dpkg --print-architecture) --install-recommends -y

echo "正在将新内核写入开机引导. . ."

update-grub

echo "正在重启以应用设置. . ."

reboot

exit 0

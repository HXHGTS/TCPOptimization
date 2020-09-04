#!/bin/sh

clear

echo "开始安装升级必需工具. . ."

yum -y install epel-release

sed -i "0,/enabled=0/s//enabled=1/" /etc/yum.repos.d/epel.repo

rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org

rpm -Uvh https://www.elrepo.org/elrepo-release-7.el7.elrepo.noarch.rpm

yum --disablerepo="*" --enablerepo="elrepo-kernel" list available

echo "正在移除有冲突的旧内核. . ."

yum remove kernel-devel kernel-headers -y

echo "正在安装新内核. . ."

yum --enablerepo=elrepo-kernel install kernel-ml kernel-ml-devel kernel-ml-headers -y

echo "正在将新内核写入开机引导. . ."

sed -i "s/GRUB_DEFAULT=saved/GRUB_DEFAULT=0/" /etc/default/grub

grub2-mkconfig -o /boot/grub2/grub.cfg

echo "正在重启以应用设置. . ."

echo "正在重启. . ."

reboot

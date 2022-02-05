#!/bin/sh

clear

echo "开始安装升级必需工具. . ."

echo > /root/KernelUpdate.sh

yum -y install yum-cron epel-release

sed -i "0,/enabled=0/s//enabled=1/" /etc/yum.repos.d/epel.repo

echo "正在导入核心安装源. . ."

rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org

rpm -Uvh https://www.elrepo.org/elrepo-release-8.el8.elrepo.noarch.rpm

yum --disablerepo="*" --enablerepo="elrepo-kernel" list available

echo "正在移除有冲突的旧内核. . ."

yum remove kernel-devel kernel-headers kernel-tools kernel-doc kernel-tools-libs kernel-tools-libs-devel -y

echo "正在安装新内核. . ."

yum --enablerepo=elrepo-kernel install kernel-ml kernel-ml-devel kernel-ml-headers kernel-ml-tools kernel-ml-tools-libs kernel-ml-tools-libs-devel -y

echo "正在将新内核写入开机引导. . ."

grub2-set-default 0

grub2-mkconfig -o /boot/grub2/grub.cfg

echo "正在重启以应用设置. . ."

reboot

exit 0

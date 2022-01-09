#!/bin/sh

echo 正在升级内核. . .

echo "deb http://deb.debian.org/debian stretch-backports main" >> /etc/apt/sources.list.d/backports.list

apt-get update -y

apt-get upgrade -y

apt-get dist-upgrade -y

echo 脚本执行完成,请手动重启服务器!

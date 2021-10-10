#!/bin/sh
echo 正在升级内核. . .
apt-get update -y
apt-get upgrade -y
apt-get dist-upgrade -y
echo 重启. . .
reboot

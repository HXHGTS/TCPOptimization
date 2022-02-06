### 不升级内核开启bbr(仅可在部分系统实现)

```
modprobe tcp_bbr
echo "tcp_bbr" | sudo tee -a /etc/modules-load.d/modules.conf
echo "net.core.default_qdisc=fq" | sudo tee -a /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" | sudo tee -a /etc/sysctl.conf
sysctl -p
sysctl net.ipv4.tcp_congestion_control
```

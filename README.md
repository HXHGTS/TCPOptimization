# TCPOptimization
优化服务器TCP性能

1.升级Linux内核(触发重启)
```
yum install wget -y && wget https://github.com/HXHGTS/TCPOptimization/raw/master/KernelUpdate.sh -O KernelUpdate.sh&& bash KernelUpdate.sh
```
2.优化性能（需要手动重启）
```
wget https://github.com/HXHGTS/TCPOptimization/raw/master/TCPO.sh -O TCPO.sh&& bash TCPO.sh
```

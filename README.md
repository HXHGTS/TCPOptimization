# TCPOptimization
优化服务器TCP性能

1.升级Linux内核(触发重启)

`yum install wget -y && wget https://github.com/HXHGTS/TCPOptimization/raw/master/KernelUpdate.sh -O KernelUpdate.sh&& bash KernelUpdate.sh`

2.优化性能（升级后内核不稳定，需要手动重启）

`wget https://github.com/HXHGTS/TCPOptimization/raw/master/TCPO.sh -O TCPO.sh&& bash TCPO.sh && rm -f KernelUpdate.sh && rm -f TCPO.sh`


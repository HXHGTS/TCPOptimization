# TCPOptimization
优化服务器TCP性能

1.升级Linux内核(触发重启)

`CentOS7:`
`yum install wget -y && wget https://github.com/HXHGTS/TCPOptimization/raw/master/KernelUpdate.sh -O KernelUpdate.sh&& chmod +x KernelUpdate.sh && sudo bash KernelUpdate.sh`

`CentOS8:`
`yum install wget -y && wget https://github.com/HXHGTS/TCPOptimization/raw/master/KernelUpdate8.sh -O KernelUpdate8.sh&& chmod +x KernelUpdate8.sh && sudo bash KernelUpdate8.sh`

2.优化性能（升级后内核不稳定，需要手动重启）

`wget https://github.com/HXHGTS/TCPOptimization/raw/master/TCPO.sh -O TCPO.sh && chmod +x TCPO.sh && sudo bash TCPO.sh && rm -f KernelUpdate.sh && rm -f TCPO.sh`


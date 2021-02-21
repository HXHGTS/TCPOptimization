# TCPOptimization
优化服务器TCP性能

1.升级Linux内核(触发重启)

`CentOS7:`
`curl -sSL https://cdn.jsdelivr.net/gh/HXHGTS/TCPOptimization/KernelUpdate.sh | sh`

`CentOS8:`
`curl -sSL https://cdn.jsdelivr.net/gh/HXHGTS/TCPOptimization/KernelUpdate8.sh | sh`

2.优化性能（升级后内核不稳定，需要手动重启）

`curl -sSL https://cdn.jsdelivr.net/gh/HXHGTS/TCPOptimization/TCPO.sh | sh`


# TCPOptimization

升级Linux Kernel，开启cake+bbr

1.升级Linux内核(触发重启)(CentOS8/Debian9/Debian10不需要)

`CentOS7:`
`curl -sSL https://cdn.jsdelivr.net/gh/HXHGTS/TCPOptimization/KernelUpdate.sh | sh`

`CentOS8:`
`curl -sSL https://cdn.jsdelivr.net/gh/HXHGTS/TCPOptimization/KernelUpdate8.sh | sh`

`Debian8/9/10:`
`curl -sSL https://cdn.jsdelivr.net/gh/HXHGTS/TCPOptimization/KernelUpdate_debian8.sh | sh`

2.优化性能（升级后内核不稳定，需要手动重启）

`CentOS7/8:`
`curl -sSL https://cdn.jsdelivr.net/gh/HXHGTS/TCPOptimization/TCPO.sh | sh`

`Debian8:`
`curl -sSL https://cdn.jsdelivr.net/gh/HXHGTS/TCPOptimization/TCPO_debian.sh | sh`

`Debian9/10:`
`curl -sSL https://cdn.jsdelivr.net/gh/HXHGTS/TCPOptimization/TCPO_debian10.sh | sh`

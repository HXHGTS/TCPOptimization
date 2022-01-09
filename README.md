# TCPOptimization

升级Linux Kernel，开启cake+bbr

1.升级Linux内核(触发重启)

`CentOS7:`
`curl -sSL https://cdn.jsdelivr.net/gh/HXHGTS/TCPOptimization/KernelUpdate.sh | sh`

`CentOS8:`
`curl -sSL https://cdn.jsdelivr.net/gh/HXHGTS/TCPOptimization/KernelUpdate8.sh | sh`

`Debian8:`
`curl -sSL https://cdn.jsdelivr.net/gh/HXHGTS/TCPOptimization/KernelUpdate_debian8.sh | sh`

`Debian9:`
`curl -sSL https://cdn.jsdelivr.net/gh/HXHGTS/TCPOptimization/KernelUpdate_debian9.sh | sh`

`Debian10:`
`curl -sSL https://cdn.jsdelivr.net/gh/HXHGTS/TCPOptimization/KernelUpdate_debian10.sh | sh`

2.优化性能

`CentOS7:`
`curl -sSL https://cdn.jsdelivr.net/gh/HXHGTS/TCPOptimization/TCPO.sh | sh`

`CentOS8:`
`curl -sSL https://cdn.jsdelivr.net/gh/HXHGTS/TCPOptimization/TCPO_centos8.sh | sh`

`Debian8:`
`curl -sSL https://cdn.jsdelivr.net/gh/HXHGTS/TCPOptimization/TCPO_debian8.sh | sh`

`Debian9:`
`curl -sSL https://cdn.jsdelivr.net/gh/HXHGTS/TCPOptimization/TCPO_debian9.sh | sh`

`Debian10:`
`curl -sSL https://cdn.jsdelivr.net/gh/HXHGTS/TCPOptimization/TCPO_debian10.sh | sh`

3.卸载旧内核(debian9以上需要此步骤,第2步完成需要手动重启)
```
apt-get autoremove -y
```

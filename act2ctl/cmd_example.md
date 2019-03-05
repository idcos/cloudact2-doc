# 命令行示例

## 登录到 act2-master 服务器

```bash
$ ssh root@${master}
```


## 添加本机的配置

下面假定服务使用的是默认的 `6868` 端口

```bash
$ cd /usr/yunji/cloud-act2/bin
$ ./act2ctl config add -s http://localhost:6868
```


## 执行脚本

通过 ssh 通道，在远程机器上执行脚本

```bash
$ cat > ~/test.sh <<EOF
#!/bin/bash

echo "$@"
EOF

$ ./act2ctl run 192.168.1.17 -t ssh -f ~/test.sh -a "hello act2" -o linux -c hangzhou
target host password: *********

[1]	192.168.1.17	16:28:49	1.05(s)		[success]
hello act2

```


## 发送文件

通过 ssh 通道，给远程服务器下发文件

```bash
$ ./act2ctl file send 192.168.1.17 ~/test.sh /tmp/test2.sh -t ssh  -u root  -c hangzhou
please enter target server password: *********

[1]	192.168.1.17	12:03:34	1.03(s)		[success]
```


发送 http 服务上的文件给远程主机

```bash
$ ./act2ctl file send 192.168.1.17 http://192.186.1.2/test.sh /tmp/test2.sh -t ssh  -u root  -c hangzhou
please enter target server password: *********

[1]	192.168.1.17	12:03:34	1.03(s)		[success]
```

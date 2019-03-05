# 任务执行

任务主要支持脚本执行和文件下发


## 命令、脚本执行

```bash
$ ./act2ctl run [options] [ip_list]
```

通过 act2 服务下发命令或者脚本到远程服务器上，并进行执行, `ip_list` 以英文逗号分割的 ip 地址列表，为远程服务器地址，可放在命令行任意位置，一般放在尾部


Options:

```
-H hostfile    指定要下发执行的远程服务器地址，与 ip_list 互斥
-t type    下发时指定通道类型，type 可以为 salt 或 puppet 或 ssh，目前支持 salt 或 ssh，默认为 salt
-f scriptfile    需要执行的脚本文件
-a arg    脚本或者命令支持的参数，多个参数需要使用单引号或双引号起来，需要注意 bash 转义
-c idc    指定 idc 名称，通道类型为 ssh 时必须指定
-u username    指定执行账户，如果未指定，在系统类型为 windows 时默认账户 Administrator，其他系统默认账户为 root
-p password    指定执行账户的密码，通常类型为 ssh 时必须指定
-P port    指定通常类型为 ssh 时的连接端口，默认为 22
-o ostype    系统类型，支持 windows|linux|aix
-s scriptType    脚本类型，支持 bash 或 bat 或 python 或 perl 或 sls，默认为 bash。如果提供了系统类型，在 Windows 下默认为 bat，其他默认为 bash
-e encoding    指定执行时编码类型，支持 gb18030 或 utf-8，如果未指定，salt 版本为 2018.3.3 时，windows 系统默认时使用 utf-8，在 salt 版本为 2018.3.3 之前，windows 系统默认使用 gb18030，其他系统默认账户为 utf-8
-C command    需要执行的命令，与 -f 互斥，最后与脚本执行是一样的
-T timeout    脚本执行的超时时间，默认为 300s
--nocolor    关闭默认输出结果的高亮输出
-ouput format    输出格式，支持 default 或 json 或 yaml，其中默认为 default，支持高亮输出，json 或 yaml 输出无高亮
-v  --verbose    输出调试信息
--async    异步处理，返回作业执行任务 id
```
 

示例：

指定 IP 地址执行命令（使用默认 salt 通道）

```bash
$ ./act2ctl run 192.168.1.217 -C 'df -h'

[1]	192.168.1.217	16:29:29	1.03(s)		[success]
Filesystem               Size  Used Avail Use% Mounted on
/dev/mapper/centos-root   17G   16G  1.3G  93% /
devtmpfs                 908M     0  908M   0% /dev
tmpfs                    920M   12K  920M   1% /dev/shm
tmpfs                    920M   41M  879M   5% /run
tmpfs                    920M     0  920M   0% /sys/fs/cgroup
/dev/sda1               1014M  142M  873M  14% /boot
tmpfs                    184M     0  184M   0% /run/user/0

```

指定 IP 执行脚本并添加参数（使用默认 salt 通道）

```bash
$ ./act2ctl run 192.168.1.217 -f ~/test.sh -a "hello act2"

[1]	192.168.1.217	16:29:58	1.02(s)		[success]
hello act2
```

指定 IP 执行脚本并添加参数（使用 SSH 通道）

```bash
$ ./act2ctl run 192.168.1.17 -t ssh -f ~/test.sh -a "hello act2" -o linux -c hangzhou
target host password: *********

[1]	192.168.1.17	16:28:49	1.05(s)		[success]
hello act2
```

异步任务（使用 SSH 通道）

 ```bash
$ ./act2ctl run 192.168.1.1 -t ssh -f ~/test.sh -a "hello act2" -o linux -c hangzhou --async
target host password: *********
261eb0a4-a774-1670-f5bc-eeda3e397b37
 ```



## 文件下发

```bash
$ ./act2ctl file send [ip_list] src target [options]
```

通过 act2 服务下发文件到远程服务器上，`ip_list` 以英文逗号分割的 ip 地址列表，为远程服务器地址

 

Options：

```
-H hostfile    指定要下发执行的远程服务器地址，与 ip_list 互斥
-t type    下发时指定通道类型，type 可以为 salt 或 ssh，默认为 salt
-s scriptType    脚本类型，支持 bash 或 bat 或 python 或 sls，默认为 bash。如果提供了系统类型，在 Windows 下默认为 bat，其他默认为 bash
-C command    需要执行的命令，与 -f 互斥，最后与脚本执行是一样的
-a arg    脚本或者命令支持的参数，多个参数需要使用单引号或双引号起来，需要注意 bash 转义
--nocolor    关闭默认输出结果的高亮输出
-ouput format    输出格式，支持 default 或 json 或 yaml，其中默认为 default，支持高亮输出，json 或 yaml 输出无高亮
-T timeout    脚本执行的超时时间，默认为 300s
-c idc    指定 idc 名称，通道类型为 ssh 时必须指定
-o ostype    系统类型，支持 windows|linux|aix
-u username    指定执行账户，如果未指定，在系统类型为 windows 时默认账户 Administrator，其他系统默认账户为 root
-p password    指定执行账户的密码，通常类型为 ssh 时必须指定
-P port    指定通常类型为 ssh 时的连接端口，默认为 22
-e encoding    指定执行时编码类型，支持 gb18030 或 utf-8，如果未指定，在系统类型为 windows 时默认为 gb18030，其他系统默认账户为 utf-8
-v --verbose    输出调试信息
--async    异步处理，返回作业执行任务 id
```
 

示例：

```bash
$ ./act2ctl file send 192.168.1.1,192.168.1.2 test.txt /root/test.txt
$ ./act2ctl file send -H hostfile test.txt /root/test.txt
```



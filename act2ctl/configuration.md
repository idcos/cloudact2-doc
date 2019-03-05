# 配置


可用子命令:

- add 添加一些配置信息
- show 显示所有的配置内容



## 添加配置信息

`$ ./act2ctl config add [options] [option_value]`

配置 act2 的服务器访问地址。`cluster_server` 是 act2 的集群对外暴露的服务地址，相关配置信息会存储在 `~/.act2.yaml` 文件中

 

Options：

```
-c    设置 cluster 地址
-a,--auth    设置 auth 的类型，默认是 basic
-u.--username    auth 下的用户名
-p,--password    密码，在配置文件中，会使用 base64 方式存储密钥
-i,--waitInterval    查询结果的等待时间
-s,--salt   salt 的版本信息设置，通常默认即可
```
 

## 显示配置信息

`act2ctl config show`



示例：

```bash
$ ./act2ctl config add -c <http://192.168.1.1:6868>
$ ./act2ctl config show
```

 
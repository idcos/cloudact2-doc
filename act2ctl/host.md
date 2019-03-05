# host 操作


可用子命令:

- list   列出所有管理服务器信息
- report    管理服务器信息上报


## 获取所有的 host

```bash
$ ./act2ctl host list

EntityID				IP		OsType	Status	IDC		ProxyServer			ProxyStatus	ProxyType
6C12A913-756C-4A6B-B149-35E6351BA939	192.168.1.2	linux	running	hangzhou	http://192.168.1.4:5555	running		salt
508733f8-fc9e-4848-93c5-695f4358796f	192.168.1.3	linux	running	hangzhou

```


## 主机强制上报

给定 idc，使得 idc 下的主机强制上报给 master，仅在 SaltStack 下有效

```bash
$ ./act2ctl host report -c hangzhou
act2ctl notify host to report master success
```



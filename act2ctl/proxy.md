# proxy 操作

可用子命令:

- list 列出所有 proxy 信息
- del 删除指定 proxy

## 获取 proxy 信息

```bash
$ ./act2ctl proxy list
ID					Server				Type	Status	IdcName
3BB5D781-F4D9-4B9F-9ADD-318425401683	http://192.168.1.17:5555	salt	running	hangzhou
```




## 删除 proxy 信息


示例：

```bash
$ ./act2ctl proxy del
```


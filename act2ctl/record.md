# 查看任务信息

可用子命令:

- list 显示所有 record 信息
- get 显示某个 record 信息
- cancel 取消某个 record 信息


## 获取 record 相关信息

```bash
$ ./act2ctl record list
recordID	entityID	hostIP	startTime	endTime	status
```

## 获取某个 record 信息

```bash
$ ./act2ctl record get 
```


## 取消某个执行

```bash
$ ./act2ctl record cancel
```


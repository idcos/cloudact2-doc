# api 示例


下面假定服务器地址为 `192.168.1.17`，监听端口为 `6868`


## 脚本执行


```bash
$ curl http://192.168.1.17:6868/api/v1/job/ip/exec -H 'Content-Type: application/json' -d '{"execHosts":[{"hostIp":"192.168.1.17","hostPort":22,"entityId":"","hostId":"","idcName":"hangzhou","osType":"linux","encoding":"utf-8","proxyId":""}],"execParam":{"pattern":"script","script":"#!/bin/bash\n\necho \"$@\"\n","scriptType":"shell","params":{"args":"hello act2"},"runas":"root","password":"yunjikeji","timeout":300,"env":null,"extendData":null,"realTimeOutput":false},"provider":"ssh","callback":"","executeId":"accc7323-fc44-91b5-b891-6a3cebdbb4dc"}'
```
 
然后返回类似如下：

```json
{"status":"success","message":"","content":"b6e5b942-0fb7-35b1-8b98-4810d64f7952"}
```

status 为 success 时，表示成功，fail 时为失败，文件下发同。

参数定义分三部分：

- `execHosts`： 表示主机信息 
- `execParam`： 表示脚本或文件下发参数
- 其他一些数据： 如 `provider`, `callback`, `executeId`

详细信息见 [平台开发接口](../api/README.md)



## 文件下发



```bash
$ curl http://192.168.1.17:6868/api/v1/job/ip/exec -H 'Content-Type: application/json' -d '{"execHosts":[{"hostIp":"192.168.1.17","hostPort":22,"entityId":"","hostId":"","idcName":"hangzhou","osType":"linux","encoding":"utf-8","proxyId":""}],"execParam":{"pattern":"file","script":"data:application/octet-stream;base64,IyEvYmluL2Jhc2gKCmVjaG8gIiRAIgo=","scriptType":"conf","params":{"fileName":"test.sh","target":"/tmp/test2.sh"},"runas":"root","password":"yunjikeji","timeout":300,"env":null,"extendData":null,"realTimeOutput":false},"provider":"ssh","callback":"","executeId":"fbfd12aa-3810-e6a7-3f89-b4bb79cda912"}'

```

然后返回类似如下：

```json
{"status":"success","message":"","content":"1b73a5b1-b169-4184-0e6d-c45cc54bd222"}
```







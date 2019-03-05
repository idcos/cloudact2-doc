# 脚本执行


### 通过 IP 执行命令



#### 请求地址

| 名称         | 说明                |
| ------------ | ------------------- |
| 请求地址     | /api/v1/job/ip/exec |
| 编码         | UTF-8               |
| 请求方式     | POST                |
| Content-Type | application/json    |



#### 请求参数

| 方式     | 名称                               | 描述                        | 类型                              |
| -------- | ---------------------------------- | --------------------------- | --------------------------------- |
| **Body** | **JobIPExecParam**  <br>*optional* | params used for running job | [JobIPExecParam](#jobipexecparam) |



#### Responses

| HTTP Code | 描述                                 | 结构                                          |
| --------- | ------------------------------------ | --------------------------------------------- |
| **200**   | no error                             | [AsyncJobRecordResult](#asyncjobrecordresult) |
| **400**   | bad parameter                        | [Error](#error)                               |
| **500**   | An unexpected server error occurred. | [Error](#error)                               |



## 参数定义描述



#### JobIDExecParam

在使用 id 方式调用的时候使用

| Name                          | Description                                      | Schema                  |
| ----------------------------- | ------------------------------------------------ | ----------------------- |
| **callback**  <br>*optional*  | http 回调地址，任务执行结束后，会回调这个地址     | string                  |
| **entityIds**  <br>*optional* | 执行的主机列表                                   | <string> array        |
| **execParam**  <br>*optional* |                                                  | [ExecParam](#execparam) |
| **executeId**  <br>*optional* | 外部的执行 id，可以通过这个 id 来进行调用之间的跟踪 | string                  |
| **provider**  <br>*optional*  | 提供者，可以是 `ssh,salt,puppet`                  | string                  |



#### JobIPExecParam

在使用 ip 方式调用的时候使用

| Name                          | Description                                      | Schema                          |
| ----------------------------- | ------------------------------------------------ | ------------------------------- |
| **callback**  <br>*optional*  | http 回调地址，任务执行结束后，会回调这个地址     | string                          |
| **execHosts**  <br>*optional* | 执行的主机列表                                   | <[ExecHost](#exechost) > array |
| **execParam**  <br>*optional* |                                                  | [ExecParam](#execparam)         |
| **executeId**  <br>*optional* | 外部的执行 id，可以通过这个 id 来进行调用之间的跟踪 | string                          |
| **provider**  <br>*optional*  | 提供者，可以是 `ssh, alt, puppet`                 | string                          |



#### ExecHost

| Name                         | Description                                       | Schema |
| ---------------------------- | ------------------------------------------------- | ------ |
| **encoding**  <br>*optional* | 系统默认的编码，如果为空，则默认以 utf-8 值进行处理 | string |
| **entityId**  <br>*optional* | 系统的唯一 id                                      | string |
| **hostId**  <br>*optional*   | act2-master 系统中的主机表中的 id                   | string |
| **hostIp**  <br>*optional*   | ssh 登陆的 IP 地址                                   | string |
| **hostPort**  <br>*optional* | ssh 的端口，如果为空，为 22 端口                     | string |
| **idcName**  <br>*optional*  | 逻辑 idc 的名称，ssh 使用时必须提供                  | string |
| **osType**  <br>*optional*   | 系统类型，可以为 `windows, linux, aix`             | string |



#### ExecParam

| Name                           | Description                                                  | Schema                      |
| ------------------------------ | ------------------------------------------------------------ | --------------------------- |
| **env**  <br>*optional*        | 脚本执行时的环境变量，保留                                   | object                      |
| **extendData**  <br>*optional* | 扩展数据，保留                                               | object                      |
| **params**  <br>*optional*     |                                                              | [ScriptParam](#scriptparam) |
| **password**  <br>*optional*   | 远程服务器上执行脚本的账户对应的密码，在通道为 ssh 的时候提供  | string                      |
| **pattern**  <br>*optional*    | 匹配的方式，模块名称，支持 script：脚本执行, salt.state：状态应用, file：文件下发. | string                      |
| **runas**  <br>*optional*      | 远程服务器上执行脚本的账户                                   | string                      |
| **script**  <br>*optional*     | 依据模块名称进行解释 <br>Pattern 为 script 时，script 为脚本内容 <br>Pattern 为 salt.state 时，script 为 salt 的 state 内容 <br>Pattern 为 file 时，script 为文件内容或 url 数组列表 | string                      |
| **scriptType**  <br>*optional* | 依据 pattern 进行解释 <br>pattern 为 script 时，scriptType 为 shell, bash, bat, python<br>pattern 为 file 时，scriptType 为 url 或者 text | string                      |
| **timeout**  <br>*optional*    | 脚本执行或者文件下发的超时时间，如果为 0，则表示不超时        | integer                     |



#### ScriptParam
脚本参数或者文件下发需要的参数


|Name|Description|Schema|
|---|---|---|
|**args**  <br>*optional*| 脚本参数，如果是脚本的时候，需要提供 | string|
|**target**  <br>*optional*| 文件下发的目标路径 | string|
|**fileName**  <br>*optional*| 文件下发的文件名 | string|




#### AsyncJobRecordResult

| Name                        | Description   | Schema |
| --------------------------- | ------------- | ------ |
| **content**  <br>*optional* | job record id | string |
| **message**  <br>*optional* |               | string |
| **status**  <br>*optional*  |               | string |



#### Error

| Name                        | Description | Schema |
| --------------------------- | ----------- | ------ |
| **message**  <br>*optional* |             | string |









#### 请求示例（Python）

```python
import requests

data = {
  "callback": "",
  "execHosts": [
    {
      "encoding": "utf-8",
      "entityId": "",
      "hostId": "",
      "hostIp": "192.168.1.17",
      "hostPort": 22,
      "idcName": "hangzhou",
      "osType": "linux",
      "proxyId": ""
    }
  ],
  "execParam": {
    "env": None,
    "extendData": None,
    "params": {
      "args": "hello act2"
    },
    "password": "yunjikeji",
    "pattern": "script",
    "realTimeOutput": False,
    "runas": "root",
    "script": "#!/bin/bash\n\necho \"$@\"\n",
    "scriptType": "shell",
    "timeout": 300
  },
  "executeId": "6232ac8d-f084-b42b-cd14-c49a970969ed",
  "provider": "ssh"
}

url = 'http://192.168.1.17:6868/api/v1/job/ip/exec'
resp = requests.post(url, json=data)
print(resp.json())
```

注意：`params` 必须要提供 `args` 字段，用来作为脚本的参数








### 通过 ID 下发文件

#### 请求地址

| 名称         | 说明                |
| ------------ | ------------------- |
| 请求地址     | /api/v1/job/id/exec |
| 编码         | UTF-8               |
| 请求方式     | POST                |
| Content-Type | application/json    |



#### 请求参数

| Type     | Name                               | Description        | Schema                            |
| -------- | ---------------------------------- | ------------------ | --------------------------------- |
| **Body** | **JobIPExecParam**  <br>*optional* | 用来执行的参数列表 | [JobIPExecParam](#jobipexecparam) |



#### Responses

| HTTP Code | Description                          | Schema                                        |
| --------- | ------------------------------------ | --------------------------------------------- |
| **200**   | no error                             | [AsyncJobRecordResult](#asyncjobrecordresult) |
| **400**   | bad parameter                        | [Error](#error)                               |
| **500**   | An unexpected server error occurred. | [Error](#error)                               |

参数形式和 IP 方式一样，仅需要填充 `entityId` 值即可



#### 请求示例（Python）

```python
import requests

data = {
  "callbak": "",
  "entityIds": ["6C12A913-756C-4A6B-B149-35E6351BA939"],
  "execParam": {
    "env": None,
    "extendData": None,
    "params": {
      "args": "hello act2"
    },
    "password": "yunjikeji",
    "pattern": "script",
    "realTimeOutput": False,
    "runas": "root",
    "script": "#!/bin/bash\n\necho \"$@\"\n",
    "scriptType": "shell",
    "timeout": 300
  },
  "executeId": "fbfd12aa-3810-e6a7-3f89-b4bb79cda912",
  "provider": "salt"
}

url = 'http://192.168.1.17:6868/api/v1/job/id/exec'
resp = requests.post(url, json=data)
print(resp.json())
```

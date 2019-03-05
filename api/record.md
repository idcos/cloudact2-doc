# 结果查询



### 获取作业执行列表



#### 请求地址

| 名称         | 说明                    |
| ------------ | ----------------------- |
| 请求地址     | /api/v1/job/record/page |
| 编码         | UTF-8                   |
| 请求方式     | GET                     |
| Content-Type | application/json        |

#### 

#### 请求参数

| 方式      | 名称                         | 描述     | 类型    |
| --------- | ---------------------------- | -------- | ------- |
| **Query** | **pageNo**  <br>*optional*   | 作业编号 | integer |
| **Query** | **pageSize**  <br>*optional* | 作业大小 | integer |



#### Responses

| HTTP Code | Description                          | Schema                                      |
| --------- | ------------------------------------ | ------------------------------------------- |
| **200**   | no error                             | [JobRecordPagination](#jobrecordpagination) |
| **400**   | bad parameter                        | [Error](#error)                             |
| **500**   | An unexpected server error occurred. | [Error](#error)                             |



### 参数定义描述



#### JobRecordPagination

| Name                           | Description | Schema                                    |
| ------------------------------ | ----------- | ----------------------------------------- |
| **list**  <br>*optional*       | 结果列表    | < [JobRecordItem](#jobrecorditem) > array |
| **pageCount**  <br>*optional*  | 页数量      | integer                                   |
| **pageNo**  <br>*optional*     | 页码        | integer                                   |
| **pageSize**  <br>*optional*   | 页大小      | integer                                   |
| **totalCount**  <br>*optional* | 总共数量    | integer                                   |



#### 请求示例（Python）

```python
import requests


url = 'http://192.168.1.17:6868/api/v1/job/record/page?pageSize=20&pageNo=1'
headers = {
	'Content-Type': 'application/json'
}
resp = requests.get(url, headers=headers)
print(resp.json())
```







### 获取作业执行信息



#### 请求地址

| 名称         | 说明               |
| ------------ | ------------------ |
| 请求地址     | /api/v1/job/record |
| 编码         | UTF-8              |
| 请求方式     | GET                |
| Content-Type | application/json   |



#### 请求参数

| 方式      | 名称                   | 描述          | 类型   |
| --------- | ---------------------- | ------------- | ------ |
| **Query** | **id**  <br>*optional* | job record id | string |



#### Responses

| HTTP Code | Description                          | Schema                          |
| --------- | ------------------------------------ | ------------------------------- |
| **200**   | no error                             | [JobRecordInfo](#jobrecordinfo) |
| **400**   | bad parameter                        | [Error](#error)                 |
| **500**   | An unexpected server error occurred. | [Error](#error)                 |

#### 

### 参数定义描述



#### JobRecordInfo

| Name                               | Description                                         | Schema  |
| ---------------------------------- | --------------------------------------------------- | ------- |
| **callback**  <br>*optional*       | 作业执行的回调地址                                  | string  |
| **end_time**  <br>*optional*       | 作业执行结束时间                                    | string  |
| **execute_status**  <br>*optional* | 作业执行状态, init\|doing\|done                     | string  |
| **hosts**  <br>*optional*          | 作业执行的主机列表                                  | string  |
| **id**  <br>*optional*             | job record id                                       | string  |
| **module_name**  <br>*optional*    | 匹配方式                                            | string  |
| **parameters**  <br>*optional*     | 参数信息                                            | string  |
| **provider**  <br>*optional*       | provider的                                          | string  |
| **result_status**  <br>*optional*  | 作业执行结果状态，cancelled\|success\|fail\|timeout | string  |
| **script**  <br>*optional*         | 作业执行的脚本                                      | string  |
| **script_type**  <br>*optional*    | 脚本类型                                            | string  |
| **start_time**  <br>*optional*     | 作业执行起始时间                                    | string  |
| **timeout**  <br>*optional*        | 超时时间                                            | integer |



#### 请求示例（Python）

```python
import requests


url = 'http://192.168.1.17:6868/api/v1/job/record?id=020c1dbf-146e-a19c-0d94-c8c2965c7ab3'
headers = {
	'Content-Type': 'application/json'
}
resp = requests.get(url, headers=headers)
print(resp.json())
```





### 获取作业执行结果



#### 请求地址

| 名称         | 说明                      |
| ------------ | ------------------------- |
| 请求地址     | /api/v1/job/record/result |
| 编码         | UTF-8                     |
| 请求方式     | GET                       |
| Content-Type | application/json          |



#### 请求参数

| Type      | Name                   | Description   | Schema |
| --------- | ---------------------- | ------------- | ------ |
| **Query** | **id**  <br>*optional* | job record id | string |



#### Responses

| HTTP Code | Description                          | Schema                              |
| --------- | ------------------------------------ | ----------------------------------- |
| **200**   | no error                             | [JobRecordResult](#jobrecordresult) |
| **400**   | bad parameter                        | [Error](#error)                     |
| **500**   | An unexpected server error occurred. | [Error](#error)                     |

#### 



### 参数定义描述



#### JobRecordResult

| Name                          | Description        | Schema |
| ----------------------------- | ------------------ | ------ |
| **endTime**  <br>*optional*   | 作业结束时间       | string |
| **entityId**  <br>*optional*  | 系统id             | string |
| **hostId**  <br>*optional*    | 主机id             | string |
| **hostIp**  <br>*optional*    | 主机ip             | string |
| **idcName**  <br>*optional*   | idc名称            | string |
| **message**  <br>*optional*   | 脚本执行的异常信息 | string |
| **recordId**  <br>*optional*  | 作业执行记录id     | string |
| **startTime**  <br>*optional* | 作业起始时间       | string |
| **status**  <br>*optional*    | 主机执行结果状态   | string |
| **stderr**  <br>*optional*    | 脚本执行的stderr   | string |
| **stdout**  <br>*optional*    | 脚本执行的stdout   | string |



#### 请求示例（Python）

```python
import requests


url = 'http://192.168.1.17:6868/api/v1/job/record/result?id=020c1dbf-146e-a19c-0d94-c8c2965c7ab3'
headers = {
	'Content-Type': 'application/json'
}
resp = requests.get(url, headers=headers)
print(resp.json())
```
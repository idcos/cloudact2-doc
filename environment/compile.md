# 编译

从 github 上获取源码

```bash
git clone https://github.com/idcos/cloud-act2
```

编译

```bash
cd cloud-act2
export GOPATH=`pwd`
make
```

会在目录下构建出 `cmd/bin` 目录，存在 `cloud-act2-server`，`act2ctl` 以及 `salt-event` 文件。

其中：

- `cloud-act2-server` 为服务程序
- `act2ctl` 为命令行工具
- `salt-event` 用来将 `salt` 事件转发给 `cloud-act2-server`




## 依赖的第三方工具

### revive

Revive 是用来做 Go 语言 lint 的工具，主要通过计算圈复杂度来认定代码编写的好坏。



#### 安装 

```
go get -u github.com/mgechev/revive
```



#### 使用

```bash
$ revive -h

 _ __ _____   _(_)__  _____
| '__/ _ \ \ / / \ \ / / _ \
| | |  __/\ V /| |\ V /  __/
|_|  \___| \_/ |_| \_/ \___|

Example:
  revive -config c.toml -formatter friendly -exclude a.go -exclude b.go ./...

Usage of revive:
  -config string
    	path to the configuration TOML file (i.e. -config myconf.toml)
  -exclude value
    	list of globs which specify files to be excluded (i.e. -exclude foo/...)
  -formatter string
    	formatter to be used for the output (i.e. -formatter stylish)
```

通常在工程目录下可以定义类似下面的配置文件:

```toml
# When set to false, ignores files with "GENERATED" header, similar to golint
ignoreGeneratedHeader = true

# Sets the default severity to "warning"
severity = "warning"

# Sets the default failure confidence. This means that linting errors
# with less than 0.8 confidence will be ignored.
confidence = 0.8

# Sets the error code for failures with severity "error"
errorCode = 0

# Sets the error code for failures with severity "warning"
warningCode = 0

# Configuration of the `cyclomatic` rule. Here we specify that
# the rule should fail if it detects code with higher complexity than 10.
[rule.cyclomatic]
  arguments = [10]

# Sets the severity of the `package-comments` rule to "error".
[rule.package-comments]
  severity = "error"
```

然后在工程目录下执行

`$ revive -config revive.toml -exclude=./vendor/... -formatter friendly . ./...`



### cloc

Cloc 是用来统计代码行数，方便开发者对总的代码量有一个比较清晰的认识。

#### 安装

Mac 下可以用 `brew install cloc` 来进行安装

Windows：https://sourceforge.net/projects/cloc/files/cloc/v1.64/cloc-1.64.exe/download

Linux 下可用各自的包安装来安装，如 CentOS 用 `yum install -y cloc`

#### 使用

```bash
$ cloc --exclude-dir=vendor .
     300 text files.
     289 unique files.
      28 files ignored.

github.com/AlDanial/cloc v 1.78  T=1.24 s (220.8 files/s, 29261.0 lines/s)
--------------------------------------------------------------------------------
Language                      files          blank        comment           code
--------------------------------------------------------------------------------
Go                              200           3626           1186          16863
Python                            8           1274           2070           5123
XML                               9              0              0           2597
Markdown                         22            644              0           1028
YAML                              3             70             99            701
SQL                              15             67             18            354
make                              2             37              8            121
HTML                              1             12              0            100
Ruby                              3             16              8             91
TOML                              2             26             34             63
Scala                             1              7              0             13
Bourne Shell                      4              8              4             13
JSON                              3              0              0             11
Bourne Again Shell                1              2              0             10
--------------------------------------------------------------------------------
SUM:                            274           5789           3427          27088
--------------------------------------------------------------------------------
```







### dep

Dep 是用来进行 go 语言的包管理，详细内容请见官方文档：https://golang.github.io/dep/docs/introduction.html

#### 安装

```bash
$ go get -u github.com/golang/dep/cmd/dep
```



#### 使用

以下操作，均在工程目录下执行



##### 初始化



```bash
$ dep init
```



##### 添加新包

```bash
$ dep ensure -add github.com/go-chi/chi
```

如果包已经在代码中，则用下面方式添加新包

```bash
$ dep ensure
```



##### 更新新包

```
$ dep ensure -update github.com/go-chi/chi
```


### swagger


#### 安装


```bash
$ go get -u github.com/go-swagger/go-swagger
```

#### 使用


```bash
$ swagger serve api/swagger.yaml
```



### 其他 make 命令 


#### 检测代码

```bash
make check
```


### lint

```bash
make lint
```

### stat

```bash
make stat
```

### swagger 校验

```bash
make validate-swagger
```


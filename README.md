# Introduction


## 背景

无论是互联网企业还是传统企业，都有大量服务器和应用需要管理，管理这些服务和应用，通常需要编写不少脚本，这些脚本很容易散落在各个维护人员手里。
此时无论是脚本执行，文件下发，都很容易成为应用维护的瓶颈。


## 目的


对于用户而言，不需要关心底层服务器部署在哪个机房，需要通过何种途径才能访问，只需要专注于业务相关的脚本编写，然后
通过统一的 HTTP Restful API 接口来进行脚本执行和文件下发。



## 说明


Cloud-Act2 是一个可以对远程服务器进行脚本执行和文件下发的服务工具，构建在 SaltStack、SSH 等通道之上。
Cloud-Act2 通过统一抽象层，提供脚本执行和文件下发一致的 HTTP RESTful API 接口能力，方便对分散于不同机房之间的服务进行管理。

其他系统可以在 Cloud-Act2 基础上，进行更进一步的操作系统管理和应用控制，构建出更有效的企业服务管理平台。



## 项目地址

[https://github.com/idcos/cloud-act2](https://github.com/idcos/cloud-act2)


本系统，假定你有一定的运维的经验，对使用 SaltStack、Linux 以及 SSH 有一定的经验。


## 快速查看

- [架构](architecture/README.md)
- [命令行示例](act2ctl/cmd_example.md)
- [api 示例](act2ctl/api_example.md)

## 目录

- [目录](SUMMARY.md)

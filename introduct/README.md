# 前言

Cloud-Act2 是一个可以对远程服务器进行脚本执行和文件下发的服务工具，构建在 SaltStack、SSH 等通道之上。
Cloud-Act2 通过统一抽象层，提供脚本执行和文件下发一致的 HTTP RESTful API 接口能力，方便对分散于不同机房之间的服务进行管理。

其他系统可以在 Cloud-Act2 基础上，进行更进一步的操作系统管理和应用控制，构建出更有效的企业服务管理平台。
​

### 组成

Cloud-Act2 从组件上讲，主要由 Act2-Master 和 Act2-Proxy 组成，Act2-Master 用来管控所有的服务器，Act2-Proxy 用来管理底层接口服务器。

从程序文件上看，主要由 `act2ctl`, `cloud-act2-server`, `salt-event` 三个文件组成。其中 `act2ctl` 为命令行程序，`cloud-act2-server` 为主要服务程序，需要通过配置文件来区分是 `Master` 服务还是 `Proxy` 服务，`salt-event` 为转发 `SaltStack` 事件给 `cloud-act2-server` 的事件监听程序。


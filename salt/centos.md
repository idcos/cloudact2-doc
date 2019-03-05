## 在 centos 7 安装 Salt-Minion



### 安装

```bash
sudo yum install https://repo.saltstack.com/yum/redhat/salt-repo-latest.el7.noarch.rpm
sudo yum clean expire-cache
sudo yum install salt-minion-2018.3.3
```





### 设置 id 信息

```bash
$id=`cat /sys/class/dmi/id/product_uuid`
echo "id:$id" > /etc/salt/minion.d/id.conf
```



### 设置 master 信息

先确定 `salt-master` 的地址，下面假设是 `192.168.1.17`

 ```bash
cat > /etc/salt/minion.d/master.conf <<EOF
master:
  - 192.168.1.17
EOF
 ```



### 启动服务

```bash
systemctl start salt-minion
```



#### 参考

[1] https://repo.saltstack.com/#rhel










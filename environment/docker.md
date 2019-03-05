# 环境搭建


## docker 环境

获取 Cloud-Act2 的 docker 镜像



```bash
export IP=192.168.2.1

docker pull registry.cn-hangzhou.aliyuncs.com/idcos/cloudact2
docker run --privileged --rm -d --name=cloudact2 --net=host -e IP=${IP} \
    -v $PWD/cloudact2/deploy/conf/cloud-act2.yaml:/usr/yunji/cloud-act2/etc/cloud-act2.yaml \
    -v $PWD/cloudact2/deploy/conf/cloud-act2-proxy.yaml:/usr/yunji/cloud-act2/etc/cloud-act2-proxy.yaml \
    -v $PWD/cloudact2/deploy/conf/salt-api.conf:/etc/salt/master.d/salt-api.conf \
    registry.cn-hangzhou.aliyuncs.com/idcos/cloudact2
```



详细参考：[一键部署](http://idcos.github.io/osinstall-doc/environment/%E4%B8%80%E9%94%AE%E9%83%A8%E7%BD%B2.html) 文档






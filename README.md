# 使用说明
## 1.创建工作目录(没有就创建)
```
mkdir -p /data/docker
```
## 2.下载项目到本地
```
cd /data
git clone https://github.com/fsmflying/docker-config.git
```
## 3.复制mysql目录到指定位置下(/data/docker)
```
cd /data/docker-config 
cp -R mysql* /data/docker
```
## 4.docker-compose基础命令
### 1.根据docker-compose编排文件创建容器，并启动所有服务
```
docker-compose -f docker-compose.yml up -d
```
### 2.停止所有的服务，并移除所有的容器
```
docker-compose -f docker-compose.yml down
```
### 3.创建容器，并启动某个服务，如果已经创建，则直接启动服务
```
docker-compose -f docker-compose.yml up -d redis
```
### 4.关闭某个服务，并移除相应的容器
```
docker-compose -f docker-compose.yml down mysql
```


## 5.安装docker-ce
``` 
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
yum makecache fast
yum -y install docker-ce
service docker start
```

## 6.辅助脚本
### 停止所有容器
``` 
docker stop  docker-config_mysql-cluster-master01_1
docker stop  docker-config_mysql-cluster-master01-slave_1
docker stop  docker-config_mysql-cluster-master02_1
docker stop  docker-config_mysql-cluster-master02-slave_1
docker stop  docker-config_mysql-cluster-master03_1
docker stop  docker-config_mysql-cluster-master03-slave_1
```
### 删除所有容器
```
docker rm  docker-config_mysql-cluster-master01_1
docker rm  docker-config_mysql-cluster-master01-slave_1
docker rm  docker-config_mysql-cluster-master02_1
docker rm  docker-config_mysql-cluster-master02-slave_1
docker rm  docker-config_mysql-cluster-master03_1
docker rm  docker-config_mysql-cluster-master03-slave_1
``` 
### 重置工作目录
```
rm -rf /data/docker/mysql-cluster-*
cp -R mysql-cluster-* /data/docker/
```
## 7.mysql主从复制配置
### 1.mysql 8.0.11
#### 1.在master上创建同步账号
```
CREATE USER 'backup'@'%' IDENTIFIED BY 'abc123def';
GRANT REPLICATION SLAVE ON *.* TO 'backup'@'%';
FLUSH PRIVILEGES;
```
#### 2.获取master状态(在master上),得到File,Position
```
show master status;
```
#### 3.在slave上配置访问master的配置,其中File,Position就是从master上获取的
```
change master to master_host='master_host',master_port=3306,
       master_user='backup',master_password='abc123def',
       master_log_file='${File}',
       master_log_pos=${Position};
FLUSH PRIVILEGES;
```
#### 4.在slave上，开始同步
```
start slave;
```
#### 5.注意：要保证端口已经开放，或直接关闭防火墙
> 1. 停止防火墙
```
systemctl stop firewalld
或
service firewalld stop
```
> 2. 打开防火墙
```
systemctl start firewalld
或
service firewalld start
```
> 3. 禁用防火强
```
systemctl disable firewalld
或
chkconfig firewalld off
```
> 4. 启用防火强
```
systemctl enable firewalld
或
chkconfig firewalld on
```
 
   
 


# 使用说明
## 1.创建工作目录(没有就创建)
  1. mkdir -p /data/docker
## 2.下载项目到本地
  1. cd /data
  2. git clone https://github.com/fsmflying/docker-config.git
## 3.复制目录到指定位置
  1. cp -R mysql* /data/docker
## 4.启动和停止服务
>  1. docker-compose -f docker-compose.yml up -d
## 5.停止所有的服务
>  1. docker-compose -f docker-compose.yml down 
## 6.启动某个服务
>  1. docker-compose -f docker-compose.yml up -d redis
## 7.关闭某个服务
>  1. docker-compose -f docker-compose.yml up -d mysql

## 创建运行环境

### 安装docker-ce
> * sudo yum install -y yum-utils device-mapper-persistent-data lvm2
> * sudo yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
> * yum makecache fast
> * yum -y install docker-ce
> * service docker start

### mysql-cluster启动
  * cd /data/docker-config
  * cp cp -R mysql-cluster-* /data/docker
  * docker-compose -f docker-compose-mysql-cluster.yml up -d
### 辅助脚本
#### 停止所有容器
 * docker stop  docker-config_mysql-cluster-master01_1
 * docker stop  docker-config_mysql-cluster-master01-slave_1
 * docker stop  docker-config_mysql-cluster-master02_1
 * docker stop  docker-config_mysql-cluster-master02-slave_1
 * docker stop  docker-config_mysql-cluster-master03_1
 * docker stop  docker-config_mysql-cluster-master03-slave_1
#### 删除所有容器
 * docker rm  docker-config_mysql-cluster-master01_1
 * docker rm  docker-config_mysql-cluster-master01-slave_1
 * docker rm  docker-config_mysql-cluster-master02_1
 * docker rm  docker-config_mysql-cluster-master02-slave_1
 * docker rm  docker-config_mysql-cluster-master03_1
 * docker rm  docker-config_mysql-cluster-master03-slave_1  
#### 重置工作目录
 * rm -rf /data/docker/mysql-cluster-*
 * cp -R mysql-cluster-* /data/docker/ 
#### mysql主从复制配置
 * 容器初始化脚本中已经创建了账号"backup/abc123def"
 * 在master服务器上执行"show master status",找到"File","Position"
 * 在slave服务器上配置同步账号:
   mysql: change master to master_host='master_host',master_port=3306,
       master_user='backup',master_password='abc123def',
       master_log_file='${File}',
       master_log_pos=${Position};
   mysql: FLUSH PRIVILEGES;
   mysql: start slave;
 * 注意：要保证端口已经开放
 
   
 


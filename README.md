# docker
## 启动所有的服务
>  1. docker-compose -f docker-compose.yml up -d
## 停止所有的服务
>  1. docker-compose -f docker-compose.yml down 
## 启动某个服务
>  1. docker-compose -f docker-compose.yml up -d redis
## 关闭某个服务
>  1. docker-compose -f docker-compose.yml up -d mysql

# 创建mysql运行环境
## 1.创建数据目录
>  mkdir /data/docker
## 2.复制mysql目录到/data/docker目录下
>  cp -R mysql /data/docker



# 使用说明
## 1.内容
> 1. 包含openjdk8-8.171.11-r0
> 2. 包含tzdata，并设置时区为Asia/Shanghai
## 2.安装docker
## 3.构建镜像
```
docker build -t fsmflying/jdk8-alpine:v1 .
```
## 4.运行
```
docker run -it fsmflying/jdk8-alpine:v1 sh
```
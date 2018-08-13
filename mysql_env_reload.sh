#!/bin/bash
rm -rf /data/docker/mysql*
cp -R mysql* /data/docker
mkdir /data/docker/mysql/data/
mkdir /data/docker/mysql5.6/data/
mkdir /data/docker/mysql5.7/data/
mkdir /data/docker/mysql-master01/data/
mkdir /data/docker/mysql-master01-slave01/data/
mkdir /data/docker/mysql-cluster-3307/data/
mkdir /data/docker/mysql-cluster-3308/data/
mkdir /data/docker/mysql-cluster-3309/data/
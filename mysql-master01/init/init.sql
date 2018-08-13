#mysql 8.0.11
USE mysql;
#设置密码以及访问来源
ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'fangming' PASSWORD EXPIRE NEVER;
GRANT ALL ON *.* TO 'root'@'%';
FLUSH PRIVILEGES;

#创建同步账号
CREATE USER 'backup'@'%' IDENTIFIED BY 'abc123def';
GRANT REPLICATION SLAVE ON *.* TO 'backup'@'%';
FLUSH PRIVILEGES;


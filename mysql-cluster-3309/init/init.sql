#mysql 8.0.11
USE mysql;
GRANT ALL ON *.* TO 'root'@'%';
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'fangming' PASSWORD EXPIRE NEVER;
ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'fangming';
FLUSH PRIVILEGES;

#数据同步账号
CREATE USER 'backup'@'%' IDENTIFIED BY 'abc123def';
GRANT REPLICATION SLAVE ON *.* TO 'backup'@'%';
FLUSH PRIVILEGES;

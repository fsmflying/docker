use mysql;
GRANT ALL ON *.* TO 'root'@'%';
ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'fangming';
flush privileges;

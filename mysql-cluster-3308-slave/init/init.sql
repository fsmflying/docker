use mysql;
GRANT ALL ON *.* TO 'root'@'%';
flush privileges;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'fangming' PASSWORD EXPIRE NEVER;
ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'fangming';
flush privileges;



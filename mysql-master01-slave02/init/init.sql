use mysql;
ALTER USER 'root'@'%' IDENTIFIED BY 'fangming' WITH mysql_native_password BY 'fangming' PASSWORD EXPIRE NEVER;
GRANT ALL ON *.* TO 'root'@'%';
FLUSH PRIVILEGES;


use mysql;
GRANT ALL ON *.* TO 'root'@'%';
flush privileges;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'fangming' PASSWORD EXPIRE NEVER;
ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'fangming';
flush privileges;


CREATE DATABASE sequence;

USE sequence;
#
CREATE TABLE MYCAT_SEQUENCE (name VARCHAR(50) NOT NULL,current_value INT NOT
NULL,increment INT NOT NULL DEFAULT 100, PRIMARY KEY(name)) ENGINE=InnoDB;
#插入一条 sequence
INSERT INTO MYCAT_SEQUENCE(name,current_value,increment) VALUES ('GLOBAL', 100000,100);


DROP FUNCTION IF EXISTS mycat_seq_currval;
DELIMITER //
CREATE FUNCTION mycat_seq_currval(seq_name VARCHAR(50))
  RETURNS varchar(64)
  CHARSET utf8mb4
DETERMINISTIC
  BEGIN
    DECLARE retval VARCHAR(64);
    SET retval='-999999999,null';
    SELECT concat(CAST(current_value AS CHAR),',CAST(increment AS CHAR)) INTO retval FROM
    MYCAT_SEQUENCE WHERE name = seq_name;
    RETURN retval;
  END
    DELIMITER ;

#设置 sequence 值
DROP FUNCTION IF EXISTS mycat_seq_setval;
DELIMITER //
CREATE FUNCTION mycat_seq_setval(seq_name VARCHAR(50),value INTEGER) RETURNS varchar(64)
CHARSET utf8mb4
DETERMINISTIC
  BEGIN
    UPDATE MYCAT_SEQUENCE
    SET current_value = value
    WHERE name = seq_name;
    RETURN mycat_seq_currval(seq_name);
  END
    DELIMITER ;


#取下一个sequence值
DROP FUNCTION IF EXISTS mycat_seq_nextval;
DELIMITER //
CREATE FUNCTION mycat_seq_nextval(seq_name VARCHAR(50))
  RETURNS varchar(64)
  CHARSET utf8mb4
DETERMINISTIC
  BEGIN
    UPDATE MYCAT_SEQUENCE
    SET current_value = current_value + increment WHERE name = seq_name;
    RETURN mycat_seq_currval(seq_name);
  END//
DELIMITER ;

use mix;

create table sys_user
(
  id bigint auto_increment primary key,
  username varchar(64) not null,
  password varchar(64) not null,
  mobile varchar(32) not null,
  create_time datetime default now(),
  delete_time datetime null
);

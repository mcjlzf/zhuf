CREATE TABLE p_user(
id INT PRIMARY KEY AUTO_INCREMENT,
NAME VARCHAR(10),
sex CHAR(2)
)

INSERT INTO p_user(NAME,sex) VALUES('A',"男");
INSERT INTO p_user(NAME,sex) VALUES('B',"女");
INSERT INTO p_user(NAME,sex) VALUES('C',"男");

#创建存储过程( 查询得到男性或女性的数量, 如果传入的是 0 就女性否则是男性)
DELIMITER $
CREATE PROCEDURE mybatis.ges_user_count(IN sex_id INT, OUT user_count INT)
BEGIN
IF sex_id=0 THEN
SELECT COUNT(*) FROM mybatis.p_user WHERE p_user.sex='女' INTO user_count;
ELSE
SELECT COUNT(*) FROM mybatis.p_user WHERE p_user.sex='男' INTO user_count;
END IF;
END
$

#调用存储过程
DELIMITER ;
SET @user_count = 0;
CALL mybatis.ges_user_count(0, @user_count);
SELECT @user_count;

SELECT * FROM USER WHERE NAME='cjl';



#给表增加列 COLUMN 可以省略
ALTER TABLE USER ADD COLUMN weight INT;
#delete
ALTER TABLE USER DROP weight;
#修改列属性
ALTER TABLE USER MODIFY weight VARCHAR;
#修改列名及属性
ALTER TABLE USER CHANGE weight wei INT;
#修改表名
ALTER TABLE USER RENAME user2;


#插入表数据
INSERT INTO USER(NAME,wei) VALUES('cz94',94);
INSERT INTO USER SET NAME='cjlzf',age=19,sex=0,wei=96;
# insert into tbl_name1(col1,col2) select col3,col4 from tbl_name2;
# 批量插入
# LOAD DATA INFILE "./data.txt" INTO TABLE db2.my_table;

#删除表数据
DELETE FROM USER WHERE id=6;



# 	扩展正则表达式的一些字符是：
#	“.”匹配任何单个的字符。
#	一个字符类“[...]”匹配在方括号内的任何字符。例如，“[abc]”匹配“a”、“b”
#	或“c”。为了命名字符的一个范围，使用一个“-”。“[a-z]”匹配任何小写字母，而
#	“[0-9]”匹配任何数字。
#	“ * ”匹配零个或多个在它前面的东西。例如，“x*”匹配任何数量的“x”字
#	符，“[0-9]*”匹配的任何数量的数字，而“.*”匹配任何数量的任何东西。
#	正则表达式是区分大小写的，但是如果你希望，你能使用一个字符类匹配两种写
#	法。例如，“[aA]”匹配小写或大写的“a”而“[a-zA-Z]”匹配两种写法的任何字母。
#	如果它出现在被测试值的任何地方，模式就匹配(只要他们匹配整个值，SQL 模式匹配)。
#	为了定位一个模式以便它必须匹配被测试值的开始或结尾，在模式开始处使用“^”或在模式的结尾用“$”。

#找出包含正好 n 个字符的名字，使用 ^ 和 $ 匹配名字的开始和结尾，和 n 个 . 在两者之间
SELECT * FROM USER WHERE NAME REGEXP "^......$";
#或者
SELECT * FROM USER WHERE NAME REGEXP "^.{4}$";




################查询语句####################
# 当前时间
SELECT CURDATE();
SELECT CURTIME();
SELECT NOW();
# 使用字段别名创建表
CREATE TABLE user1 SELECT NAME AS name1, age AS age1 FROM USER;
# LEFT JOIN 强制包含左边表的每一行，而不管右边表是否匹配。
# 




#索引	索引有如下的几种情况：
	
	#INDEX 索引：通常意义的索引，某些情况下 KEY 是它的一个同义词。索引的列
	#可以包括重复的值。
	
	#UNIQUE 索引：唯一索引，保证了列不包含重复的值，对于多列唯一索引，它保
	#证值的组合不重复。
	
	#PRIMARY KEY 索引：也 UNIQUE 索引非常类似。事实上，PRIMARY KEY 索
	#引仅是一个具有 PRIMARY 名称的 UNIQUE 索引。这表示一个表只能包含一个
	#PRIMARY KEY
#创建索引	
	#ALTER TABLE tbl_name ADD INDEX index_name (column_list)
	#ALTER TABLE tbl_name ADD UNIQUE index_name (column_list)
	#ALTER TABLE tbl_name ADD PRIMARY KEY index_name (column_list)
#删除索引
	#ALTER TABLE tbl_name DROP INDEX index_name
	#ALTER TABLE tbl_name DROP PRIMARY KEY
ALTER TABLE user1 ADD INDEX user1_index1 (name1,age1);
#查看索引
SHOW INDEX FROM user1;
#索引的使用
CREATE TABLE fenshu (
	NAME VARCHAR(28),
	fenshu INT(3)
);

SELECT * FROM fenshu;

ALTER TABLE fenshu ADD INDEX (fenshu);

SELECT NAME, fenshu FROM fenshu WHERE fenshu<60 ORDER BY fenshu;

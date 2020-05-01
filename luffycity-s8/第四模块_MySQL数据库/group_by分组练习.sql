##### 示例数据
# 表结构：
# mysql> desc employee;
# +--------------+-----------------------+------+-----+---------+----------------+
# | Field        | Type                  | Null | Key | Default | Extra          |
# +--------------+-----------------------+------+-----+---------+----------------+
# | id           | int(11)               | NO   | PRI | NULL    | auto_increment |
# | name         | varchar(20)           | NO   |     | NULL    |                |
# | sex          | enum('male','female') | NO   |     | male    |                |
# | age          | int(3) unsigned       | NO   |     | 28      |                |
# | hire_date    | date                  | NO   |     | NULL    |                |
# | post         | varchar(50)           | YES  |     | NULL    |                |
# | post_comment | varchar(100)          | YES  |     | NULL    |                |
# | salary       | double(15,2)          | YES  |     | NULL    |                |
# | office       | int(11)               | YES  |     | NULL    |                |
# | depart_id    | int(11)               | YES  |     | NULL    |                |
# +--------------+-----------------------+------+-----+---------+----------------+

# 表数据：
# mysql> select * from employee;
# +----+------------+--------+-----+------------+-----------------------------------------+--------------+------------+--------+-----------+
# | id | name       | sex    | age | hire_date  | post                                    | post_comment | salary     | office | depart_id |
# +----+------------+--------+-----+------------+-----------------------------------------+--------------+------------+--------+-----------+
# |  1 | egon       | male   |  18 | 2017-03-01 | 老男孩驻沙河办事处外交大使              | NULL         |    7300.33 |    401 |         1 |
# |  2 | alex       | male   |  78 | 2015-03-02 | teacher                                 | NULL         | 1000000.31 |    401 |         1 |
# |  3 | wupeiqi    | male   |  81 | 2013-03-05 | teacher                                 | NULL         |    8300.00 |    401 |         1 |
# |  4 | yuanhao    | male   |  73 | 2014-07-01 | teacher                                 | NULL         |    3500.00 |    401 |         1 |
# |  5 | liwenzhou  | male   |  28 | 2012-11-01 | teacher                                 | NULL         |    2100.00 |    401 |         1 |
# |  6 | jingliyang | female |  18 | 2011-02-11 | teacher                                 | NULL         |    9000.00 |    401 |         1 |
# |  7 | jinxin     | male   |  18 | 1900-03-01 | teacher                                 | NULL         |   30000.00 |    401 |         1 |
# |  8 | 成龙       | male   |  48 | 2010-11-11 | teacher                                 | NULL         |   10000.00 |    401 |         1 |
# |  9 | 歪歪       | female |  48 | 2015-03-11 | sale                                    | NULL         |    3000.13 |    402 |         2 |
# | 10 | 丫丫       | female |  38 | 2010-11-01 | sale                                    | NULL         |    2000.35 |    402 |         2 |
# | 11 | 丁丁       | female |  18 | 2011-03-12 | sale                                    | NULL         |    1000.37 |    402 |         2 |
# | 12 | 星星       | female |  18 | 2016-05-13 | sale                                    | NULL         |    3000.29 |    402 |         2 |
# | 13 | 格格       | female |  28 | 2017-01-27 | sale                                    | NULL         |    4000.33 |    402 |         2 |
# | 14 | 张野       | male   |  28 | 2016-03-11 | operation                               | NULL         |   10000.13 |    403 |         3 |
# | 15 | 程咬金     | male   |  18 | 1997-03-12 | operation                               | NULL         |   20000.00 |    403 |         3 |
# | 16 | 程咬银     | female |  18 | 2013-03-11 | operation                               | NULL         |   19000.00 |    403 |         3 |
# | 17 | 程咬铜     | male   |  18 | 2015-04-11 | operation                               | NULL         |   18000.00 |    403 |         3 |
# | 18 | 程咬铁     | female |  18 | 2014-05-12 | operation                               | NULL         |   17000.00 |    403 |         3 |
# +----+------------+--------+-----+------------+-----------------------------------------+--------------+------------+--------+-----------+
# 18 rows in set (0.00 sec)

##### 练习：
# 1. 查询岗位名以及岗位包含的所有员工名字
select post, group_concat(name) from employee group by post;
    # +-----------------------------------------+---------------------------------------------------------+
    # | post                                    | group_concat(name)                                      |
    # +-----------------------------------------+---------------------------------------------------------+
    # | operation                               | 张野,程咬金,程咬银,程咬铜,程咬铁                        |
    # | sale                                    | 歪歪,丫丫,丁丁,星星,格格                                |
    # | teacher                                 | alex,wupeiqi,yuanhao,liwenzhou,jingliyang,jinxin,成龙   |
    # | 老男孩驻沙河办事处外交大使              | egon                                                    |
    # +-----------------------------------------+---------------------------------------------------------+
    # 4 rows in set (0.00 sec)

# 2. 查询岗位名以及各岗位内包含的员工个数
select post,count(id) as count from employee group by post;
    # +-----------------------------------------+-------+
    # | post                                    | count |
    # +-----------------------------------------+-------+
    # | operation                               |     5 |
    # | sale                                    |     5 |
    # | teacher                                 |     7 |
    # | 老男孩驻沙河办事处外交大使              |     1 |
    # +-----------------------------------------+-------+
    # 4 rows in set (0.00 sec)

# 3. 查询公司内男员工和女员工的个数
select sex, count(id) as sex_emp_count from employee group by sex;
    # +--------+---------------+
    # | sex    | sex_emp_count |
    # +--------+---------------+
    # | male   |            10 |
    # | female |             8 |
    # +--------+---------------+
    # 2 rows in set (0.00 sec)

# 4. 查询岗位名以及各岗位的平均薪资，最高薪资，最低薪资
select salary, avg(salary), max(salary), min(salary) from employee group by post;
    # +-----------------------------------------+---------------+-------------+-------------+
    # | post                                    | avg(salary)   | max(salary) | min(salary) |
    # +-----------------------------------------+---------------+-------------+-------------+
    # | operation                               |  16800.026000 |    20000.00 |    10000.13 |
    # | sale                                    |   2600.294000 |     4000.33 |     1000.37 |
    # | teacher                                 | 151842.901429 |  1000000.31 |     2100.00 |
    # | 老男孩驻沙河办事处外交大使              |   7300.330000 |     7300.33 |     7300.33 |
    # +-----------------------------------------+---------------+-------------+-------------+
    # 4 rows in set (0.00 sec)

# 7. 查询男员工与男员工的平均薪资，女员工与女员工的平均薪资
select sex, avg(salary) as sex_avg_salary from employee group by sex;
    # +--------+----------------+
    # | sex    | sex_avg_salary |
    # +--------+----------------+
    # | male   |  110920.077000 |
    # | female |    7250.183750 |
    # +--------+----------------+
    # 2 rows in set (0.00 sec)
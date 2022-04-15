#### 5、Oracle查询表空间路径
账号登陆之后一次执行如下语句
```cmd
select * from dba_data_files
```

#### 4、Oracle空表和密码过期问题
sys账号登陆之后一次执行如下语句
```cmd
alter system set deferred_segment_creation=false;

ALTER PROFILE DEFAULT LIMIT PASSWORD_LIFE_TIME UNLIMITED;
```

#### 3、Oracle基于时间点查询所有数据(包含已删除的数据)
```cmd
select * from 表名 as of timestamp to_timestamp('2019-05-08 18:48:00','yyyy-mm-dd hh24:mi:ss');
```

#### 2、Oracle:创建删除用户与表空间
> 连接oracle
```cmd
sqlplus /nolog conn sys/sys@127.0.0.1/orcl as sysdba;
```
> 删除用户与表空间
```cmd
drop user user_name cascade;

drop tablespace tablespace_name INCLUDING CONTENTS;
```
> 创建表空间与用户
```cmd
create tablespace tablespace_name datafile 'tablespace_name.DBF' size 300m autoextend on next 10m maxsize unlimited ;

create user user_name identified by **user_password** default tablespace tablespace_name ;
```
> 授权
```cmd
grant resource,connect,dba to user_name ;
```

#### 1、Oracle导入导出
rows=n : 只导出表结构  
tables=$table_name : 只导出表$table_name

> 导出
```cmd
exp $user/$password@$serverIp/$serverName full=y file='文件位置/文件名.dmp' rows=n tables=$table_name
```

> 导入
```cmd
imp $user/$password@$serverIp/$serverName full=y file='文件位置/文件名.dmp'
```

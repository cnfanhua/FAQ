## 导出、导入命令

### exp 导出

rows=n : 只导出表结构  
tables=$table_name : 只导出表$table_name

```cmd
exp $user/$password@$serverIp/$serverName full=y file='文件位置/文件名.dmp' rows=n tables=$table_name
```

### imp 导入

```cmd
imp $user/$password@$serverIp/$serverName full=y file='文件位置/文件名.dmp'
```

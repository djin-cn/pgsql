# pgsql
基于官方提供的镜像构建，在原有镜像基础上修改了一下内容  
1：支持每天自动备份  
2：设置时区为东8区(上海)  
3：默认开启了慢查询  

### Instruction
备份时间每天凌晨2点，通过cron定时执行；  
可通过环境变量DBBACK指定需要备份的数据库；  
备份目录为/var/lib/postgresql/data/backup；  
备份脚本位置为/var/lib/postgresql/pg_dump.sh，可通过修改此脚本修改备份命令；

### Usage
docker run -d -e DBBACK=postgres --name pgsql a273218159/pgsql9.6

@echo off
setlocal

:: 此bat文件用于分割access.log\error.log两个文件，解决单文件过大的问题
:: 此bat放在nginx.exe同级目录下
set bat_home=%~dp0

:: access文件路径
set access_path=%bat_home%logs\access.log

:: error.log文件路径
set error_path=%bat_home%logs\error.log

:: 日期格式化 yyyy_MM_dd
set filedatetime=%date:~0,10%
set filedatetime=%filedatetime:/=_%

:: access_yyyy_MM_dd.log备份路径
set access_save_path=%bat_home%logs\access_%filedatetime%.log

:: error_yyyy_MM_dd.log备份路径
set error_save_path=%bat_home%logs\error_%filedatetime%.log

:: 停止nginx
echo. 
echo.stop nginx... 
taskkill /F /IM nginx.exe > nul

:: 进入当前目录
cd %bat_home%

:: 复制源文件到新文件，并重写源文件
copy /Y "%access_path%" "%access_save_path%" && echo '' > "%access_path%"

copy /Y "%error_path%" "%error_save_path%" && echo '' > "%error_path%"

if errorlevel 0 (
:: 启动nginx
start nginx.exe
)

if errorlevel 1 (
:: '文件复制失败'
)

if errorlevel 2 (
:: '用户按CTRL+C终止'
)

if errorlevel 4 (
:: '出现了初始化错误'
)

if errorlevel 5 (
:: '出现了磁盘写入错误'
)

::pause
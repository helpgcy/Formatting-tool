@echo off

REM 获取当前脚本的版本号和作者信息
set currentVersion=1.0.0
set author=GCY

REM 下载最新的脚本文件
echo 正在获取最新的脚本文件...
powershell -command "Invoke-WebRequest -Uri https://raw.githubusercontent.com/helpgcy/Formatting-tool/main/format.bat -OutFile format_new.bat"

REM 比较版本号，判断是否需要更新
fc /b format.bat format_new.bat > nul
if %errorlevel% equ 0 (
    echo 脚本已经是最新版本，无需更新。
) else (
    echo 更新可用，正在替换脚本文件...
    del format.bat
    ren format_new.bat format.bat
)

REM 显示可用磁盘列表
echo 可用磁盘列表：
wmic logicaldisk get deviceid

REM 提示用户输入要格式化的磁盘序号
set /p diskNum=请输入要格式化的磁盘序号： 

REM 拼接磁盘号，格式化磁盘
echo 正在格式化磁盘 %diskNum% ，请稍等...
format %%diskNum%% /q /y /fs:ntfs
echo 磁盘格式化已完成！

REM 显示脚本的作者信息和版本号
echo.
echo 本脚本由 %author% 编写，当前版本号为 %currentVersion%。

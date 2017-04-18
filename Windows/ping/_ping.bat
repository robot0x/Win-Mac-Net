@echo off 2>nul 3>nul

echo %date%%time% >> result_ping.log

setlocal enabledelayedexpansion

rem "route PRINT" 的输出第一行第三列为默认网关，例如在我的电脑上显示 "0.0.0.0		0.0.0.0		172.20.16.1		172.20.18.226		20"
rem "[^0-9]0.0.0.0" 正则表达式，只要 0.0.0.0 的那一行
rem "tokens=3" 表示读取第3列参数
for /f "tokens=3" %%i in ('route PRINT ^| findstr "[^0-9]0.0.0.0" ') do (
	start test_ping.bat %%i 0
)

rem 下面是 ping 文件里的 ip
for /f %%i in (MyIp.txt) do (
    set /a n += 1
	start test_ping.bat %%i !n!
)

echo 请等待所有窗口关闭再按继续...
pause
call :ping

rem 将目录下所有 *.tmp 文件整合到一个文件中
:ping
ren p*.tmp p*.end >nul
copy /b result_ping.log + p*.end result_ping.log >nul&&del /f /q *.end >nul
if not exist p*.tmp (
	exit
) else goto ping
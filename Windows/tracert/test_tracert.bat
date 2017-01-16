@echo off 2>nul 3>nul

echo %date%%time% >> result_tracert.log

setlocal enabledelayedexpansion

rem 下面是tracert默认网关
rem 正则表达式提取出来的语句，例如 "默认网关. . . . . . . . . . . . . : 192.168.11.1"
rem 第15个参数（空格分割）显示默认网关，tokens=15表示读取第15个参数
for /f "tokens=15" %%i in ('ipconfig -all ^| findstr "默认网关" ^| findstr "[0-9]*.[0-9]*.[0-9]*.[0-9]$"') do (
	start _tracert.bat %%i 0
)

rem 下面是tracert文件里的ip
for /f %%i in (MyIp.txt) do (
    set /a n+=1
	start _tracert.bat %%i !n!
)

echo 请等待所有窗口关闭再按继续...
pause
call :tracert

:tracert
ren t*.tmp t*.end >nul
copy /b result_tracert.log + t*.end result_tracert.log >nul&&del /f /q *.end >nul
if not exist t*.tmp (
	exit
) else goto tracert
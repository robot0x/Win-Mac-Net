@echo off 2>nul 3>nul

echo %date%%time% >> result_ping.log

setlocal enabledelayedexpansion

rem ������pingĬ������
rem ������ʽ��ȡ��������䣬���� "Ĭ������. . . . . . . . . . . . . : 192.168.11.1"
rem ��15���������ո�ָ��ʾĬ�����أ�tokens=15��ʾ��ȡ��15������
for /f "tokens=15" %%i in ('ipconfig -all ^| findstr "Ĭ������" ^| findstr "[0-9]*.[0-9]*.[0-9]*.[0-9]$"') do (
	start _ping.bat %%i 0
)

rem ������ping�ļ����ip
for /f %%i in (MyIp.txt) do (
    set /a n += 1
	start _ping.bat %%i !n!
)

echo ��ȴ����д��ڹر��ٰ�����...
pause
call :ping

:ping
ren p*.tmp p*.end >nul
copy /b result_ping.log + p*.end result_ping.log >nul&&del /f /q *.end >nul
if not exist p*.tmp (
	exit
) else goto ping
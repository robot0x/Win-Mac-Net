@echo off 2>nul 3>nul

echo %date%%time% >> result_tracert.log

setlocal enabledelayedexpansion

rem ������tracertĬ������
rem ������ʽ��ȡ��������䣬���� "Ĭ������. . . . . . . . . . . . . : 192.168.11.1"
rem ��15���������ո�ָ��ʾĬ�����أ�tokens=15��ʾ��ȡ��15������
for /f "tokens=15" %%i in ('ipconfig -all ^| findstr "Ĭ������" ^| findstr "[0-9]*.[0-9]*.[0-9]*.[0-9]$"') do (
	start _tracert.bat %%i 0
)

rem ������tracert�ļ����ip
for /f %%i in (MyIp.txt) do (
    set /a n+=1
	start _tracert.bat %%i !n!
)

echo ��ȴ����д��ڹر��ٰ�����...
pause
call :tracert

:tracert
ren t*.tmp t*.end >nul
copy /b result_tracert.log + t*.end result_tracert.log >nul&&del /f /q *.end >nul
if not exist t*.tmp (
	exit
) else goto tracert
@echo off 2>nul 3>nul

echo %date%%time% >> result_tracert.log

setlocal enabledelayedexpansion

rem "route PRINT" �������һ�е�����ΪĬ�����أ��������ҵĵ�������ʾ "0.0.0.0		0.0.0.0		172.20.16.1		172.20.18.226		20"
rem "[^0-9]0.0.0.0" ������ʽ��ֻҪ 0.0.0.0 ����һ��
rem "tokens=3" ��ʾ��ȡ��3�в���
for /f "tokens=3" %%i in ('route PRINT ^| findstr "[^0-9]0.0.0.0" ') do (
	start test_tracert.bat %%i 0
)

rem ������tracert�ļ����ip
for /f %%i in (MyIp.txt) do (
    set /a n+=1
	start test_tracert.bat %%i !n!
)

echo ��ȴ����д��ڹر��ٰ�����...
pause
call :tracert

rem ��Ŀ¼������ *.tmp �ļ����ϵ�һ���ļ���
:tracert
ren t*.tmp t*.end >nul
copy /b result_tracert.log + t*.end result_tracert.log >nul&&del /f /q *.end >nul
if not exist t*.tmp (
	exit
) else goto tracert
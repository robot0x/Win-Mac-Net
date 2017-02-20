@echo off
rem �ı���������ɫ
color 0A

rem ��¼������ʱ��
echo ---------------------------------------------  >> all.log
echo %date%%time% >> all.log

:test
rem ��Ӧ�����İ���
echo 		---------------------------------------------
echo 		[0]quit				[1]ipconfig
echo 		[2]nslookup			[3]arp -a -d -a
echo 		[4]all_test
echo 		---------------------------------------------

rem �����û�������
set /p input=�������Ӧ�����İ�����

rem quit
if "%input%"=="0" (
call :quit
)

rem ipconfig
if "%input%"=="1" (
call :ipconfig all.log
)

rem nslookup
if "%input%"=="2" (
call :nslookup all.log
)

rem arp
if "%input%"=="3" (
call :arp all.log
)

rem all_test
if "%input%"=="4" (
call :ipconfig all.log
call :nslookup all.log
call :arp all.log
)

rem �����û�����0����һֱѭ��
goto :test

rem ����Ϊ�������
goto :eof
:quit
start all.log
exit

goto :eof
:ipconfig
echo ---------------------------------------------  >> %1
echo ipconfig status: >> %1
ipconfig | tee.exe -a %1

goto :eof
:nslookup
echo ---------------------------------------------  >> %1
echo nslookup status: >> %1
for /f %%i in (MyIp.txt) do (
echo. >> %1
echo %%i >> %1
nslookup %%i | tee.exe -a %1
)

goto :eof
:arp
echo ---------------------------------------------  >> %1
echo arp status: >> %1
arp -a | tee.exe -a %1
arp -d | tee.exe -a %1
arp -a | tee.exe -a %1
@echo off 2>nul 3>nul

echo ---------------------------------------------  >> test.log

ping -n 10 www.jnu.edu.cn | TEE.exe test.log

echo ---------------------------------------------  >> test.log

pause
exit
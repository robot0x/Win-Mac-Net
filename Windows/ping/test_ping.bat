@echo off

echo ---------------------------------------------  >> p%2.tmp
ping -n 10 %1 | tee.exe -a p%2.tmp

exit
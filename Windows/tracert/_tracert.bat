@echo off

echo ---------------------------------------------  >> t%2.tmp
tracert -d %1 | tee.exe -a t%2.tmp

exit
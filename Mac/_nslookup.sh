#!/bin/sh
date | tee -a nslookup_test.log

for ip in $(cat MyIp.txt | cut -d '$' -f 1)
do
echo "----------------------------------------" >> nslookup_test.log
nslookup $ip | tee -a nslookup_test.log
echo "----------------------------------------" >> nslookup_test.log
done

vim nslookup_test.log

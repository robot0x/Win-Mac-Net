#!/bin/sh
echo "!!!!!!!!!!Start!!!!!!!!!!" >> tracert_test.log
date | tee -a tracert_test.log

n=1

# tracert默认网关
default=`netstat -r | grep "default" | awk '{print $2}'`
(traceroute -n $default | tee -a "tracert"$n".tmp")&

# traceroute文件里的ip
for ip in $(cat MyIp.txt | cut -d '$' -f 1)
do
n=`expr $n + 1`
(traceroute -n $ip | tee -a "tracert"$n".tmp")&
done

# 等待所有后台执行完毕
wait

# 将tracert的输出文件全部重定向到tracert文件
for ip in $(find . -type f -name "tracert*.tmp")
do
    echo "----------------------------------------" >> tracert_test.log
    cat $ip >> tracert_test.log
    echo "----------------------------------------" >> tracert_test.log
    rm -f $ip
done

echo "!!!!!!!!!!End!!!!!!!!!!\n\n" >> tracert_test.log
vim tracert_test.log

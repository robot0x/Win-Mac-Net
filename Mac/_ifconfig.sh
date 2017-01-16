#!/bin/sh
date | tee -a ifconfig_test.log

echo "---------------------------------------------" | tee -a ifconfig_test.log
ifconfig | tee -a ifconfig_test.log
echo "---------------------------------------------" | tee -a ifconfig_test.log

vim ifconfig_test.log

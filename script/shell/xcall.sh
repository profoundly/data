#!/bin/bash

red='\e[91m'
green='\e[92m'
yellow='\e[93m'
magenta='\e[95m'
cyan='\e[96m'
none='\e[0m'

cluster_array=(hadoop1 hadoop2 hadoop3)

# 1. 获取输入参数个数，如果没有参数，直接退出
argcount=$#
if ((argcount == 0)); then
    echo -e ------------------- ${yellow}no args${none} -------------------
    exit
fi

# 2. 循环执行命令
command=$@
for host in ${cluster_array[@]}; do
    echo -e ------------------- $yellow$host$none -------------------
    ssh $host $command
done

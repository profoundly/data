#!/bin/bash

red='\e[91m'
green='\e[92m'
yellow='\e[93m'
magenta='\e[95m'
cyan='\e[96m'
none='\e[0m'

kafka_home=$KAFKA_HOME
cluster_array=(hadoop1 hadoop2 hadoop3)

# 1. 获取输入参数个数，如果没有参数，直接退出
if (($# == 0)); then
    echo -e ------------------- ${yellow}no args${none} -------------------
    exit
fi

# 2. 根据指令循环操作集群
case $1 in
"start") {
    for host in ${cluster_array[@]}; do
        echo -e ------------------- $yellow$host$none -------------------
        ssh $host "$kafka_home/bin/kafka-server-start.sh -daemon $kafka_home/config/server.properties"
    done
} ;;

"stop") {
    for host in ${cluster_array[@]}; do
        echo -e ------------------- $yellow$host$none -------------------
        ssh $host "$kafka_home/bin/kafka-server-stop.sh"
    done
} ;;

esac

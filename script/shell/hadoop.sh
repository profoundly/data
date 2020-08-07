#!/bin/bash

red='\e[91m'
green='\e[92m'
yellow='\e[93m'
magenta='\e[95m'
cyan='\e[96m'
none='\e[0m'

hadoop_home=$HADOOP_HOME
namenode=hadoop1
resourcemanager=hadoop2

cluster_array=(hadoop1 hadoop2 hadoop3)

# 1. 获取输入参数个数，如果没有参数，直接退出
if (($# == 0)); then
    echo -e ------------------- ${yellow}no args${none} -------------------
    exit
fi

# 2. 根据指令操作集群
case $1 in
"start") {
    echo -e ------------------- ${yellow}starting HDFS$none -------------------
    ssh $namenode "$hadoop_home/sbin/start-dfs.sh"

    echo -e ------------------- ${yellow}starting Yarn$none -------------------
    ssh $resourcemanager "$hadoop_home/sbin/start-yarn.sh"
} ;;

"stop") {
    echo -e ------------------- ${yellow}stoping HDFS$none -------------------
    ssh $namenode "$hadoop_home/sbin/stop-dfs.sh"

    echo -e ------------------- ${yellow}stoping Yarn$none -------------------
    ssh $resourcemanager "$hadoop_home/sbin/stop-yarn.sh"
} ;;

"format") {
    echo -e ------------------- ${yellow}formating$none -------------------
    for host in ${cluster_array[@]}; do
        ssh $host "rm -rf $hadoop_home/data/* $hadoop_home/logs/*"
    done

    ssh $namenode "$hadoop_home/bin/hdfs namenode -format"
} ;;

esac

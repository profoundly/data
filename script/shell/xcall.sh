#!/bin/bash

red='\e[91m'
green='\e[92m'
yellow='\e[93m'
magenta='\e[95m'
cyan='\e[96m'
none='\e[0m'

java_home=$JAVA_HOME
cluster_array=(hadoop1 hadoop2 hadoop3)

for host in ${cluster_array[@]}; do
    echo -e ------------------- $yellow$host$none -------------------
    ssh $host "$java_home/bin/jps"
done

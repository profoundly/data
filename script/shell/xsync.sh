#!/bin/bash

red='\e[91m'
green='\e[92m'
yellow='\e[93m'
magenta='\e[95m'
cyan='\e[96m'
none='\e[0m'

slave_array=(hadoop2 hadoop3)

# 1. 获取输入参数个数，如果没有参数，直接退出
argcount=$#
if ((argcount == 0)); then
    echo -e ------------------- ${yellow}no args${none} -------------------
    exit
fi

# 2. 获取文件名称
arg=$1
file=$(basename $arg)

# 3. 获取上级目录到绝对路径
directory=$(
    cd -P $(dirname $arg)
    pwd
)

# 4. 获取当前用户名称
user=$(whoami)

# 5. 确认
echo -e "user is ${cyan}$user${none}"
echo -e "file is ${cyan}$directory/$file${none}"
echo -e "Are you sure to continue? [${magenta}y/n$none]"
read -p "$(echo -e "Default [${magenta}y$none]: ")" input
[ -z $input ] && input="y"

if [[ $input == [Nn] ]]; then
    exit
fi

# 6. 循环 rsync
for host in ${slave_array[@]}; do
    echo -e ------------------- $yellow$host$none -------------------
    rsync -rvl --delete --ignore-errors $directory/$file $user@$host:$directory
done

#!/bin/bash

NUM_OF_CASE=`awk '{print NR}' log.txt | tail -n 1`

echo 'Number of cases: '$NUM_OF_CASE

echo -n "Please specify the prefix for these cases (default 'first'): "
read PREFIX
if [[ $PREFIX = '' ]]
then
    PREFIX='first'
fi

for i in $( seq 1 $NUM_OF_CASE )
do
    echo 'case '$i' ...'
    # 用icc命令编译实在太原始
    # 代码、编译文件、运行出的数据在同一级目录下也是不理想的
    # 推荐使用cmake进行管理
    cd $i && icc -o ${PREFIX}${i}.out *.cpp && nohup.sh ${PREFIX}${i}.out && cd ..
done

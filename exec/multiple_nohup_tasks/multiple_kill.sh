#!/bin/bash

echo -n "Please specify the prefix for these cases (default 'first'): "
read PREFIX
if [[ $PREFIX = '' ]]
then
    PREFIX='first'
fi

echo ''
NUM_OF_PROCESSES=0
ALL_PID=`ps aux | grep ${USER} | grep ${PREFIX}.*.out | grep -v grep | awk '{ print $2 }'`
for i in ${ALL_PID}
do
    echo -ne `ps aux |grep -v grep | grep $i | awk '{ print $11 }'`
    echo ' ('$i')'
    NUM_OF_PROCESSES+=1
done

if [[ $NUM_OF_PROCESSES -eq "0" ]]
then
    echo "No running case found."
    exit
fi

echo -en '\nKill all processes listed above? (y/n) '
read REPLY
if [[ $REPLY != 'y' ]]
then
    exit
fi

echo ''
for i in ${ALL_PID}
do
    echo -ne 'killing '
    echo -ne `ps aux |grep -v grep | grep $i | awk '{ print $11 }'`
    echo ' ('$i') ...'
    kill -9 $i
done

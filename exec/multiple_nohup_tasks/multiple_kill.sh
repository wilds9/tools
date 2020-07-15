#!/bin/bash

for i in `ps aux | grep $USER | grep case | grep -v grep | awk '{ print $2 }'`
do
    echo -ne 'killing '
    echo -ne `ps aux |grep -v grep | grep $i | awk '{ print $11 }'`
    echo '('$i') ...'
    # kill -9 $i
done 

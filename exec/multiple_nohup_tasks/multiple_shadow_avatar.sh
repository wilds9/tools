#!/bin/bash

echo -en "Add comment to each case? (y/n): "
read ADD_COMMENT

for i in {1..20}
do
    rm -rf $i/
    rm -f log.txt
done

for i in {1..20}
do
    echo ""
    echo "case "$i":"

    echo -en "Replace {{var1}} with: "
    read STRING
    cp -r template/ $i/
    for SUB_FILE in `find $i/ -type f`
    do
	sed -i "s/{{var1}}/$STRING/g" $SUB_FILE
    done

    HEAD="comment for case $i:"
    if [[ $ADD_COMMENT = 'y' ]]
    then
	echo -en $HEAD' '
	read CASE_LOG
    else
	CASE_LOG='none'
    fi
    echo $HEAD $CASE_LOG >> log.txt
done


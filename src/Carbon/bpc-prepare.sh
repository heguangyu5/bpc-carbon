#!/bin/bash

[[ "$1" == "" ]] && {
    echo "Usage: ./bpc-prepare.sh src.list"
    exit
}

rm -rf ./Carbon
rsync -a                        \
      --exclude=".*"            \
      -f"+ */"                  \
      -f"- *"                   \
      ./                        \
      ./Carbon

for i in `cat $1`
do
    if [[ "$i" == \#* ]]
    then
        echo $i
    else
        filename=`basename -- $i`
        if [ "${filename##*.}" == "php" ]
        then
            echo "phptobpc $i"
            phptobpc $i > ./Carbon/$i
        else
            echo "cp       $i"
            cp $i ./Carbon/$i
        fi
    fi
done
cp bpc.conf src.list Makefile ./Carbon/

phptobpc ../../lazy/Carbon/TranslatorWeakType.php > ./Carbon/TranslatorWeakType.php
phptobpc ../../lazy/Carbon/MessageFormatter/MessageFormatterMapperStrongType.php > ./Carbon/MessageFormatter/MessageFormatterMapperStrongType.php

echo TranslatorWeakType.php >> ./Carbon/src.list
echo MessageFormatter/MessageFormatterMapperStrongType.php >> ./Carbon/src.list

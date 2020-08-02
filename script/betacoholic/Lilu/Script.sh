#!/bin/bash

#  Script.sh
#  
#
#  Created by Baddles Nguyễn on 6/17/20.
#  

GETTYPE=$1
TYPE=$(echo $GETTYPE | tr a-z A-Z)
PWD=$(pwd)
SCRIPTDIR=$(dirname $0)
cd $SCRIPTDIR
dir1="${0%/*}"
echo $dir1
echo "basename: `basename $0`"
echo "dirname: `dirname $0`"
echo "dirname/readlink: $(dirname $(readlink -f $0))"

dir="${0%/*}"
echo $dir
exit
if [[ "$TYPE" != "DEBUG" ]] && [[ "$TYPE" != "RELEASE" ]]
then
    echo "Invalid type!"
    exit
fi

VERSION_ID=$(curl https://api.github.com/repos/acidanthera/OpenCorePkg/releases/latest | grep \"name\": | cut -d " " -f 4 | tr -d "\"" | tr -d "," | grep .)
FILE_NAME=$(curl https://api.github.com/repos/acidanthera/OpenCorePkg/releases/latest | grep \"name\": | cut -d " " -f 8 | tr -d "\"" | tr -d "," | grep "DEBUG")
curl -LJO https://github.com/acidanthera/OpenCorePkg/releases/download/${VERSION_ID}/${FILE_NAME} -O $(echo "$dir")
FOLDER=$(echo $FILE_NAME | cut -d "." -f 1)
unzip $FILE_NAME -d ${FILE_NAME%.zip}

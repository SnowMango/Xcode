#!/bin/sh
#  syntaxcolor.sh
#  Created by zhengfeng on 2018-04-03.
#  Copyright © 2018年 guange. All rights reserved.

set -e

XCDODE_APP="/Applications/Xcode.app"

XCLANGSPEC_DIR="${XCDODE_APP}/Contents/SharedFrameworks/DVTFoundation.framework/Versions/A/Resources/"

absolute_path()
{
    FILE_PATH="$1"
    FILE_ROOT=`dirname $FILE_PATH`
    if [ "$FILE_ROOT" == "." ]
    then
        echo "`pwd`/${FILE_PATH#*/}"
    else
        echo "$FILE_PATH"
    fi
}

install(){
    local XCLANGSPEC_FILE=`absolute_path $1`

    if [ ! -f "$XCLANGSPEC_FILE" ];then
        echo "文件不存在"
    elif [ "${XCLANGSPEC_FILE##*.}" != "xclangspec" ]
    then
        echo "不是xcode语法着色文件"
    else
        sudo cp -R $XCLANGSPEC_FILE "$XCLANGSPEC_DIR/${XCLANGSPEC_FILE##*/}"
        echo "install ${XCLANGSPEC_FILE} finish"
    fi
}
uninstall()
{
    local XCLANGSPEC_FILE="${XCLANGSPEC_DIR}/$1"
    if [ ! -f "$XCLANGSPEC_FILE" ];then
        echo "文件不存在"
    else
        echo "delete ${XCLANGSPEC_FILE}"
        sudo rm -r ${XCLANGSPEC_FILE}
    fi
}

bool_command(){
    COMMAND=("install" "uninstall");
    BOOL="NO"
    for cmd in ${COMMAND[*]}; do
        if [ "$1" = "$cmd" ]; then
            BOOL="YES"
        fi
    done
    echo ${BOOL}
}

if [ `bool_command $1` = "YES" ]
then
    $1 $2
else
    echo "$0 support command ${COMMAND[@]}"
fi



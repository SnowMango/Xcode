#!/bin/sh
#  language.sh
#  Created by zhengfeng on 2018-04-03.
#  Copyright © 2018年 guange. All rights reserved.

set -e
PLISTBUDDY=/usr/libexec/PlistBuddy

XCDODE_APP="/Applications/Xcode.app"

DVTFOUNDATION_DIR="${XCDODE_APP}/Contents/SharedFrameworks/DVTFoundation.framework/Versions/A/Resources/"

DVTFOUNDATION_NAME="DVTFoundation.xcplugindata"

DVTFOUNDATION_FILE="${DVTFOUNDATION_DIR}/${DVTFOUNDATION_NAME}"

#DVTFOUNDATION_FILE="/Users/zhengfeng/Desktop/Podfile-Xcode/PodfileSyntaxColor/2-添加文件识别语法/DVTFoundation-modify.xcplugindata"
INSTALL_SPACE=":plug-in:extensions"

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

install()
{
    PLIST_FILE=`absolute_path $1`
    sudo $PLISTBUDDY "${DVTFOUNDATION_FILE}"  -c "Merge ${PLIST_FILE} ${INSTALL_SPACE}"
    echo "install $1 finish"
}

uninstall(){
    echo "delete $1"
    sudo $PLISTBUDDY "${DVTFOUNDATION_FILE}"  -c "Delete :${INSTALL_SPACE}:$1"
}

function bool_command(){
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


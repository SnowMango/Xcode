#!/bin/sh
#  codesnippet.sh
#  Created by zhengfeng on 2018-04-04.
#  Copyright © 2018年 guange. All rights reserved.

USER=~
CODESNIPPET_DIR="$USER/Library/Developer/Xcode/UserData/CodeSnippets"
mkdir -p $CODESNIPPET_DIR

absolute_path()
{
    local FILE_PATH="$1"
    local FILE_ROOT=`dirname $FILE_PATH`
    if [ "$FILE_ROOT" == "." ]
    then
        echo "`pwd`/${FILE_PATH#*/}"
    else
        echo "$FILE_PATH"
    fi
}

install_file()
{
    local FILE_PATH=`absolute_path $1`
    local FILE_NAME="${FILE_PATH##*/}"
    local SUFF="${FILE_NAME##*.}"
    local NAME="${FILE_NAME%.*}"

    if [ -f "$FILE_PATH" ]
    then
        if [ "$SUFF" == "codesnippet" ];then
            cp -R "$FILE_PATH" "${CODESNIPPET_DIR}/${NAME}.codesnippet"
        fi
    fi
}

uninstall_file()
{
    local TM=$(pwd)
    cd "$CODESNIPPET_DIR"
    local FILE_PATH=`absolute_path $1`
    local FILE_NAME="${FILE_PATH##*/}"
    local SUFF="${FILE_NAME##*.}"
    if [ -f "$FILE_PATH" ]
    then
        if [ "$FILE_NAME" == "SUFF" ];then
            rm -r "${FILE_PATH}.codesnippet"
        elif [ "$SUFF" == "codesnippet" ];then
            rm -r "${FILE_PATH}"
        fi
    fi
    cd $TM
}

COMMAND=("install" "uninstall");
function bool_command(){

    local BOOL=0
    for cmd in ${COMMAND[*]}; do
        if [ "$1" = "$cmd" ]; then
            BOOL=1
        fi
    done
    return $BOOL
}
install()
{
    cd `dirname $0`
    A=$(ls |  sed -n '/.codesnippet/p' )
    for name in $A
    do
        install_file $name
    done
}
uninstall()
{
    cd `dirname $0`
    A=$(ls |  sed -n '/.codesnippet/p' )
    for name in $A
    do
        uninstall_file $name
    done
}

bool_command $1
if [ $? ]
then
    $1
else
    echo "$0 support command ${COMMAND[@]}"
fi



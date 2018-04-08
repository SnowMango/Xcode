#!/bin/sh
#  podfile-xcode.sh
#  Created by zhengfeng on 2018-04-04.
#  Copyright © 2018年 guange. All rights reserved.
CODESNIPPET=./CodeSnippets/codesnippet.sh
SYNTAX=./PodfileSyntaxColor/PodfileSyntaxColor.sh
cd `dirname $0`
function restore()
{
    sh $SYNTAX uninstall
    sh $CODESNIPPET uninstall
}
function install()
{
    sh $SYNTAX install
    sh $CODESNIPPET install
}
function codesnippet(){
    sh $CODESNIPPET install
}

COMMAND=("install" "restore" "codesnippet");
function bool_command(){
    local BOOL=0
    for cmd in ${COMMAND[*]}; do
        if [ "$1" = "$cmd" ]; then
            BOOL=1
        fi
    done
    return $BOOL
}

bool_command $1
if [ $? ]
then
    $1
else
    echo "$0 support command ${COMMAND[@]}"
fi

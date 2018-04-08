#!/bin/sh
#  rename.sh
#  Created by zhengfeng on 2018-04-08.
#  Copyright © 2018年 guange. All rights reserved.


PLISTBUDDY=/usr/libexec/PlistBuddy

CODESNIPPET_DIR="$1"
Rename(){
    codesnippets=$(ls | sed -n '/.codesnippet/p')
    #IDECodeSnippetIdentifier IDECodeSnippetTitle
    OPT="print :IDECodeSnippetTitle"
    for file in $codesnippets
    do
        rename=$($PLISTBUDDY "${file}"  -c "$OPT" | sed "s/[ ][ ]*/_/g")
        echo $rename
        mv -f "$file" "${rename}.codesnippet"
    done
}
if [ -d "$CODESNIPPET_DIR" ]
then
    cd $CODESNIPPET_DIR
    Rename
else
    echo "directory no find"
fi

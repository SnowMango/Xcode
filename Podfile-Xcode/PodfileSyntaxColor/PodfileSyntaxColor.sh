#!/bin/bash

#  Created by Alex Karahalios on 6/12/11
#  Edited by Brian Reinhart on 08/02/2012.
#  Last edited by Mark Klara (MrHappyAsthma) on 08/29/2016.
#

#
cd `dirname $0`
SPEC=./1-语法着色/syntaxcolor.sh
PLIST=./2-添加文件识别语法/language.sh
podfile_install(){
    sh $SPEC install ./1-语法着色/Podfile.xclangspec
    sh $PLIST install ./2-添加文件识别语法/Xcode.MagicFileDataTypeDetector.Podfile.plist
    sh $PLIST install ./2-添加文件识别语法/Xcode.SourceCodeLanguage.Podfile.plist
}
podfile_uninstall(){

    sh $SPEC uninstall "Podfile.xclangspec"
    sh $PLIST uninstall "Xcode.MagicFileDataTypeDetector.Podfile"
    sh $PLIST uninstall "Xcode.SourceCodeLanguage.Podfile"
}
COMMAND=("install" "uninstall");
bool_command(){
    local BOOL="NO"
    for cmd in ${COMMAND[*]}; do
        if [ "$1" = "$cmd" ]; then
            BOOL="YES"
        fi
    done
    echo ${BOOL}
}
if [ `bool_command $1` = "YES" ]
then
    podfile_$1
# Remove any cached Xcode plugins
#
    rm -f /private/var/folders/*/*/*/com.apple.DeveloperTools/*/Xcode/PlugInCache*.xcplugincache
else
    echo "$0 support command ${COMMAND[@]}"
fi


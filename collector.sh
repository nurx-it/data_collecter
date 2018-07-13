#!/bin/bash
#copies important user files to one directory on admin desktop

if [ $# != 1 ]
then
    echo Usage: provide name of user directory to be saved 
    exit
fi
date=`date +%F`
if [ ! -d /Users/$1 ]
then
    echo 'WARNING!'
    echo 'Username doesnt exist, please enter correct username'
    read answer
    if [ ! -d /Users/$answer ]
    then
        echo 'Wrong again! Go home - yur drunk'
        exit
    fi
    mkdir ~/Desktop/$answer_$date
    cp -R /Users/$answer/Desktop ~/Desktop/$answer_$date
    cp -R /Users/$answer/Documents ~/Deskstop/$answer_$date
    chmod -R 755 ~/Desktop/$answer_$date
    echo 'copy complete'
    zip -r ~/Desktop/$answer_$date.zip ~/Desktop/$answer_$date
    echo 'zip complete'
    rm -r ~/Desktop/$answer_$date
    echo 'temp files deleted'
else 
    mkdir ~/Desktop/$1_$date
    cp -R /Users/$1/Desktop ~/Desktop/$1_$date
    cp -R /Users/$1/Documents ~/Desktop/$1_$date
    chmod -R 755 ~/Desktop/$1_$date
    echo 'copy complete'
    zip -r ~/Desktop/$1_$date.zip ~/Desktop/$1_$date
    echo 'zip complete'
    rm -r ~/Desktop/$1_$date
    echo 'temp files deleted'
fi
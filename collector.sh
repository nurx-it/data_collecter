#!/bin/bash

echo
echo !!!IMPORTANT!!! RUN USING SUDO
echo
echo Usage: enter the name of the user directory you want zipped
USERNAME="nul"
until [ -d /Users/$USERNAME ]
do
    if [ $USERNAME == "exit" ]
        then
        echo "exiting"
        exit
        else 
        echo "Please enter valid user name or exit to escape"
        read -p "User's name: " USERNAME
    fi
done

date=`date +%F`
mkdir ~/Desktop/$USERNAME-$date
cp -R /Users/$USERNAME/Desktop ~/Desktop/$USERNAME-$date
cp -R /Users/$USERNAME/Documents ~/Desktop/$USERNAME-$date
chmod -R 755 ~/Desktop/$USERNAME-$date
echo 'copy complete'
zip -r ~/Desktop/$USERNAME-$date.zip ~/Desktop/$USERNAME-$date
echo 'zip complete'
rm -r ~/Desktop/$USERNAME-$date
echo 'temp files deleted'
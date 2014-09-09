#!/bin/bash
# Init
bnumber="/root/NOT_REMOVE/b_number"
buildversions="/root/NOT_REMOVE/build_versions"
i=$(($(cat $bnumber)+1))
DIRparent="/root/ebs-ui-server_$i"
DIRchild="$DIRparent/sapphire"
linkToDelete="/root/UICurrent"
git_ssh="git@github.com:EBSISRAEL/sapphire.git"
git_https="https://github.com/EBSISRAEL/sapphire.git"

# custom functions lib
mylib=mylib.sh
. "$mylib"
if ! [ -e "$mylib" ];
then
	echo -e "\e[31mError: there is no such file as $mylib\e[0m" 1>&2
	exit 1
fi

# To execute or not to execute
areSureStartMessage="This script would create a new build of UI. Are you sure to continue? (y/n)"
areSureStopMessage="Script execution stopped by user"
areSureSuccessMessage=""
areSure

# Making sure that only root can run the script
if [ "$(id -u)" != "0" ]; then
   echo -e "\e[31mThis script must be run as root\e[0m" 1>&2
   exit 1
fi

# Creating new application directory, deleting the old symbolic link (if it exists) and creating a new one
cd /root
mkdir -v $DIRparent
checkLinkAndDel
ln -s -v $DIRparent UICurrent

# Getting files from Git and installing
cd $DIRparent
git clone "$git_ssh"
cd $DIRchild
npm install
bower install --allow-root
gulp

# Adding counter to the version
echo "Build # $i | $(date)" >> $buildversions
echo $i > $bnumber
echo -e "\e[32mBuild #$i, record added to /root/NOT_REMOVE/build_versions\e[0m"
cd $DIRchild

# Starting the UI server
# To launch the application or not
areSureStartMessage="Do you want to launch node server/app.js? (y/n)"
areSureStopMessage="node server/app.js is not launched"
areSureSuccessMessage="launching node server/app.js..."
areSure
node server/app.js & > nodejs_output.log 
sleep 4s
echo -e "\e[33mps -aef |grep node\e[0m"
ps -aef |grep node
exit 0
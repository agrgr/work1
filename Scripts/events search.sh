#!/bin/sh
FILE='/export/home/mof/installers/MdsMsg.txt'
EGREP='/bin/egrep'
	echo "Searching for events in logs";
	printf "\n"
	echo -e "\t\033[1;4;34mEvent not found\033[0m    \t\033[1;4;34mEvent found\033[0m"
	printf "\n"

	if [ -z "$FILE" ]; then
       		exit;
	fi;
#
for LINE in `cat $FILE`; do

		MSGID="`$EGREP --color $LINE *|$EGREP "mds_main|mds_monitor"|uniq -u|awk '{print $1}' | sed 's/:\(.*\).*/\s/'`";

	if [ -z "$MSGID" ]; then
		echo -e "\t\e[1;31;40m $LINE\e[0m";
	else
		#echo -e ''$green'...event [ '$LINE' ] found in '$MSGID' log';
		echo -e "\t\t\t\t\e[1;32;40m $LINE \e[0m"

	fi;
done;
printf "\n"
exit;

areSure()
{
local AMSURE
echo -e "\e[33m$areSureStartMessage\e[0m"
read AMSURE
if [ "$AMSURE" = "y" ];
then
	echo -e "\n\e[32m$areSureSuccessMessage\e[0m"
	return 0
else
	echo -e "\n\e[31m$areSureStopMessage\e[0m" 1>&2
	exit 1
	fi
echo "" 1>&2
}

checkLinkAndDel()
{ 
if [ -h "$linkToDelete" ];
then 
	rm -f -v $linkToDelete
	echo "" 1>&2
fi
}
#!/bin/bash
file1="./BASE_TIMERS"
file2="./APPCMPT_JVM_LNUX"
file3="./ADDUTIL_TOMCAT2_LNX"
file4="./APPCMPT_PET_USER_LNUX"
file5="./APPCMPT_PET_CORE_LNUX"
if [ -e $file1 ]; then
    echo -e "\e[32m$file1\e[0m"
    else
        echo -e "\e[31m$file1\e[0m"
fi

if [ -e $file2 ]; then
    echo -e "\e[32m$file2\e[0m"
        else
                echo -e "\e[31m$file2\e[0m"
fi

if [ -e $file3 ]; then
    echo -e "\e[32m$file3\e[0m"
        else
                echo -e "\e[31m$file3\e[0m"
fi

if [ -e $file4 ]; then
    echo -e "\e[32m$file4\e[0m"
        else
                echo -e "\e[31m$file4\e[0m"
fi

if [ -e $file5 ]; then
    echo -e "\e[32m$file5\e[0m"
            else
                echo -e "\e[31m$file5\e[0m"
fi
#!/bin/sh


red=`echo -en "\e[31m"`
green=`echo -en "\e[32m"`
purple=`echo -en "\e[35m"`
default=`echo -en "\e[39m"`
 


if [ "$(whoami)" != "root" ]; then
        echo  "${red}Sorry. This script requires sudo privleges"
        exit 255
fi

apt-get update  


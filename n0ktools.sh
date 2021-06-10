#!/bin/sh


red=`echo -en "\e[31m"`
green=`echo -en "\e[32m"`
purple=`echo -en "\e[35m"`
default=`echo -en "\e[39m"`
 


if [ "$(whoami)" != "root" ]; then
        echo  "${red}Sorry. This script requires sudo privleges"
        exit 255
fi

echo "${purple}███╗   ██╗ ██████╗ ██╗  ██╗  ████████╗ ██████╗  ██████╗ ██╗     ███████╗"
echo "${purple}████╗  ██║██╔═████╗██║ ██╔╝  ╚══██╔══╝██╔═══██╗██╔═══██╗██║     ██╔════╝"
echo "${purple}██╔██╗ ██║██║██╔██║█████╔╝█████╗██║   ██║   ██║██║   ██║██║     ███████╗"
echo "${purple}██║╚██╗██║████╔╝██║██╔═██╗╚════╝██║   ██║   ██║██║   ██║██║     ╚════██║"
echo "${purple}██║ ╚████║╚██████╔╝██║  ██╗     ██║   ╚██████╔╝╚██████╔╝███████╗███████║\n"



echo "${green}Do you want to install all the tools?\n[Y/N]"

read choice



if [[$choice == y]] | if [[$choice == Y]]; then
        echo "yes"

if [[$choice == n]] | if [[$choice == N]]; then
        echo "no"


else
        echo "${red}Something unexpected happened"

~
~
~
~

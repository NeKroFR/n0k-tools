#!/bin/sh


red=`echo -en "\e[31m"`
green=`echo -en "\e[32m"`
purple=`echo -en "\e[35m"`
default=`echo -en "\e[39m"`
 
clear




if [ "$(whoami)" != "root" ]; then
        echo  "${red}Sorry. This script requires sudo privleges"
        exit 255
fi

echo "${purple}███╗   ██╗ ██████╗ ██╗  ██╗  ████████╗ ██████╗  ██████╗ ██╗     ███████╗"
echo "${purple}████╗  ██║██╔═████╗██║ ██╔╝  ╚══██╔══╝██╔═══██╗██╔═══██╗██║     ██╔════╝"
echo "${purple}██╔██╗ ██║██║██╔██║█████╔╝█████╗██║   ██║   ██║██║   ██║██║     ███████╗"
echo "${purple}██║╚██╗██║████╔╝██║██╔═██╗╚════╝██║   ██║   ██║██║   ██║██║     ╚════██║"
echo "${purple}██║ ╚████║╚██████╔╝██║  ██╗     ██║   ╚██████╔╝╚██████╔╝███████╗███████║${green}\n"



printf "Do you want to install all the tools?\n[Y/N]"

read choice

echo "${default}"

case "$choice" in
    "y" | "Y")
        cd ../../
        echo "Updating packages..." 
        sudo apt-get update
        echo "Installing packages..." 
        while read line; do echo apt-get install $line; done < packages
        echo "Installing searchsploit..." 
        sudo git clone https://github.com/offensive-security/exploitdb.git /opt/exploitdb
        sudo ln -sf /opt/exploitdb/searchsploit /usr/local/bin/searchsploit
        searchsploit -h
        searchsploit -u
        echo "Installing metasploit..."  


        
        
        

        ;;
    "n" | "N")
        exit ;;

    *)
        echo "${red}Something unexpected happened"

esac

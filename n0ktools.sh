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
echo "${purple}██║ ╚████║╚██████╔╝██║  ██╗     ██║   ╚██████╔╝╚██████╔╝███████╗███████║\n"



printf "${green}Do you want to install all the tools?\n[Y/N]"
printf "${default}"

read choice


case "$choice" in
    "y" | "Y")
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
        sudo apt-get install -y ruby-dev libpq-dev libpcap-dev libsqlite3-dev postgresql git ruby-bundler build-essential patch ruby-dev zlib1g-dev liblzma-dev libgmp-dev
        sudo mkdir /opt/metasploit
        sudo chown $USER:root -R /opt/metasploit
        sudo chmod 770 -R /opt/metasploit
        git clone https://github.com/rapid7/metasploit-framework.git /opt/metasploit
        sudo chmod +x /opt/metasploit/
        cd /opt/metasploit
        sudo /opt/metasploit/msfupdate

        ;;
    "n" | "N")
        exit ;;

    *)
        echo "${red}Something unexpected happened"

esac

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
        curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && \
        chmod 755 msfinstall && \
        ./msfinstall
        echo "Installing tplmap..." 
        sudo add-apt-repository universe
        curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py
        sudo python2 get-pip.py
        pip2 install PyYAML
        pip2 install certifi
        pip2 install chardet
        pip2 install idna
        pip2 install requests
        pip2 install urllib3
        pip2 install wsgiref
        mkdir scripts
        cd /scripts
        git clone https://github.com/epinna/tplmap.git
        cd tplmap/
        sudo chmod +x *
        cd ../../


        
        
        

        ;;
    "n" | "N")
        exit ;;

    *)
        echo "${red}Something unexpected happened"

esac

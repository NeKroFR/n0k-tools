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
        cd ../
        echo "Initialisation..." 
        sudo pacman -Syyu
        sudo pacman -S yay
        pacman -S python2
        pacman -S python3
        sudo pacman -S base-devel
        echo "Installing packages..."
        cd ../../
        echo "Installing gobuster"
        git clone https://aur.archlinux.org/gobuster.git
        cd gobuster                  
        makepkg -si   
        cd ../
        rm -R gobuster
        echo "Installing john"
        git clone https://aur.archlinux.org/john-git.git 
        cd john-git  
        makepkg -si
        cd ../
        rm john-git
        echo "Installing nmap"
        pacman -S nmap
        echo "Installing netcat"
        sudo pacman -S gnu-netcat
        echo "Installing sqlmap"
        sudo pacman -S sqlmap  
        echo "Installing hashcat"     
        sudo pacman -S hashcat
        echo "Installing metasploit..."  
        sudo pacman -S metasploit


        
        echo "Updates..."
        sudo pacman -Syyu
        echo "${green}Installation succesful !${default}"           

        ;;
    "n" | "N")
        exit ;;

    *)
        echo "${red}Something unexpected happened"

esac


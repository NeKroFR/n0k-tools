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
        sudo pacman -Syyu --noconfirm
        sudo pacman -S yay --noconfirm
        pacman -S python2 --noconfirm
        pacman -S python3 --noconfirm
        sudo pacman -S base-devel --noconfirm
        git clone https://aur.archlinux.org/snapd.git
        cd snapd 
        makepkg -si
        sudo systemctl enable --now snapd.socket
        sudo ln -s /var/lib/snapd/snap /snap
        cd ../
        rm -R snapd
        snap refresh
        mkdir Tools
        
        echo "Installing Wordlists..."
        mkdir wordlists
        cd wordlists
        wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/DNS/subdomains-top1million-110000.txt
        wget https://raw.githubusercontent.com/daviddias/node-dirbuster/master/lists/directory-list-2.3-medium.txt
        wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/big.txt
        cd ../
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
        rm -R john-git
        echo "Installing nmap"
        pacman -S nmap --noconfirm 
        echo "Installing netcat"
        sudo pacman -S gnu-netcat --noconfirm
        echo "Installing sqlmap"
        sudo pacman -S sqlmap   --noconfirm
        echo "Installing hashcat"     
        sudo pacman -S hashcat --noconfirm
        echo "Installing hydra"
        git clone https://aur.archlinux.org/hydra-git.git
        cd hydra-git
        makepkg -si
        cd ../
        rm -R hydra-git
        echo "Installing metasploit..."  
        pacman -S metasploit --noconfirm
        echo "Installing sqlmap..."  
        snap install sqlmap
        echo "Installing FFUF..."
        git clone https://aur.archlinux.org/ffuf.git                                                                                                                                                        ✔ 
        makepkg -si       
        cd ../
        sudo rm -R ffuf
        echo "Installing nikto..."
        sudo pacman -S nikto --noconfirm
        echo "Installing Sublist3r..."        
        cd Tools
        git clone https://github.com/aboul3la/Sublist3r.git
        cd Sublist3r
        sudo pip install -r requirements.txt
 



        
        echo "Updates..."
        sudo pacman -Syyu --noconfirm
        echo "${green}Installation succesful !${default}"           

        ;;
    "n" | "N")
        exit ;;

    *)
        echo "${red}Something unexpected happened"

esac

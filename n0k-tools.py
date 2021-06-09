#!/usr/bin/python3


import os
import sys, traceback
import colorama
from colorama import Fore, Back, Style
colorama.init(autoreset=True)


if os.getuid() != 0:
	print ("Sorry. This script requires sudo privleges")
	sys.exit()


f = open("packages", "r")

pkg = f.read().replace("\n", " ")

print(f'''{Fore.MAGENTA}
███╗   ██╗ ██████╗ ██╗  ██╗  ████████╗ ██████╗  ██████╗ ██╗     ███████╗
████╗  ██║██╔═████╗██║ ██╔╝  ╚══██╔══╝██╔═══██╗██╔═══██╗██║     ██╔════╝
██╔██╗ ██║██║██╔██║█████╔╝█████╗██║   ██║   ██║██║   ██║██║     ███████╗
██║╚██╗██║████╔╝██║██╔═██╗╚════╝██║   ██║   ██║██║   ██║██║     ╚════██║
██║ ╚████║╚██████╔╝██║  ██╗     ██║   ╚██████╔╝╚██████╔╝███████╗███████║


                                                ''')


a = input(f'{Fore.GREEN}Do you want to install all the tools?\n[Y/N]')


if(a =="Y" or a== "y"):
   	print("")
    	print("Installing packages...")
	cmd = os.system("apt-get install "+ pkg)
	#install metasploit
	cmd = os.system("cd $HOME")
	cmd = os.system("wget https://Auxilus.github.io/metasploit.sh")
	cmd = os.system("bash metasploit.sh")
	cmd = os.system("cd $HOME")
	cmd = os.system("cd metasploit-framework")
	cmd = os.system("gem install bundle")
	cmd = os.system("pkg install bundle")
	cmd = os.system("apt install bundle")
	cmd = os.system("gem install bundler")
	cmd = os.system("pip2 install bundler")
	cmd = os.system("pip2 install bundle")
	cmd = os.system("gem install bundle")
	cmd = os.system("bundle config build.nokogiri --use-system-libraries")
	cmd = os.system("bundle install")
	cmd = os.system("bundle update nokogiri")
	cmd = os.system("gem install nokogiri")
	cmd = os.system("gem install nokogiri -- --use-system-libraries")
	cmd = os.system("gem install pkg-config -v ~> 1.1")
	cmd = os.system("pkg-config")
	cmd = os.system("bundle update nokogiri")
	cmd = os.system("pg_ctl -D $PREFIX/var/lib/postgresql start")

    	print("Installation successful!")


elif(a =="N" or a== "n"):
	pass

else:
	print (f'{Fore.RED}Something unexpected happened')
	


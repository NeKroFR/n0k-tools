#!/usr/bin/python3


import os
import sys, traceback
import colorama
from colorama import Fore, Back, Style
colorama.init(autoreset=True)


if os.getuid() != 0:
	print ("Sorry. This script requires sudo privleges")
	sys.exit()


f = open(".packages", "r")

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
    print("Installation successful!")


elif(a =="N" or a== "n"):
	pass

else:
	print (f'{Fore.RED}Something unexpected happened')
	


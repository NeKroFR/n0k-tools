#!/usr/bin/python3


import os
import sys, traceback
import colorama
from colorama import Fore, Back, Style
colorama.init(autoreset=True)


if os.getuid() != 0:
	print ("Sorry. This script requires sudo privleges")
	sys.exit()


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
    print("Installation successful!")


elif(a =="N" or a== "n"):
	pass

else:
	print ('{Fore.RED}Something unexpected happened')
	


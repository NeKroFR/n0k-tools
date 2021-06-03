#!/usr/bin/python3

import colorama
from colorama import Fore, Back, Style
colorama.init(autoreset=True)

print(f'''{Fore.MAGENTA}
███╗   ██╗ ██████╗ ██╗  ██╗  ████████╗ ██████╗  ██████╗ ██╗     ███████╗
████╗  ██║██╔═████╗██║ ██╔╝  ╚══██╔══╝██╔═══██╗██╔═══██╗██║     ██╔════╝
██╔██╗ ██║██║██╔██║█████╔╝█████╗██║   ██║   ██║██║   ██║██║     ███████╗
██║╚██╗██║████╔╝██║██╔═██╗╚════╝██║   ██║   ██║██║   ██║██║     ╚════██║
██║ ╚████║╚██████╔╝██║  ██╗     ██║   ╚██████╔╝╚██████╔╝███████╗███████║


                                                ''')


a = input(f'{Fore.GREEN}Do you want to install all the tools?\n[Y/N]')


if(a =="Y" or a== "y"):
	print ('Installing packages...')
	print ('Installation successful!')


elif(a =="N" or a== "n"):
	pass

else:
	print ('Something unexpected happened')
	



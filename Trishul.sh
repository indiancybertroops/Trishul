#!/bin/bash
#Trishul
clear
N='\033[0m'
R='\033[0;31m'
G='\033[0;32m'
O='\033[0;33m'
B='\033[0;34m'
Y='\033[0;38m'       # Yellow
C='\033[0;36m'         # Cyan
W='\033[0;37m'        # White

echo -e "
   _   _   _ 
${O}  | | | | | |          ${Y}Trishu 1.0
${N}  | | | | | |     ${C}A Tool To Find Username 
${B}  | \_| |_/ |     ${C}Across Internet 
${O}   \__   __/      ${Y}OSINT Automaton Tool
${Y}      | |        ${C} Coded By: Krishanu Sharna  
${O}      | |        ${B} Indian Cyber Troops
${B}      |_|   
      
      
      ${Y} Usage: bash $0 list.txt Username 
      ${O} Nothing Is Perfect, Try Again And Make It 
          "
          

LISTS=$1
UNAME=$2

if [[ ! -f ${LISTS} ]]; then
	echo -e ${R}"ERROR: ${LISTS} List Or Username Not Found"
	echo -e ${C}"Usage: $0 list.txt Username"
	exit
fi

for SITE in $(cat $LISTS);
do
	link=$(echo $SITE | sed "s/ictname/$2/")
	response=$(curl -I $link 2>/dev/null | head -n 1 | cut -d$' ' -f2)
    if [[ $response =~ '200' ]]; then
		echo -e "\e[32m[+] FOUND: ${link}"
	else
		echo -e "\e[31m[-] NOT FOUND: ${link}"
	fi
done

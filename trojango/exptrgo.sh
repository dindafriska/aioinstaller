#!/bin/bash
# DOBOLite
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
IZIN=$( curl ipinfo.io/ip | grep $MYIP )
if [ $MYIP = $MYIP ]; then
echo -e "${NC}${GREEN}Permission Accepted...${NC}"
else
echo -e "${NC}${RED}Permission Denied!${NC}";
echo -e "${NC}${LIGHT}Fuck You!!"
exit 0
fi
clear

echo ""
echo "============================"
echo "  TrojanGo Account Checking "
echo "============================"
hariini=`date +%d-%m-%Y`
grep -E "^### " "/etc/trojan-go/akun.conf" | cut -d ' ' -f 2-3 > /tmp/expiretrjlist.txt
totalaccounts= `cat /tmp/expiretrjlist.txt | wc -l`
for((i=1; i<=$totalaccounts; i++ ))
do

	tuserval=`head -n $i /tmp/expiretrjlist.txt | tail -n 1`
    username=`echo $tuserval | cut -f1 -d' '`
	userexp=`echo $tuserval | cut -f2 -d' '`
    userexpireinseconds=`date -d $userexp +%s`
	todaystime=`date +%s`
	 if [ $userexpireinseconds -ge $todaystime ] ;
    then
	:
    else
    	echo -e "echo Expired Username : $username are expired at: $tgl $bulantahun and removed : $hariini " >> /usr/local/bin/deletedtrgouser
	    echo -e "Username $username that are expired at $tgl $bulantahun removed from the VPS $hariini"
        # CLIENT_NAME=$(grep -E "^### " "/etc/trojan-go/akun.conf" | cut -d ' ' -f 2-3 | sed -n "${CLIENT_NUMBER}"p)
		# user=$(grep -E "^### " "/etc/trojan-go/akun.conf" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
		# exp=$(grep -E "^### " "/etc/trojan-go/akun.conf" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
		# sed -i "/^### $user $exp/d" /etc/trojan-go/akun.conf
		# sed -i '/^,"'"$user"'"$/d' /etc/trojan-go/config.json
    fi
    
     
	

done

NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/trojan-go/akun.conf")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi

	echo ""
	echo " ==============================="
	echo "removed $totalaccounts trojan go account"
	echo "=========================="
	echo "t.me/applehitam"


	

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
#echo "Checking VPS"
IZIN=$( curl -s ipinfo.io/ip | grep $MYIP )
if [ $MYIP = $MYIP ]; then
#echo -e "${NC}${GREEN}Permission Accepted...${NC}"
else
echo -e "${NC}${RED}Permission Denied!${NC}";
echo -e "${NC}${LIGHT}Fuck You!!"
exit 0
fi

gener=$(pwgen 5 1)
generpass=$(pwgen 5 1)

user=("dobo_$gener")
Pass="1"
masaaktif=1

if [[ -n "$1" ]];
then
        re='^[0-9]+$'
        if ! [[ $1 =~ $re ]] ; then
                echo "Not A Valid Number" >&2; exit 1
    else
        masaaktif=$1
        fi
fi


clear
uuid=$(cat /etc/trojan-go/uuid.txt)
source /var/lib/crot/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi
trgo="$(cat ~/log-install.txt | grep -w "TrojanGo" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
		#read -rp "Password : " -e user
		user_EXISTS=$(grep -w $user /etc/trojan-go/akun.conf | wc -l)

		if [[ ${user_EXISTS} == '1' ]]; then
			echo ""
			echo -e "Username ${RED}${user}${NC} Already On VPS Please Choose Another"
			exit 1
		fi
	done
#read -p "Expired (Days) : " masaaktif
sed -i '/"'""$uuid""'"$/a\,"'""$user""'"' /etc/trojan-go/config.json
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
hariini=`date -d "0 days" +"%Y-%m-%d"`
echo -e "### $user $exp" >> /etc/trojan-go/akun.conf
systemctl restart trojan-go.service
link="trojan-go://${user}@${domain}:${trgo}/?sni=${domain}&type=ws&host=${domain}&path=/trojango&encryption=none#$user"
clear
echo -e ""
echo -e "=========INFO Trojan GO======="
echo -e "IP/Host    : <code>${MYIP}</code>"
echo -e "Address    : <code>${domain}</code>"
echo -e "Port       : <code>${trgo}</code>"
echo -e "Key        : <code>${user}</code>"
echo -e "Encryption : none"
echo -e "Path       : <code>/trojango</code>"
echo -e "Created    : $hariini"
echo -e "Expired    : $exp 00:00"
echo -e "=============================="
echo -e "Link TrGo  : <code>${link}</code>"
echo -e "=============================="
echo -e "=============================="
echo -e " Generated From Rania With Love"
echo -e "              t.me/applehitam"
echo -e "==========DOBO Lite==========="

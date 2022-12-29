#!/bin/bash
# SL
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
tls_special=8443
nontls_special=80
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
source /var/lib/crot/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi
tr="$(cat ~/log-install.txt | grep -w "Trojan" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
		read -rp "Password : " -e user
		user_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

		if [[ ${user_EXISTS} == '1' ]]; then
			echo ""
			echo -e "Username ${RED}${user}${NC} Already On VPS Please Choose Another"
			exit 1
		fi
	done
    
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (Days) : " masaaktif
hariini=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#xray-trojan$/a\#&# '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
cat>/etc/xray/trojan-$user-tls.json<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "${tls_special}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/bebas",
      "type": "none",
      "host": "",
      "tls": "tls"
}
EOF
systemctl restart xray.service
trojanlink="trojan://${uuid}@${domain}:${tls_special}?path=/bebas&security=tls&type=ws#${user}"
trojanlink_nontls="trojan://${uuid}@${domain}:${nontls_special}?path=/bebas&type=ws#${user}"
service cron restart
clear
echo -e ""
echo -e "*******-TROJAN XRAY MULTIPATH/CUSTOM METHOD-*******"
echo -e "Remarks                  : ${user}"
echo -e "IP/Host                  : ${MYIP} - isi_bug_host (gw.ruangguru.com)"
echo -e "Address                  : ${domain}"
#echo -e "Port TLS         : ${tls}"
#echo -e "Port No TLS        : ${nontls}"
echo -e "Port TLS                 : ${tls_special}"
echo -e "Port No TLS              : ${nontls_special}"
echo -e "User ID                  : ${uuid}"
echo -e "TLS Security             : auto"
echo -e "NON TLS Security         : none"
echo -e "Network                  : ws"
echo -e "Path                     : /worryfree - /terserah"
echo -e "Custom Method Path       : CF-RAY:http://gw.ruangguru.com/ - terserah"
echo -e "SNI                      : gw.ruangguru.com - terserah"
echo -e "Created                  : $hariini"
echo -e "Expired                  : $exp"
echo -e "=================================================="
echo -e "Link TLS"
echo -e "${trojanlink}"
echo -e "=================================================="
echo -e "Link Non TLS "
echo -e "${trojanlink_nontls}"
echo -e "=================================================="
echo -e "contact me : t.me/applehitam"
echo -e "**************-BY DOBO Lite-**************"

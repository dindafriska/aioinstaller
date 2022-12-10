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
tls_special=443
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
tls="$(cat ~/log-install.txt | grep -w "Vmess TLS" | cut -d: -f2|sed 's/ //g')"
nontls="$(cat ~/log-install.txt | grep -w "Vmess None TLS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
                read -rp "Username : " -e user
                CLIENT_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

                if [[ ${CLIENT_EXISTS} == '1' ]]; then
                        echo ""
                        echo -e "Username ${RED}${CLIENT_NAME}${NC} Already On VPS Please Choose Another"

                        exit 1
                fi
        done
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (Days) : " masaaktif
hariini=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#xray-vmess-tls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"32"',"email": "'""$user""'"' /etc/xray/config.json
sed -i '/#xray-vmess-nontls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"32"',"email": "'""$user""'"' /etc/xray/config.json
cat>/etc/xray/vmess-$user-tls.json<<EOF
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
cat>/etc/xray/vmess-$user-nontls.json<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "${nontls_special}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/bebas",
      "type": "none",
      "host": "",
      "tls": "none"
}
EOF
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmess_base642=$( base64 -w 0 <<< $vmess_json2)
xrayv2ray1="vmess://$(base64 -w 0 /etc/xray/vmess-$user-tls.json)"
xrayv2ray2="vmess://$(base64 -w 0 /etc/xray/vmess-$user-nontls.json)"
xrayvless1="vless://${uuid}@${domain}:$tls?path=/bebas&security=tls&encryption=none&type=ws#${user}"
xrayvless2="vless://${uuid}@${domain}:$nontls?path=/bebas&encryption=none&type=ws#${user}"
systemctl restart xray.service
service cron restart
clear
echo -e ""
echo -e "*******-VMESS MULTIPATH/CUSTOM METHOD-*******"
echo -e "Remarks                  : ${user}"
echo -e "IP/Host                  : ${MYIP} - isi_bug_host (gw.ruangguru.com)"
echo -e "Address                  : ${domain}"
#echo -e "Port TLS         : ${tls}"
#echo -e "Port No TLS        : ${nontls}"
echo -e "Port TLS                 : ${tls_special}"
echo -e "Port No TLS              : ${nontls_special}"
echo -e "User ID                  : ${uuid}"
echo -e "Alter ID                 : 0"
echo -e "TLS Security             : auto"
echo -e "NON TLS Security         : none"
echo -e "Network                  : ws"
#echo -e "Path        : /vmess"
echo -e "Path                     : /worryfree - /terserah"
echo -e "Custom Method Path       : CF-RAY:http://gw.ruangguru.com/ - terserah"
echo -e "SNI                      : gw.ruangguru.com - terserah"
echo -e "Created                  : $hariini"
echo -e "Expired                  : $exp"
echo -e "=================================================="
echo -e "Link TLS"
echo -e "${xrayv2ray1}"
echo -e "=================================================="
echo -e "Link Non TLS "
echo -e "${xrayv2ray2}"
echo -e "=================================================="
echo -e "**************-BY DOBO Lite-**************"


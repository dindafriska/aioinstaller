#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
GREEN='\033[0;32m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m'
yl='\e[32;1m'
bl='\e[36;1m'
gl='\e[32;1m'
rd='\e[31;1m'
mg='\e[0;95m'
blu='\e[34m'
op='\e[35m'
or='\033[1;33m'
bd='\e[1m'
color1='\e[031;1m'
color2='\e[34;1m'
color3='\e[0m'

MYIP=$(wget -qO- icanhazip.com);
apt install jq curl -y
rm -f /root/domain
rm -f /etc/v2ray/domain
rm -f /etc/xray/domain
rm -rf /etc/xray/domain
rm -rf /root/nsdomain
rm -rf /var/lib/crot/ipvps.conf
rm nsdomain
rm domain
rm slhost.sh
mkdir -p /usr/bin/xray
mkdir -p /usr/bin/v2ray
mkdir -p /etc/xray
mkdir -p /etc/v2ray
clear;
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m              ⇱ Sytem Information ⇲             \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo "";
read -p "Masukkan Domain Utama (Cth : google.com) : " DOMAIN
read -p "Masukkan Sub Domain (Cth : translate.google.com) : " SUB_DOMAIN
read -p "Masukkan NS Domain (kosongkan bila tidak tahu) : " NS_DOMAIN
clear;
# DOMAIN=mantapxsl.my.id
# SUB_DOMAIN=onichan-${sub}.mantapxsl.my.id
# NS_DOMAIN=zerosl-${sub}.mantapxsl.my.id

echo "$SUB_DOMAIN" >> /etc/v2ray/domain
#
sub=$(</dev/urandom tr -dc a-z0-9 | head -c5)
subsl=$(</dev/urandom tr -dc a-z0-9 | head -c5)

set -euo pipefail
IP=$(wget -qO- icanhazip.com);
echo "Updating DNS for ${SUB_DOMAIN}..."
# ZONE=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones?name=${DOMAIN}&status=active" \
#      -H "X-Auth-Email: ${CF_ID}" \
#      -H "X-Auth-Key: ${CF_KEY}" \
#      -H "Content-Type: application/json" | jq -r .result[0].id)

# RECORD=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records?name=${SUB_DOMAIN}" \
#      -H "X-Auth-Email: ${CF_ID}" \
#      -H "X-Auth-Key: ${CF_KEY}" \
#      -H "Content-Type: application/json" | jq -r .result[0].id)

# if [[ "${#RECORD}" -le 10 ]]; then
#      RECORD=$(curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records" \
#      -H "X-Auth-Email: ${CF_ID}" \
#      -H "X-Auth-Key: ${CF_KEY}" \
#      -H "Content-Type: application/json" \
#      --data '{"type":"A","name":"'${SUB_DOMAIN}'","content":"'${IP}'","ttl":120,"proxied":false}' | jq -r .result.id)
# fi

# RESULT=$(curl -sLX PUT "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records/${RECORD}" \
#      -H "X-Auth-Email: ${CF_ID}" \
#      -H "X-Auth-Key: ${CF_KEY}" \
#      -H "Content-Type: application/json" \
#      --data '{"type":"A","name":"'${SUB_DOMAIN}'","content":"'${IP}'","ttl":120,"proxied":false}')
# echo "Updating DNS NS for ${NS_DOMAIN}..."
# ZONE=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones?name=${DOMAIN}&status=active" \
#      -H "X-Auth-Email: ${CF_ID}" \
#      -H "X-Auth-Key: ${CF_KEY}" \
#      -H "Content-Type: application/json" | jq -r .result[0].id)

# RECORD=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records?name=${NS_DOMAIN}" \
#      -H "X-Auth-Email: ${CF_ID}" \
#      -H "X-Auth-Key: ${CF_KEY}" \
#      -H "Content-Type: application/json" | jq -r .result[0].id)

# if [[ "${#RECORD}" -le 10 ]]; then
#      RECORD=$(curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records" \
#      -H "X-Auth-Email: ${CF_ID}" \
#      -H "X-Auth-Key: ${CF_KEY}" \
#      -H "Content-Type: application/json" \
#      --data '{"type":"NS","name":"'${NS_DOMAIN}'","content":"'${SUB_DOMAIN}'","ttl":120,"proxied":false}' | jq -r .result.id)
# fi

# RESULT=$(curl -sLX PUT "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records/${RECORD}" \
#      -H "X-Auth-Email: ${CF_ID}" \
#      -H "X-Auth-Key: ${CF_KEY}" \
#      -H "Content-Type: application/json" \
#      --data '{"type":"NS","name":"'${NS_DOMAIN}'","content":"'${SUB_DOMAIN}'","ttl":120,"proxied":false}')
rm -rf /etc/xray/domain
rm -rf /root/nsdomain

echo "IP=""$SUB_DOMAIN" >> /var/lib/crot/ipvps.conf
echo "Host : $SUB_DOMAIN"
echo $SUB_DOMAIN > /root/domain
echo "Host SlowDNS : $NS_DOMAIN"
echo "$NS_DOMAIN" >> /root/nsdomain
echo "$SUB_DOMAIN" >> /etc/xray/domain
cd



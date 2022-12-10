#!/bin/bash
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
clear
echo start
sleep 0.5
source /var/lib/crot/ipvps.conf
domain=$(cat /etc/xray/domain)
sudo lsof -t -i tcp:80 -s tcp:listen | sudo xargs kill
cd /root/
wget -O acme.sh https://raw.githubusercontent.com/acmesh-official/acme.sh/master/acme.sh
bash acme.sh --install --set-default-ca --server letsencrypt
rm acme.sh
cd .acme.sh
echo "starting...., Port 80 Akan di Hentikan Saat Proses install Cert"
echo "modified by dobo lite"
bash acme.sh --register-account -m jonidevelopmentmail@gmail.com
echo "register to domain"
echo "==================================================================="
echo "start issuing certificate"
echo "Domain : "$domain
echo "========================================================================="
sleep 3
bash acme.sh --issue --standalone -d $domain --force
echo "========================================================================"
echo "successfuly get certificate"
echo "stand alone install run"
bash acme.sh --installcert -d $domain --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key


#!/bin/bash
# ==========================================
# Color
# hapus menu
# download menu
cd /usr/bin
rm -rf menu
rm -rf ipsaya
rm -rf sl-fix
rm -rf sshovpnmenu
rm -rf l2tpmenu
rm -rf pptpmenu
rm -rf sstpmenu
rm -rf wgmenu
rm -rf ssmenu
rm -rf ssrmenu
rm -rf vmessmenu
rm -rf vlessmenu
rm -rf grpcmenu
rm -rf grpcupdate
rm -rf trmenu
rm -rf trgomenu
rm -rf setmenu
rm -rf slowdnsmenu
rm -rf running
rm -rf copyrepo
rm -rf listtrgo
rm -rf exptrgo
rm -rf wuntrgo
rm -rf removetrgo
rm -rf install-xray-custom

rm -rf menu
rm -rf menuinfo
rm -rf restart
rm -rf slhost
rm -rf install-sldns
rm -rf addssh
wget -O install-sldns "https://raw.githubusercontent.com/dindafriska/aioinstaller/main/SLDNS/install-sldns"
wget -O restart "https://raw.githubusercontent.com/dindafriska/aioinstaller/main/ssh/restart.sh"
wget -O addssh "https://raw.githubusercontent.com/dindafriska/aioinstaller/main/ssh/addssh.sh"
wget -O menu "https://raw.githubusercontent.com/dindafriska/aioinstaller/main/update/menu.sh"
wget -O ipsaya "https://raw.githubusercontent.com/dindafriska/aioinstaller/main/update/ipsaya.sh"
wget -O sl-fix "https://raw.githubusercontent.com/dindafriska/aioinstaller/main/sslh-fix/sl-fix"
wget -O sshovpnmenu "https://raw.githubusercontent.com/dindafriska/aioinstaller/main/update/sshovpn.sh"
wget -O l2tpmenu "https://raw.githubusercontent.com/dindafriska/aioinstaller/main/update/l2tpmenu.sh"
wget -O pptpmenu "https://raw.githubusercontent.com/dindafriska/aioinstaller/main/update/pptpmenu.sh"
wget -O sstpmenu "https://raw.githubusercontent.com/dindafriska/aioinstaller/main/update/sstpmenu.sh"
wget -O wgmenu "https://raw.githubusercontent.com/dindafriska/aioinstaller/main/update/wgmenu.sh"
wget -O ssmenu "https://raw.githubusercontent.com/dindafriska/aioinstaller/main/update/ssmenu.sh"
wget -O ssrmenu "https://raw.githubusercontent.com/dindafriska/aioinstaller/main/update/ssrmenu.sh"
wget -O vmessmenu "https://raw.githubusercontent.com/dindafriska/aioinstaller/main/update/vmessmenu.sh"
wget -O vlessmenu "https://raw.githubusercontent.com/dindafriska/aioinstaller/main/update/vlessmenu.sh"
wget -O xray-grpc "https://raw.githubusercontent.com/dindafriska/aioinstaller/main/grpc/xray-grpc.sh"
wget -O grpcmenu "https://raw.githubusercontent.com/dindafriska/aioinstaller/main/update/grpcmenu.sh"
wget -O grpcupdate "https://raw.githubusercontent.com/dindafriska/aioinstaller/main/update/grpcupdate.sh"
wget -O trmenu "https://raw.githubusercontent.com/dindafriska/aioinstaller/main/update/trmenu.sh"
wget -O trgomenu "https://raw.githubusercontent.com/dindafriska/aioinstaller/main/update/trgomenu.sh"
wget -O setmenu "https://raw.githubusercontent.com/dindafriska/aioinstaller/main/update/setmenu.sh"
wget -O slowdnsmenu "https://raw.githubusercontent.com/dindafriska/aioinstaller/main/update/slowdnsmenu.sh"
wget -O running "https://raw.githubusercontent.com/dindafriska/aioinstaller/main/update/running.sh"
wget -O updatemenu "https://raw.githubusercontent.com/dindafriska/aioinstaller/main/update/updatemenu.sh"
wget -O copyrepo "https://raw.githubusercontent.com/dindafriska/aioinstaller/main/salin/copyrepo.sh"
wget -O slhost "https://raw.githubusercontent.com/dindafriska/aioinstaller/main/ssh/slhost.sh"
wget -O sl-download-info "https://raw.githubusercontent.com/dindafriska/aioinstaller/main/contohinfo/sl-download-info.sh"
wget -O menuinfo "https://raw.githubusercontent.com/dindafriska/aioinstaller/main/update/menuinfo.sh"
wget -O install-ss-plugin "https://raw.githubusercontent.com/dindafriska/aioinstaller/main/shadowsocks-plugin/install-ss-plugin.sh"
wget -O install-xray-custom "https://raw.githubusercontent.com/dindafriska/aioinstaller/main/xray/ins-xray-core.sh"
wget -O exptrgo "https://raw.githubusercontent.com/dindafriska/aioinstaller/main/trojango/exptrgo.sh"
wget -O listtrgo "https://raw.githubusercontent.com/dindafriska/aioinstaller/main/trojango/listtrgo.sh"
wget -O wuntrgo "https://raw.githubusercontent.com/dindafriska/aioinstaller/main/trojango/wuntrgo.sh"
wget -O removetrgo "https://raw.githubusercontent.com/dindafriska/aioinstaller/main/trojango/removetrgo.sh"


sed -i -e 's/\r$//' install-xray-custom

chmod +x install-ss-plugin
chmod +x xray-grpc
chmod +x install-sldns
chmod +x restart
chmod +x addssh
chmod +x grpcmenu2
chmod +x grpc2
chmod +x grpcupdate2
chmod +x sl-download-info
chmod +x menuinfo
chmod +x slhost
chmod +x copyrepo
chmod +x menu
chmod +x ipsaya
chmod +x sl-fix
chmod +x sshovpnmenu
chmod +x l2tpmenu
chmod +x pptpmenu
chmod +x sstpmenu
chmod +x wgmenu
chmod +x ssmenu
chmod +x ssrmenu
chmod +x vmessmenu
chmod +x vlessmenu
chmod +x grpcmenu
chmod +x grpcupdate
chmod +x trmenu
chmod +x trgomenu
chmod +x listtrgo
chmod +x exptrgo
chmod +x wuntrgo
chmod +x removetrgo
chmod +x setmenu
chmod +x slowdnsmenu
chmod +x running
chmod +x updatemenu
chmod +x install-xray-custom
sl-download-info
#install-sldns
#install-ss-plugin
#xray-grpc
cd

#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- icanhazip.com);
echo "Checking VPS"
IZIN=$( curl https://raw.githubusercontent.com/wonderfulgo/tokengasken/main/pertamax | grep $MYIP )
if [ $MYIP = $IZIN ]; then
echo -e "${green}Permission Accepted...${NC}"
else
echo -e "${red}Permission Denied!${NC}";
echo "Only For Premium Users"
exit 0
fi
clear
figlet  SWEETIE | lolcat
date | lolcat
echo -e ""
echo -e "\e[1;32m═══════════════════════════════════════\e[m" | lolcat | lolcat
echo -e "=============================-Menu-============================="
echo -e "\e[1;32m═══════════════════════════════════════\e[m" | lolcat
echo -e " 1\e[1;33m)\e[m SSH & OpenVPN Menu"
echo -e " 2\e[1;33m)\e[m Wireguard"
echo -e " 3\e[1;33m)\e[m L2TP & PPTP Acc "
echo -e " 4\e[1;33m)\e[m SSTP Acc"
echo -e " 5\e[1;33m)\e[m SSR & SS Acc"
echo -e " 6\e[1;33m)\e[m V2Ray"
echo -e " 7\e[1;33m)\e[m Vless"
echo -e " 8\e[1;33m)\e[m Trojan"
echo -e "\e[1;32m═══════════════════════════════════════\e[m" | lolcat
echo -e "=============================-SYSTEM-=============================" 
echo -e "\e[1;32m═══════════════════════════════════════\e[m" | lolcat
echo -e " 9\e[1;33m)\e[m   Add Subdomain Host For VPS"
echo -e " 10\e[1;33m)\e[m  Renew Certificate V2RAY"
echo -e " 11\e[1;33m)\e[m  Change Port All Account"
echo -e " 12\e[1;33m)\e[m  Autobackup Data VPS"
echo -e " 13\e[1;33m)\e[m  Backup Data VPS"
echo -e " 14\e[1;33m)\e[m  Restore Data VPS"
echo -e " 15\e[1;33m)\e[m  Webmin Menu"
echo -e " 16\e[1;33m)\e[m  Limit Bandwith Speed Server"
echo -e " 17\e[1;33m)\e[m  Check Usage of VPS Ram" 
echo -e " 18\e[1;33m)\e[m  Reboot VPS"
echo -e " 19\e[1;33m)\e[m  Speedtest VPS"
echo -e " 20\e[1;33m)\e[m  Information Display System" 
echo -e " 21\e[1;33m)\e[m  Info Script Auto Install"
echo -e " 22\e[1;33m)\e[m  Install BBR"
echo -e "\e[1;32m══════════════════════════════════════════\e[m" | lolcat
echo -e " x)   Exit" | lolcat
echo -e "\e[1;32m══════════════════════════════════════════\e[m" | lolcat
echo -e ""
read -p "     Select From Options [1-22 or x] :  " menu
echo -e ""
case $menu in
1)
ssh
;;
2)
wgr
;;
3)
l2tp
;;
4)
sstpp
;;
5)
ssssr
;;
6)
v2raay
;;
7)
vleess
;;
8)
trojaan
;;
9)
add-host
;;
10)
certv2ray
;;
11)
change-port
;;
12)
autobackup
;;
13)
backup
;;
14)
restore
;;
15)
wbmn
;;
16)
limit-speed
;;
17)
ram
;;
18)
reboot
;;
19)
speedtest
;;
20)
info
;;
21)
about
;;
22)
bbr
;;
x)
exit
;;
*)
echo "Please enter an correct number"
;;
esac

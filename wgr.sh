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
echo -e""
echo -e "\e[1;32m═══════════════════════════════════════\e[m" | lolcat
echo -e "=============================-WIREGUARD-============================="
echo -e "\e[1;32m═══════════════════════════════════════\e[m" | lolcat
echo -e " 1\e[1;33m)\e[m  Create Wireguard Account"
echo -e " 2\e[1;33m)\e[m  Delete Wireguard Account"
echo -e " 3\e[1;33m)\e[m  Check User Login Wireguard"
echo -e " 4\e[1;33m)\e[m  Renew Wireguard Account"
echo -e ""
echo -e "\e[1;32m═════════════════════════════════════════\e[m" | lolcat
echo -e " x)   MENU"
echo -e "\e[1;32m═════════════════════════════════════════\e[m" | lolcat
echo -e ""
read -p "     Please Input Number  [1-4 or x] :  "  wgr
echo -e ""
case $wgr in
1)
add-wg
;;
2)
del-wg
;;
3)
cek-wg
;;
4)
renew-wg
;;
x)
menu
;;
*)
echo "Please enter an correct number"
;;
esac

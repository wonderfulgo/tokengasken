#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MIP=$(ip addr | grep 'inet' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | head -1)
MIP2=$(wget -qO- icanhazip.com)
[[ "$MIP" != "$MIP2" ]] && IP="$MIP2" || IP="$MIP"
echo "Checking VPS"
IZIN=$( curl https://raw.githubusercontent.com/wonderfulgo/tokengasken/main/pertamax | grep $MYIP )
if [ $IP = $IZIN ]; then
echo -e "${green}Permission Accepted...${NC}"
else
echo -e "${red}Permission Denied!${NC}";
echo "Only For Premium Users"
exit 0
fi
clear
read -rp "Domain/Host: " -e host
echo "IP=$host" >> /var/lib/premium-script/ipvps.conf
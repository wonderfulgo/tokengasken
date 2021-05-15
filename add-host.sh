#!/bin/bash

red='\e[1;31m'
green='\e[0;32m'
blue='\e[1;34m'
NC='\e[0m'

echo "Checking VPS"
clear

MYIP=$(wget -qO- icanhazip.com)
IP=$(wget -qO- icanhazip.com);

apt install jq curl -y
DOMAIN=vpsme.my.id
read -p "Subdomain : " subd
echo Create Subdomain: $subd

SUB_DOMAIN=${subd}.vpsme.my.id
CF_ID=joniada57@gmail.com
CF_KEY=05258bf4abf6bef652e5bd71624e8340af1b5
set -euo pipefail

echo "Updating DNS for ${SUB_DOMAIN}..."
ZONE=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones?name=${DOMAIN}&status=active" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" | jq -r .result[0].id)

RECORD=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records?name=${SUB_DOMAIN}" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" | jq -r .result[0].id)

if [[ "${#RECORD}" -le 10 ]]; then
     RECORD=$(curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" \
     --data '{"type":"A","name":"'${SUB_DOMAIN}'","content":"'${MYIP}'","ttl":0,"proxied":false}' | jq -r .result.id)
fi
RECORD=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records?name=*.${SUB_DOMAIN}" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" | jq -r .result[0].id)

if [[ "${#RECORD}" -le 10 ]]; then
     RECORD=$(curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" \
     --data '{"type":"A","name":"'*.${SUB_DOMAIN}'","content":"'${MYIP}'","ttl":0,"proxied":false}' | jq -r .result.id)
fi

RESULT=$(curl -sLX PUT "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records/${RECORD}" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" \
     --data '{"type":"A","name":"'${SUB_DOMAIN}'","content":"'${MYIP}'","ttl":0,"proxied":false}')

RESULT=$(curl -sLX PUT "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records/${RECORD}" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" \
     --data '{"type":"A","name":"'*.${SUB_DOMAIN}'","content":"'${MYIP}'","ttl":0,"proxied":false}')
echo "Host : $SUB_DOMAIN"
systemctl stop v2ray
systemctl stop v2ray@none
/root/.acme.sh/acme.sh --issue -d $SUB_DOMAIN --standalone -k ec-256
~/.acme.sh/acme.sh --installcert -d $SUB_DOMAIN --fullchainpath /etc/v2ray/v2ray.crt --keypath /etc/v2ray/v2ray.key --ecc
systemctl start v2ray
systemctl start v2ray@none
echo Done
sleep 0.5
clear 
echo $SUB_DOMAIN > /root/domain
echo $SUB_DOMAIN > /etc/v2ray/domain
rm -f /root/cf.sh
read -rp "Domain/Host: " -e host
echo "IP=$host" >>/var/lib/premium-script/ipvps.conf

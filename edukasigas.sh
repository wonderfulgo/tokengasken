#!/bin/bash
# Proxy For Edukasi & Imclass
# ==============================

clear

mkdir -p /etc/SweetieSSH/
wget -q -O /etc/SweetieSSH/proxy-edu.py https://raw.githubusercontent.com/wonderfulgo/tokengasken/main/proxy-edu.py
chmod +x /etc/SweetieSSH/proxy-edu.py
cd 

# Installing Service
cat > /etc/systemd/system/edu-proxy.service << END 
[Unit]
Description=Python Edu Proxy Service
Documentation=https://SweetieSSH
Documentation=https://github.com/PANCHO7532
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
NoNewPrivileges=true
ExecStart=python /etc/SweetieSSH/proxy-edu.py
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

systemctl enable edu-proxy
systemctl start edu-proxy

clear
echo "===========================" | tee -a install-edu-proxy.log
echo 'Penginstallan Telah Selesai' | tee -a install-edu-proxy.log
echo "===========================" | tee -a install-edu-proxy.log
echo "" | tee -a install-edu-proxy.log
echo "====================================================================" | tee -a install-edu-proxy.log
echo "'systemctl status edu-proxy'  = Melihat Status Proxy Jalan Atau Tidak" | tee -a install-edu-proxy.log
echo "'systemctl restart edu-proxy' = Restart Proxy Edu / Restarting" | tee -a install-edu-proxy.log
echo "'systemctl stop edu-proxy'    = Mematikan Proxy Edu / Stopping" | tee -a install-edu-proxy.log
echo "'systemctl disable edu-proxy' = Mematikan Autoruning Saat Startup" | tee -a install-edu-proxy.log
echo "====================================================================" | tee -a install-edu-proxy.log
echo "" | tee -a install-edu-proxy.log
echo "==========================================" | tee -a install-edu-proxy.log
echo "Jika TIdak Berjalan Silakan Buang Port 80" | tee -a install-edu-proxy.log
echo "==========================================" | tee -a install-edu-proxy.log
echo "Script By SweetieSSH" | tee -a install-edu-proxy.log
